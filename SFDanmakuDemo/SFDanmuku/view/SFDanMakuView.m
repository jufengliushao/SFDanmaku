//
//  SFDanMakuView.m
//  SFDanmakuDemo
//
//  Created by cnlive-lsf on 2017/6/15.
//  Copyright © 2017年 lsf. All rights reserved.
//

#import "SFDanMakuView.h"
#import "SFDanmakuInitFunction.h"
#import "SFDanmakuReuseFunction.h"
#import "SFDanmakuHelper.h"

@interface SFDanMakuView(){
    NSUInteger _dm_lines;
    CGFloat _dm_defaultHeight;
    NSMutableArray *_dm_linesHeights;
}

@end

@implementation SFDanMakuView

#pragma mark - system method
- (instancetype)init{
    if (self = [super init]) {
        _dm_lines = 0;
        _dm_defaultHeight = 60;
        _dm_linesHeights = [NSMutableArray arrayWithCapacity:0];
        [self dm_private_delegate_initMethods];
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

- (SFBaseDanmukuView *)dm_dequeueReusableCellWithIdentifier:(NSString *)identifier forIndex:(NSInteger)index{
    if (![[SFDanmakuInitFunction shareInstance] dm_isexist:identifier]) {
        return nil;
    }
    return [[SFDanmakuInitFunction shareInstance] dm_returnDMView:identifier];
}

#pragma mark - private method

#pragma mark - SFDanmakuDelegate
/**
 初始化弹幕
 */
- (void)dm_private_delegate_initMethods{
    if (self.delegate && [_delegate respondsToSelector:@selector(dm_numberOfDMRowInScreen)]) {
        _dm_lines = [self.delegate dm_numberOfDMRowInScreen];
        [[SFDanMuFunction shareInstance] dm_function_initForDMs:_dm_lines]; // 初始化弹道
    }else{
        Log(@"dm_numberOfDMRowInScreen %@", sf_waring_method);
        return;
    }
}

/**
 获取展示的view

 @param index <#index description#>
 */
- (void)dm_private_delegate_drawDMView:(NSInteger)index{
    if(self.delegate && [self.delegate respondsToSelector:@selector(dm_view:ForRowAtIndex:)]){
        SFBaseDanmukuView *tmpView = [self.delegate dm_view:self ForRowAtIndex:index];
    }else{
        Log(@"dm_view:ForRowAtIndex: %@", sf_waring_method);
        return;
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(dm_widthForDMViewAtIndex:)]) {
        CGFloat width = [self.delegate dm_widthForDMViewAtIndex:index];
    }else{
        Log(@"dm_widthForDMViewAtIndex: %@", sf_waring_method);
        return;
    }
}

/**
 获取当前展示vie的时间

 @param index <#index description#>
 */
- (void)dm_private_delegate_showTime:(NSInteger)index{
    if(self.delegate && [self.delegate respondsToSelector:@selector(dm_showTimeSeconds:)]){
        CGFloat time = [self.delegate dm_showTimeSeconds:index];
    }else{
        Log(@"dm_showTimeSeconds: %@", sf_waring_method);
        return;
    }
}

/**
 获得每个弹道的高度

 @param line <#line description#>
 @return <#return value description#>
 */
- (CGFloat)dm_private_delegate_heightLine:(NSInteger)line{
    if (_delegate && [_delegate respondsToSelector:@selector(dm_heightForDMRowInScreenAtLine:)]) {
        return [self.delegate dm_heightForDMRowInScreenAtLine:line];
    }
    return _dm_defaultHeight;
}



@end
