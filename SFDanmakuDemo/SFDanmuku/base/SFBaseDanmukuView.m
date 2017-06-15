//
//  SFBaseDanmukuView.m
//  SFDanmakuDemo
//
//  Created by cnlive-lsf on 2017/6/13.
//  Copyright © 2017年 lsf. All rights reserved.
//

#import "SFBaseDanmukuView.h"

@implementation SFBaseDanmukuView
- (instancetype)initWithReuseIdentifier:(NSString *)identifier{
    if (self = [super init]) {
        self.reuseIdentifier = identifier;
    }
    return self;
}

+(instancetype)initForNib:(UINib *)nib{
    return [[nib instantiateWithOwner:nil options:nil] lastObject];
}

@end
