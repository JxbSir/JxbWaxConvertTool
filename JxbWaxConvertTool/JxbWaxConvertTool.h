//
//  JxbWaxConvertTool.h
//  JxbWaxConvertTool
//
//  Created by Peter on 16/1/26.
//  Copyright © 2016年 Peter. All rights reserved.
//

#import <AppKit/AppKit.h>

@class JxbWaxConvertTool;

static JxbWaxConvertTool *sharedPlugin;

@interface JxbWaxConvertTool : NSObject

+ (instancetype)sharedPlugin;
- (id)initWithBundle:(NSBundle *)plugin;

@property (nonatomic, strong, readonly) NSBundle* bundle;
@end