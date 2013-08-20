//
//  main.m
//  Popup
//
//  Created by ying yuandong on 13-4-19.
//  Copyright (c) 2013年 ying yuandong. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

int main(int argc, char *argv[])
{
	NSString* arg;
	if(argc > 1)
	{
		CFStringRef str = (__bridge CFStringRef) [NSString stringWithCString:argv[1] encoding:NSUTF8StringEncoding];
		CFStringRef utf8str = CFURLCreateStringByAddingPercentEscapes(NULL,str,NULL,CFSTR(""),kCFStringEncodingUTF8);
		
		arg = (__bridge NSString*) utf8str;
	}else
	{
		arg = @"http://baidu.com";
	}
	
	
	
	NSApp = [NSApplication sharedApplication];
	AppDelegate* appDele = [[AppDelegate alloc] initWithArg:arg];
	
	[NSApp setDelegate:appDele];
	
	[NSApp run];
	
	return EXIT_SUCCESS;
	//return NSApplicationMain(argc, (const char **)argv);
}
