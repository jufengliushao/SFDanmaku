//
//  SFBaseDanmukuView.h
//  SFDanmakuDemo
//
//  Created by cnlive-lsf on 2017/6/13.
//  Copyright © 2017年 lsf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFBaseDanmukuView : UIView

/**
 弹幕view的重用标识
 */
@property (nonatomic, copy) NSString *reuseIdentifier;

/* ~~~~~~~~~~~~~~ATTENTION~~~~~~~~~~~~~~~~~~ */
/*
 **
 * xib文件，无需自己写初始化方法 注意在xib上进行标识
 * 代码文件，初始化方法只能为 init 不能修改
 **
 */
+(instancetype)initForNib:(UINib *)nib;
- (instancetype)initWithReuseIdentifier:(NSString *)identifier;
@end
