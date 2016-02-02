//
//  XBMainWC.m
//  JxbFirMan
//
//  Created by Peter Jin on https://github.com/JxbSir  16/1/126.
//  Copyright (c) 2015年 Peter Jin .  Mail:i@Jxb.name All rights reserved.
//

#import "XBMainWC.h"
#import <WebKit/WebKit.h>
#import <JavaScriptCore/JavaScriptCore.h>


@interface XBMainWC ()<WebFrameLoadDelegate>
@property (nonatomic, strong) WebView   *web;
@end

@implementation XBMainWC

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)windowDidLoad {
    [super windowDidLoad];
    NSBundle* bundle = [NSBundle bundleWithPath:@"~/Library/Application Support/Developer/Shared/Xcode/Plug-ins/JxbWaxConvertTool.xcplugin"];
    NSURL* path = [bundle URLForResource:@"oc2lua" withExtension:@"html"];
    NSURLRequest *request =  [[NSURLRequest alloc] initWithURL:path];
    
    self.web = [[WebView alloc] init];
    self.web.frameLoadDelegate = self;
    WebFrame* mainFrame = self.web.mainFrame;
    [mainFrame loadRequest:request];
}

+ (NSString*)webScriptNameForSelector:(SEL)sel {
    if(sel == @selector(alertError:)) //JS对应的本地函数
        return @"alert"; // 要注册的JS函数名
    return nil;
}

+ (BOOL)isSelectorExcludedFromWebScript:(SEL)sel {
    if(sel == @selector(alertError:))//JS对应的本地函数
        return NO;
    return YES; //返回 YES 表示函数被排除，不会在网页上注册
}

- (void)webView:(WebView *)sender didClearWindowObject:(WebScriptObject *)windowScriptObject forFrame:(WebFrame *)frame {
    [windowScriptObject setValue:self forKeyPath:@"window.external"]; // 注册一个 window.external 的 Javascript 类
}

- (void)alertError:(NSString*) txt {
   self.txtNew.string = txt;
}

- (void)btnConvertAction:(id)sender {
    NSString* script = [NSString stringWithFormat:@"ConvertOC2LUA('%@')",[self.txtOri.string stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"]];
    NSString* string = [self.web stringByEvaluatingJavaScriptFromString:script];
    self.txtNew.string = string;
}

@end
