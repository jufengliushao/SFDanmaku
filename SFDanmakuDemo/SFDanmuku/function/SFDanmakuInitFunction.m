//
//  SFDanmakuInitFunction.m
//  SFDanmakuDemo
//
//  Created by cnlive-lsf on 2017/6/13.
//  Copyright © 2017年 lsf. All rights reserved.
//

#import "SFDanmakuInitFunction.h"

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
@end
