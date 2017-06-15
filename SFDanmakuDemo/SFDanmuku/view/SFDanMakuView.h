//
//  SFDanMakuView.h
//  SFDanmakuDemo
//
//  Created by cnlive-lsf on 2017/6/15.
//  Copyright © 2017年 lsf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFBaseDanmukuView.h"

@class SFDanMakuView;

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
- (SFBaseDanmukuView *)dm_view:(SFDanMakuView *)dmView ForRowAtIndex:(NSInteger)index;
@end


@interface SFDanMakuView : UIView
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

/**
 返回对应的index的弹幕view
 
 @param identifier 唯一标示
 @param index index
 @return SFBaseDanmukuView 的子类
 */
- (__kindof SFBaseDanmukuView *)dm_dequeueReusableCellWithIdentifier:(NSString *)identifier forIndex:(NSInteger)index;
@end
