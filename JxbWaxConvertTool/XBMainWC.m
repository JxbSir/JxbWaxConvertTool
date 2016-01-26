//
//  XBMainWC.m
//  JxbFirMan
//
//  Created by Peter Jin on https://github.com/JxbSir  16/1/126.
//  Copyright (c) 2015年 Peter Jin .  Mail:i@Jxb.name All rights reserved.
//

#import "XBMainWC.h"
#import <WebKit/WebKit.h>


@interface XBMainWC ()
@property (nonatomic, strong) WebView   *web;
@end

@implementation XBMainWC

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)windowDidLoad {
    [super windowDidLoad];
    NSBundle* bundle = [NSBundle bundleWithPath:@"/Users/Peter/Library/Application Support/Developer/Shared/Xcode/Plug-ins/JxbWaxConvertTool.xcplugin"];
    NSURL* path = [bundle URLForResource:@"oc2lua" withExtension:@"html"];
    NSURLRequest *request =  [[NSURLRequest alloc] initWithURL:path];
    
    self.web = [[WebView alloc] init];
    WebFrame* mainFrame = self.web.mainFrame;
    [mainFrame loadRequest:request];

}

- (void)btnConvertAction:(id)sender {
    NSString* script = [NSString stringWithFormat:@"ConvertOC2LUA('%@')",[self.txtOri.string stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"]];
    NSString* string = [self.web stringByEvaluatingJavaScriptFromString:script];
    self.txtNew.string = string;
}

@end
