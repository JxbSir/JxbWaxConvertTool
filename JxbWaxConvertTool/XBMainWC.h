//
//  XBMainWC.h
//  JxbFirMan
//
//  Created by Peter Jin on https://github.com/JxbSir  15/5/18.
//  Copyright (c) 2015年 Peter Jin .  Mail:i@Jxb.name All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface XBMainWC : NSWindowController
@property (nonatomic, strong) IBOutlet  NSTextView  *txtOri;
@property (nonatomic, strong) IBOutlet  NSTextView  *txtNew;
@property (nonatomic, strong) IBOutlet  NSButton    *btnConvert;

- (IBAction)btnConvertAction:(id)sender;
@end
