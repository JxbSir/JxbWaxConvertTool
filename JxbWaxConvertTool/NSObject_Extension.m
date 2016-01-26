//
//  NSObject_Extension.m
//  JxbWaxConvertTool
//
//  Created by Peter Jin on https://github.com/JxbSir  16/1/126.
//  Copyright (c) 2015年 Peter Jin .  Mail:i@Jxb.name All rights reserved.
//


#import "NSObject_Extension.h"
#import "JxbWaxConvertTool.h"

@implementation NSObject (Xcode_Plugin_Template_Extension)

+ (void)pluginDidLoad:(NSBundle *)plugin
{
    static dispatch_once_t onceToken;
    NSString *currentApplicationName = [[NSBundle mainBundle] infoDictionary][@"CFBundleName"];
    if ([currentApplicationName isEqual:@"Xcode"]) {
        dispatch_once(&onceToken, ^{
            sharedPlugin = [[JxbWaxConvertTool alloc] initWithBundle:plugin];
        });
    }
}
@end
