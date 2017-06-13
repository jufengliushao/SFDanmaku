//
//  SFDanmakuReuseFunction.m
//  SFDanmakuDemo
//
//  Created by cnlive-lsf on 2017/6/13.
//  Copyright © 2017年 lsf. All rights reserved.
//

#import "SFDanmakuReuseFunction.h"

@interface SFDanmakuReuseFunction()

/**
 弹幕view重用池
 @-key 重用标识
 @-value 重用可变数组
 */
@property (nonatomic, strong) NSMutableDictionary *dm_reuseDic;

@end

SFDanmakuReuseFunction *reuseF = nil;

@implementation SFDanmakuReuseFunction
#pragma mark - system method
+(instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!reuseF) {
            reuseF = [[SFDanmakuReuseFunction alloc] init];
        }
    });
    return reuseF;
}


#pragma mark - public method
- (void)dm_registerKey:(NSString *)reuser{
    if (![self dm_existKey:reuser]) {
        // 不存在这个key进行添加
        NSMutableArray *tmp = [NSMutableArray arrayWithCapacity:0];
        [self.dm_reuseDic setObject:tmp forKey:reuser];
    }
}

- (void)dm_addReuseView:(SFBaseDanmukuView *)baseView{
    if ([self dm_existKey:baseView.reuseIdentifier]) {
        // 存在这个key 进行添加
        [self.dm_reuseDic[baseView.reuseIdentifier] addObject:baseView];
    }
}

- (BOOL)dm_existKey:(NSString *)key{
    return [self.dm_reuseDic.allKeys containsObject:key];
}

#pragma mark - private method
- (NSMutableDictionary *)dm_reuseDic{
    if (!_dm_reuseDic) {
        _dm_reuseDic = [NSMutableDictionary dictionary];
    }
    return _dm_reuseDic;
}
@end
