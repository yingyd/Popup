//
//  ViewController.m
//  Popup
//
//  Created by ying yuandong on 13-4-19.
//  Copyright (c) 2013年 ying yuandong. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
	return self;
}


- (void)viewDidLoad:(NSString*) url
{
	//NSURLRequest* req = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
	//[((WebView*)self.view).mainFrame loadRequest:req];
	
	NSURL* _url = [NSURL URLWithString:url];
	
	
	NSString* html = [NSString stringWithContentsOfURL:_url encoding:NSUTF8StringEncoding error:nil];
	
	html = [html stringByReplacingOccurrencesOfString:@"topImgAd" withString:@""];
	html = [html stringByReplacingOccurrencesOfString:@"id=\"ads\"" withString:@"id=\"ads\" style=\"display:none\""];
	html = [html stringByReplacingOccurrencesOfString:@"</body>" withString:@"<script type=\"text/javascript\">setTimeout(function(){window.scrollTo(120,120);},10);</script></body>"];
	
	NSLog(@"%@",@"viewDidLoad");
	
	[((WebView*)self.view).mainFrame loadHTMLString:html baseURL:_url];
	
}

-(void) loadWebHtml:(NSString*) html baseURL:(NSString*) baseUrl
{
	[((WebView*)self.view).mainFrame loadHTMLString:html baseURL:[NSURL URLWithString:baseUrl]];
}


@end
