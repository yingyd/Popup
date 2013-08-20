//
//  AppDelegate.m
//  Popup
//
//  Created by ying yuandong on 13-4-19.
//  Copyright (c) 2013年 ying yuandong. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
{
	NSString* html;
}

@synthesize arg = _arg;

-(id) initWithArg:(NSString*)arg
{
	_arg = arg;
	return [self init];
}

- (id) init
{
	if(!self)
	{
		self = [super init];
	}
	html = nil;
	
	[self performSelectorInBackground:@selector(loadURL) withObject:nil];
	
	self.viewController = [[ViewController alloc] init];
	
	return self;
}

-(void) loadURL
{

	//NSURL* _url = [NSURL URLWithString:_arg];
	NSURL* _url = [NSURL URLWithString:@"http://baidu.com"];
    NSLog(@"%@",_url);
	
	NSString* _html = [NSString stringWithContentsOfURL:_url encoding:NSUTF8StringEncoding error:nil];
	
	_html = [_html stringByReplacingOccurrencesOfString:@"topImgAd" withString:@""];
	_html = [_html stringByReplacingOccurrencesOfString:@"id=\"ads\"" withString:@"id=\"ads\" style=\"display:none\""];
	_html = [_html stringByReplacingOccurrencesOfString:@"</body>" withString:@"<script type=\"text/javascript\">setTimeout(function(){window.scrollTo(120,120);},10);</script></body>"];
	
	html = _html;
	//NSLog(@"%@",@"ok");
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{

	[NSBundle loadNibNamed:@"MainMenu" owner:self];
	
	//强制激活
	[[NSRunningApplication currentApplication] activateWithOptions: NSApplicationActivateIgnoringOtherApps]; 
	
	/*[NSEvent addLocalMonitorForEventsMatchingMask:NSKeyDownMask handler:^NSEvent* (NSEvent* e)
	{
		NSUInteger flags = [e modifierFlags] & NSDeviceIndependentModifierFlagsMask;
		if(flags & NSCommandKeyMask)
		{
			if ([e.characters rangeOfString:@"w"].location != NSNotFound || [e.characters rangeOfString:@"W"].location != NSNotFound)
			{
				//[self.window performClose:self];
                [self.window close];
                
			}
            //把默认按键事件转发到webview
            else
            {
                [self.webView keyDown:e];
            }
		}

		return e;
	}];*/
	
	NSPoint mouseLoc = [NSEvent mouseLocation];
	NSSize orgSize = self.window.frame.size;
	
	[self.window setFrame:NSMakeRect(mouseLoc.x, mouseLoc.y - orgSize.height, orgSize.width, orgSize.height) display:NO];
	
	[self.window makeKeyAndOrderFront:self];
	
	self.viewController.view = self.webView;
	
	int count = 0;
	while (html == nil)
	{
		if(html != nil || count++ > 1000) break;
		usleep(200);
		
	}
	
	if(html != nil)
	{
		[self.viewController loadWebHtml:html baseURL:self.arg];
		
	}else
	{
		[self.viewController viewDidLoad:self.arg];
	}
	
}

- (void)windowDidResignKey:(NSNotification *)notification
{
	[self.window close];
}

- (void)windowWillClose:(NSNotification *)notification
{
    NSLog(@"Window Will Close");
	[NSApp terminate:self];
}



@end
