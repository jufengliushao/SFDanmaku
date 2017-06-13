//
//  SFDanMuFunction.h
//  SFDanmakuDemo
//
//  Created by cnlive-lsf on 2017/6/13.
//  Copyright © 2017年 lsf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol SFDanmakuDelegate <NSObject>

@optional


@required
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
@end
