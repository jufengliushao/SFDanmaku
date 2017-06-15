//
//  SFDanMuFunction.m
//  SFDanmakuDemo
//
//  Created by cnlive-lsf on 2017/6/13.
//  Copyright © 2017年 lsf. All rights reserved.
//

#import "SFDanMuFunction.h"

@interface SFDanMuFunction()

@end

SFDanMuFunction *function = nil;

@implementation SFDanMuFunction
+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!function) {
            function = [[SFDanMuFunction alloc] init];
        }
    });
    return function;
}


@end
