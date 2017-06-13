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
 注册nib文件 
 此方法不进行重复性检查，请在调用此方法前进行检测

 @param nib UINib
 @param identifier 重用
 */
- (void)dm_registerNibFile:(UINib *)nib identifier:(NSString *)identifier;

/**
 注册code文件
 此方法不进行重复性检查，请在调用此方法前进行检测

 @param codeClass code-class
 @param identifier 重用
 */
- (void)dm_registerCodeFile:(Class)codeClass identifier:(NSString *)identifier;

/**
 返回对应文件名的类型

 @param identifier 文件名
 @return SFDM_INIT_TYPE
 */
- (SFDM_INIT_TYPE)dm_returnFileType:(NSString *)identifier;

/**
 identifier 重复性检验 唯一

 @param identifier identifier
 @return YES-重复 NO
 */
- (BOOL)dm_isexist:(NSString *)identifier;
@end
