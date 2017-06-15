//
//  ViewController.m
//  SFDanmakuDemo
//
//  Created by cnlive-lsf on 2017/6/13.
//  Copyright © 2017年 lsf. All rights reserved.
//

#import "ViewController.h"
#import "SFDanmakuHelper.h"
#import "SFDanMakuView.h"

#import "SFDanmaTextView.h"
@interface ViewController ()<SFDanmakuDelegate>
@property (nonatomic, strong) SFDanMakuView *dmFunction;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dmFunction.delegate = self;
    [self.dmFunction dm_registerClass:[SFDanmaTextView class] forViewReuseIdentifier:@"aaaa"];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SFDanmakuDelegate
- (NSInteger)dm_numberOfDMRowInScreen{
    return 1;
}

- (CGFloat)dm_heightForDMRowInScreenAtLine:(NSInteger)indexLine{
    return 50;
}

- (CGFloat)dm_widthForDMViewAtIndex:(NSInteger)index{
    return 200;
}

- (SFBaseDanmukuView *)dm_view:(SFDanMakuView *)dmView ForRowAtIndex:(NSInteger)index{
    SFDanmaTextView *view = [dmView dm_dequeueReusableCellWithIdentifier:@"aaaa" forIndex:index];
    return view;
}

#pragma mark - private method
-(SFDanMakuView *)dmFunction{
    if (!_dmFunction) {
        _dmFunction = [[SFDanMakuView alloc] init];
    }
    return _dmFunction;
}
@end
