//
//  AppDelegate.h
//  Popup
//
//  Created by ying yuandong on 13-4-19.
//  Copyright (c) 2013年 ying yuandong. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>
#import "ViewController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate,NSWindowDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (weak) IBOutlet WebView* webView;

@property (strong) ViewController* viewController;

-(id) initWithArg:(NSString*)arg;

@property (copy) NSString* arg;

@end
