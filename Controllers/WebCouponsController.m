//
//  WebCouponsController.m
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-17.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import "WebCouponsController.h"


@implementation WebCouponsController

@synthesize webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      self.title = NSLocalizedString(@"coupons", nil);
      UIImage* image = [UIImage imageNamed:@"coupon.png"];
      self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:self.title image:image tag:0] autorelease];      
    }
    return self;
}

- (void)dealloc {
  [webView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
  NSString *current_lang = [[NSLocale preferredLanguages] objectAtIndex:0];  
  self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc]  
                                             initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh 
                                             target:self 
                                             action:@selector(refresh)] autorelease];  
  
	CGRect webFrame = [[UIScreen mainScreen] applicationFrame];
	webFrame.origin.y -= 20.0;
    //	webFrame.size.height -= 40.0;
	self.webView = [[[UIWebView alloc] initWithFrame:webFrame] autorelease];
	self.webView.backgroundColor = [UIColor whiteColor];
	self.webView.scalesPageToFit = YES;
	self.webView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
	self.webView.delegate = self;
	[self.view addSubview:self.webView];
  if ([current_lang rangeOfString:@"zh-Han"].location != NSNotFound) {
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://thecarnaby.koocaa.com/published_coupons.iphone?lang=zh"]]];    
  }else{
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://thecarnaby.koocaa.com/published_coupons.iphone"]]];    
  }
}

- (void)refresh {
  NSString *current_lang = [[NSLocale preferredLanguages] objectAtIndex:0];    
  if ([current_lang rangeOfString:@"zh-Han"].location != NSNotFound) {
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://thecarnaby.koocaa.com/published_coupons.iphone?lang=zh"]]];    
  }else{
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://thecarnaby.koocaa.com/published_coupons.iphone"]]];    
  }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView {
    // starting the load, show the activity indicator in the status bar
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    // finished loading, hide the activity indicator in the status bar
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
  NSString *current_lang = [[NSLocale preferredLanguages] objectAtIndex:0];
  NSString* errorString = @"";
    // load error, hide the activity indicator in the status bar
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
  
    // report the error inside the webview
  if ([current_lang rangeOfString:@"zh-Han"].location != NSNotFound) {
    errorString = [NSString stringWithFormat:
                   @"<html><center><font size=+5 color='red'>出错，暂时无法访问:<br>%@</font></center></html>",
                   error.localizedDescription];
  }else{
    errorString = [NSString stringWithFormat:
                   @"<html><center><font size=+5 color='red'>An error occurred, temporary unavaliable:<br>%@</font></center></html>",
                   error.localizedDescription];    
  }
	[self.webView loadHTMLString:errorString baseURL:nil];
}

@end
