//
//  SFDanmakuInitFunction.m
//  SFDanmakuDemo
//
//  Created by cnlive-lsf on 2017/6/13.
//  Copyright © 2017年 lsf. All rights reserved.
//

#import "SFDanmakuInitFunction.h"
#import "SFDanmakuReuseFunction.h"
@interface SFDanmakuInitFunction()

/**
 nib文件数组
 */
@property (nonatomic, strong) NSMutableDictionary *dm_nibDic;

/**
 代码文件数组
 */
@property (nonatomic, strong) NSMutableDictionary *dm_codeDic;
@end

SFDanmakuInitFunction *initF = nil;

@implementation SFDanmakuInitFunction
#pragma mark - system method
+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!initF) {
            initF = [[SFDanmakuInitFunction alloc] init];
        }
    });
    return initF;
}

#pragma mark - public method
- (void)dm_registerNibFile:(UINib *)nib identifier:(NSString *)identifier{
    [self.dm_nibDic setObject:nib forKey:identifier];
}

- (void)dm_registerCodeFile:(Class)codeClass identifier:(NSString *)identifier{
    [self.dm_codeDic setObject:codeClass forKey:identifier];
}

- (BOOL)dm_isexist:(NSString *)identifier{
    return [self.dm_codeDic.allKeys containsObject:identifier] || [self.dm_nibDic.allKeys containsObject:identifier];
}

- (SFDM_INIT_TYPE)dm_returnFileType:(NSString *)identifier{
    if ([self.dm_codeDic.allKeys containsObject:identifier]) {
        return SFDM_INIT_TYPE_CODE;
    }
    
    return SFDM_INIT_TYPE_NIB;
}

- (__kindof SFBaseDanmukuView *)dm_returnDMView:(NSString *)identifier{
    SFBaseDanmukuView *tmp_view = [[SFDanmakuReuseFunction shareInstance] dm_returnReuseView:identifier];
    return tmp_view ? tmp_view : [self dm_private_createNewView:identifier];
}
#pragma mark - private method
-(NSMutableDictionary *)dm_nibDic{
    if (!_dm_nibDic) {
        _dm_nibDic = [NSMutableDictionary dictionary];
    }
    return _dm_nibDic;
}


- (NSMutableDictionary *)dm_codeDic{
    if (!_dm_codeDic) {
        _dm_codeDic = [NSMutableDictionary dictionary];
    }
    return _dm_codeDic;
}

- (__kindof SFBaseDanmukuView *)dm_private_createNewView:(NSString *)identifier{
    SFDM_INIT_TYPE dm_type = [self dm_returnFileType:identifier];
    if (dm_type == SFDM_INIT_TYPE_NIB) {
        UINib *tmp_nib = self.dm_nibDic[identifier];
        return [[tmp_nib instantiateWithOwner:nil options:nil] lastObject];
    }else if (dm_type == SFDM_INIT_TYPE_CODE){
        Class tmp_class = self.dm_codeDic[identifier];
        return [[tmp_class alloc] init];
    }
    return nil;
}
@end
