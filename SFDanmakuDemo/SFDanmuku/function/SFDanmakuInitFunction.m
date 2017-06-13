//
//  SFDanmakuInitFunction.m
//  SFDanmakuDemo
//
//  Created by cnlive-lsf on 2017/6/13.
//  Copyright © 2017年 lsf. All rights reserved.
//

#import "SFDanmakuInitFunction.h"

@interface SFDanmakuInitFunction()

/**
 nib文件数组
 */
@property (nonatomic, strong) NSMutableArray *dm_nibArr;

/**
 代码文件数组
 */
@property (nonatomic, strong) NSMutableArray *dm_codeArr;
@end

SFDanmakuInitFunction *initF = nil;

@implementation SFDanmakuInitFunction
#pragma mark - system method
+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!initF) {
            initF = [[SFDanmakuInitFunction alloc] init];
        }
    });
    return initF;
}

#pragma mark - public method
- (void)dm_registerFile:(NSString *)fileName type:(SFDM_INIT_TYPE)type{
    if ([self dm_returnFileType:fileName]) {
        // 如果文件已经注册过，不进行添加
        return;
    }
    
    if (type == SFDM_INIT_TYPE_NIB) {
        // nib
        [self.dm_nibArr addObject:fileName];
    }else if (type == SFDM_INIT_TYPE_CODE){
        // code
        [self.dm_codeArr addObject:fileName];
    }
}

- (SFDM_INIT_TYPE)dm_returnFileType:(NSString *)file{
    if ([self.dm_codeArr containsObject:file]) {
        return SFDM_INIT_TYPE_CODE;
    }else if ([self.dm_nibArr containsObject:file]){
        return SFDM_INIT_TYPE_NIB;
    }
    return -1;
}



#pragma mark - private method
- (NSMutableArray *)dm_nibArr{
    if (!_dm_nibArr) {
        _dm_nibArr = [NSMutableArray arrayWithCapacity:0];
    }
    return _dm_nibArr;
}


- (NSMutableArray *)dm_codeArr{
    if (!_dm_codeArr) {
        _dm_codeArr = [NSMutableArray arrayWithCapacity:0];
    }
    return _dm_codeArr;
}
@end
