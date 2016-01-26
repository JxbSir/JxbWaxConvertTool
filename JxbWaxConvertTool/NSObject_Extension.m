//
//  NSObject_Extension.m
//  JxbWaxConvertTool
//
//  Created by Peter on 16/1/26.
//  Copyright © 2016年 Peter. All rights reserved.
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
