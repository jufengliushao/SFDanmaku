//
//  SFDanMuFunction.h
//  SFDanmakuDemo
//
//  Created by cnlive-lsf on 2017/6/13.
//  Copyright © 2017年 lsf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SFDanMuFunction : NSObject

/**
 初始化方法

 @return instancetype
 */
+ (instancetype)shareInstance;

/**
 初始化弹道数目

 @param dms 弹道总数
 */
- (void)dm_function_initForDMs:(NSUInteger)dms;
@end
