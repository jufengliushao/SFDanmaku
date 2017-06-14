//
//  SFDanMuFunction.m
//  SFDanmakuDemo
//
//  Created by cnlive-lsf on 2017/6/13.
//  Copyright © 2017年 lsf. All rights reserved.
//

#import "SFDanMuFunction.h"
#import "SFDanmakuReuseFunction.h"
#import "SFDanmakuHelper.h"
@interface SFDanMuFunction(){
    NSUInteger _dm_lines;
}

@end

@implementation SFDanMuFunction
#pragma mark - system method
- (instancetype)init{
    if (self = [super init]) {
        [self dm_delegate_initMethods];
    }
    return self;
}
#pragma mark - public method
- (void)dm_registerNib:(UINib *)nib forViewReuseIdentifier:(NSString *)identifier{
    if (!nib || !identifier || [[SFDanmakuInitFunction shareInstance] dm_isexist:identifier]) {
        // nib identifier 有为空值 or identifier 重复 必须检验，请勿修改
        return;
    }
    
    [[SFDanmakuInitFunction shareInstance] dm_registerNibFile:nib identifier:identifier];
    [[SFDanmakuReuseFunction shareInstance] dm_registerKey:identifier];
}

- (void)dm_registerClass:(Class)viewClass forViewReuseIdentifier:(NSString *)identifier{
    if (!viewClass || !identifier || [[SFDanmakuInitFunction shareInstance] dm_isexist:identifier]) {
        // class identifier 有为空值 or identifier 重复 必须检验，请勿修改
        return;
    }
    
    [[SFDanmakuInitFunction shareInstance] dm_registerCodeFile:viewClass identifier:identifier];
    [[SFDanmakuReuseFunction shareInstance] dm_registerKey:identifier];
}


#pragma mark - SFDanmakuDelegate
- (void)dm_delegate_initMethods{
    if (self.delegate && [_delegate respondsToSelector:@selector(dm_numberOfDMRowInScreen)]) {
        [self.delegate dm_numberOfDMRowInScreen];
    }else{
        Log(@"dm_numberOfDMRowInScreen %@", sf_waring_method);
    }
}
@end
