//
//  SFDanmaTextView.m
//  SFDanmakuDemo
//
//  Created by cnlive-lsf on 2017/6/15.
//  Copyright © 2017年 lsf. All rights reserved.
//

#import "SFDanmaTextView.h"

@implementation SFDanmaTextView
- (instancetype)initWithReuseIdentifier:(NSString *)identifier{
    if (self = [super initWithReuseIdentifier:identifier]) {
        self.commentLabel = [[UILabel alloc] init];
        self.backgroundColor = [UIColor redColor];
        [self addSubview:self.commentLabel];
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    self.commentLabel.frame = self.bounds;
    [super drawRect:rect];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
