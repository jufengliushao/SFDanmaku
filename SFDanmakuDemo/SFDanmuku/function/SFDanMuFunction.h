//
//  SFDanMuFunction.h
//  SFDanmakuDemo
//
//  Created by cnlive-lsf on 2017/6/13.
//  Copyright © 2017年 lsf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class SFBaseDanmukuView;

@protocol SFDanmakuDelegate <NSObject>

@optional
/**
 返回每行的弹幕高度
 default 60
 @return 返回高度
 */
- (CGFloat)dm_heightForDMRowInScreenAtLine:(NSInteger)indexLine;

@required
/**
 返回屏幕上总共有多少行，默认为5行
 
 @return 行数
 */
- (NSInteger)dm_numberOfDMRowInScreen;

/**
 返回对应的弹幕view

 @param index 将要出现的弹幕的数量
 @return SFBaseDanmukuView
 */
- (SFBaseDanmukuView *)dm_viewForRowAtIndex:(NSInteger)index;
@end

@interface SFDanMuFunction : NSObject
@property (nonatomic, weak) id <SFDanmakuDelegate>delegate;

/**
 注册nib弹幕文件的方法
 
 @param nib UINib 对象
 @param identifier identifier 重用标识
 */
- (void)dm_registerNib:(UINib *)nib forViewReuseIdentifier:(NSString *)identifier;

/**
 注册code文件的方法
 
 @param viewClass Class
 @param identifier identifier 重用标识
 */
- (void)dm_registerClass:(Class)viewClass forViewReuseIdentifier:(NSString *)identifier;

- (SFBaseDanmukuView *)dm_dequeueReusableCellWithIdentifier:(NSString *)identifier forIndex:(NSInteger)index;
@end
