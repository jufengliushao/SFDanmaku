//
//  SFDanMuFunction.m
//  SFDanmakuDemo
//
//  Created by cnlive-lsf on 2017/6/13.
//  Copyright © 2017年 lsf. All rights reserved.
//

#import "SFDanMuFunction.h"

struct {
    NSInteger indexLine; /* 当前行 */
    BOOL isEmpty; /* 意为当前行是否没有弹幕显示 */
    NSUInteger priority; /* 优先级
                          * 当前弹道内没有弹幕 1 ------------------- hight
                          * 弹道内有弹道且无后续弹幕排队 2 ----------- middle
                          * 弹道内有弹幕并且有弹幕在等待进入 3 -------- low
                          */
}DM_LINE_TYPE;

@interface SFDanMuFunction()

@end

SFDanMuFunction *function = nil;

@implementation SFDanMuFunction
#pragma mark - system method
+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!function) {
            function = [[SFDanMuFunction alloc] init];
        }
    });
    return function;
}

#pragma mark - public method
- (NSInteger)dm_returnDMLineEmpty{
    return 1;
}
@end
