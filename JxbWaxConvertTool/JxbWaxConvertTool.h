//
//  JxbWaxConvertTool.h
//  JxbWaxConvertTool
//
//  Created by Peter Jin on https://github.com/JxbSir  16/1/126.
//  Copyright (c) 2015年 Peter Jin .  Mail:i@Jxb.name All rights reserved.
//

#import <AppKit/AppKit.h>

@class JxbWaxConvertTool;

static JxbWaxConvertTool *sharedPlugin;

@interface JxbWaxConvertTool : NSObject

+ (instancetype)sharedPlugin;
- (id)initWithBundle:(NSBundle *)plugin;

@property (nonatomic, strong, readonly) NSBundle* bundle;
@end