//
//  SFDanmakuInitFunction.h
//  SFDanmakuDemo
//
//  Created by cnlive-lsf on 2017/6/13.
//  Copyright © 2017年 lsf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SFBaseDanmukuView.h"

typedef NS_ENUM(NSUInteger, SFDM_INIT_TYPE) {
    SFDM_INIT_TYPE_NIB = 1, /* nib文件类型 */
    SFDM_INIT_TYPE_CODE /* code文件类型 */
};

@interface SFDanmakuInitFunction : NSObject

/**
 初始化通用方法

 @return 实例对象
 */
+ (instancetype)shareInstance;

/**
 注册文件

 @param fileName 文件名
 @param type 类型
 */
- (void)dm_registerFile:(NSString *)fileName type:(SFDM_INIT_TYPE)type;

/**
 返回对应文件名的类型

 @param file 文件名
 @return SFDM_INIT_TYPE
 */
- (SFDM_INIT_TYPE)dm_returnFileType:(NSString *)file;
@end
