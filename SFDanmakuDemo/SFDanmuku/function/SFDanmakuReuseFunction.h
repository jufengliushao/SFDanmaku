//
//  SFDanmakuReuseFunction.h
//  SFDanmakuDemo
//
//  Created by cnlive-lsf on 2017/6/13.
//  Copyright © 2017年 lsf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SFBaseDanmukuView.h"
#import "SFDanmakuInitFunction.h"
@interface SFDanmakuReuseFunction : NSObject

/**
 初始化重用功能类
 @- 全局重用，请保持重用标识唯一

 @return 重用实例对象
 */
+(instancetype)shareInstance;

/**
 注册key需要调用的方法

 @param reuser 注册的key 重用标识
 */
- (void)dm_registerKey:(NSString *)reuser;

/**
 当view不使用的时候，添加到冲泳池中

 @param baseView SFBaseDanmukuView
 */
- (void)dm_addReuseView:(SFBaseDanmukuView *)baseView;

/**
 判断重用标识是否注册过

 @param key 重用标识
 @return YES-注册过 NO-未注册
 */
- (BOOL)dm_existKey:(NSString *)key;

@end
