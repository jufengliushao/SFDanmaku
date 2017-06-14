//
//  SFDanmakuHelper.h
//  SFDanmakuDemo
//
//  Created by cnlive-lsf on 2017/6/14.
//  Copyright © 2017年 lsf. All rights reserved.
//

#ifndef SFDanmakuHelper_h
#define SFDanmakuHelper_h

#if DEBUG

#define Log(FORMAT, ...) fprintf(stderr,"[%s:%d行] %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#define sf_waring_method @"PLEASE REALIZE THE METHOD"

#else

#define NSLog(FORMAT, ...) nil
#define sf_waring_method @""

#endif


#endif /* SFDanmakuHelper_h */
