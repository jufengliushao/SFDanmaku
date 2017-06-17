//
//  SFDanMuFunction.m
//  SFDanmakuDemo
//
//  Created by cnlive-lsf on 2017/6/13.
//  Copyright © 2017年 lsf. All rights reserved.
//

#import "SFDanMuFunction.h"

typedef struct {
    NSInteger indexLine; /* 当前行 */
    BOOL isEmpty; /* 意为当前行是否没有弹幕显示 */
    NSUInteger priority; /* 优先级
                          * 当前弹道内没有弹幕 1 ------------------- hight
                          * 弹道内有弹道且无后续弹幕排队 2 ----------- middle
                          * 弹道内有弹幕并且有弹幕在等待进入 3 -------- low
                          */
}DM_LINE_TYPE;

@interface SFDanMuFunction(){
    
}
@property (nonatomic, strong) NSMutableDictionary *dmStatusDic;

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

- (void)dm_function_initForDMs:(NSUInteger)dms{
    for (int i = 0; i < dms; i ++) {
        DM_LINE_TYPE line = {i, YES, 1};
        [self dm_private_saveLine:line];
    }
}

#pragma mark - private method
- (NSMutableDictionary *)dmStatusDic{
    if (!_dmStatusDic) {
        _dmStatusDic = [NSMutableDictionary dictionary];
    }
    return _dmStatusDic;
}

- (void)dm_private_saveLine:(DM_LINE_TYPE)line{
     [self.dmStatusDic setObject:[NSNumber numberWithInteger:line.indexLine] forKey:[NSValue valueWithBytes:&line objCType:@encode(DM_LINE_TYPE)]];
}

- (DM_LINE_TYPE)dm_private_getLine:(NSInteger)index{
    DM_LINE_TYPE line;
    [[self.dmStatusDic objectForKey:[NSNumber numberWithInteger:index]] getValue:&line];
    return line;
}
@end
