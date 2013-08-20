//
//  ViewController.h
//  Popup
//
//  Created by ying yuandong on 13-4-19.
//  Copyright (c) 2013年 ying yuandong. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
- (void)viewDidLoad:(NSString*) url;
-(void) loadWebHtml:(NSString*) html baseURL:(NSString*) baseUrl;
@end
