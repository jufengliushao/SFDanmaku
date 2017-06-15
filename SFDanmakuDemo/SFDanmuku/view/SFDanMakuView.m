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

- (SFBaseDanmukuView *)dm_dequeueReusableCellWithIdentifier:(NSString *)identifier forIndex:(NSInteger)index{
    if (![[SFDanmakuInitFunction shareInstance] dm_isexist:identifier]) {
        return nil;
    }
    return [[SFDanmakuInitFunction shareInstance] dm_returnDMView:identifier];
}
#pragma mark - SFDanmakuDelegate
- (void)dm_delegate_initMethods{
    if (self.delegate && [_delegate respondsToSelector:@selector(dm_numberOfDMRowInScreen)]) {
        _dm_lines = [self.delegate dm_numberOfDMRowInScreen];
    }else{
        Log(@"dm_numberOfDMRowInScreen %@", sf_waring_method);
        return;
    }
}

- (void)dm_private_delegate_drawDMView:(NSInteger)index{
    if(self.delegate && [self.delegate respondsToSelector:@selector(dm_view:ForRowAtIndex:)]){
        SFBaseDanmukuView *tmpView = [self.delegate dm_view:self ForRowAtIndex:index];
    }
}
#pragma mark - private method
- (CGFloat)dm_private_heightLine:(NSInteger)line{
    if (_delegate && [_delegate respondsToSelector:@selector(dm_heightForDMRowInScreenAtLine:)]) {
        return [self.delegate dm_heightForDMRowInScreenAtLine:line];
    }
    return _dm_defaultHeight;
}

@end
