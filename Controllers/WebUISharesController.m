//
//  WebSharesController.m
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-17.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import "WebUISharesController.h"


@implementation WebUISharesController

@synthesize webView, count;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    self.title = NSLocalizedString(@"shares", nil);      
    UIImage* image = [UIImage imageNamed:@"share.png"];      
    self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:self.title image:image tag:0] autorelease];
      //  NSString *current_lang = [[NSLocale preferredLanguages] objectAtIndex:0];
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc]  
                                               initWithImage:image style:UIBarButtonSystemItemEdit
                                               target:self 
                                               action:@selector(refresh)] autorelease];
  }
  return self;
}

- (void)dealloc
{
  [count release];
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
- (void)loadView {
// [[TTNavigator navigator] openURLAction:[TTURLAction actionWithURLPath:@"http://github.com/jverkoey"]];
   self.webView = [[UIWebView alloc] initWithFrame:TTToolbarNavigationFrame()];
   self.webView.delegate = self;
   self.webView.autoresizingMask = UIViewAutoresizingFlexibleWidth
   | UIViewAutoresizingFlexibleHeight;
   self.webView.scalesPageToFit = YES;
   [self.view addSubview:self.webView];
   
//   UIActivityIndicatorView* spinner = [[[UIActivityIndicatorView alloc]
//                                        initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite] autorelease];
//   [spinner startAnimating];
//   _activityItem = [[UIBarButtonItem alloc] initWithCustomView:spinner];
   
   _backButton = [[UIBarButtonItem alloc] initWithImage:
                  TTIMAGE(@"bundle://Three20.bundle/images/backIcon.png")
                                                  style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
   _backButton.tag = 2;
   _backButton.enabled = NO;
   _forwardButton = [[UIBarButtonItem alloc] initWithImage:
                     TTIMAGE(@"bundle://Three20.bundle/images/forwardIcon.png")
                                                     style:UIBarButtonItemStylePlain target:self action:@selector(forwardAction)];
   _forwardButton.tag = 1;
   _forwardButton.enabled = NO;
   _refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:
                     UIBarButtonSystemItemRefresh target:self action:@selector(refreshAction)];
   _refreshButton.tag = 3;
   _stopButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:
                  UIBarButtonSystemItemStop target:self action:@selector(stopAction)];
   _stopButton.tag = 3;
   _actionButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:
                    UIBarButtonSystemItemAction target:self action:@selector(shareAction)];
   
   UIBarItem* space = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:
                        UIBarButtonSystemItemFlexibleSpace target:nil action:nil] autorelease];
   
   _toolbar = [[UIToolbar alloc] initWithFrame:
               CGRectMake(0, self.view.height - TTToolbarHeight(), self.view.width, TTToolbarHeight())];
   _toolbar.autoresizingMask =
   UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
   _toolbar.tintColor = TTSTYLEVAR(toolbarTintColor);
   _toolbar.items = [NSArray arrayWithObjects:
                     _backButton, space, _forwardButton, space, _refreshButton, space, _actionButton, nil];
   [self.view addSubview:_toolbar];
}
*/

-(void)viewDidLoad{
  self.webView = [[UIWebView alloc] initWithFrame:TTToolbarNavigationFrame()];
  self.webView.delegate = self;
//  self.webView.autoresizingMask = UIViewAutoresizingFlexibleWidth
//  | UIViewAutoresizingFlexibleHeight;
//  self.webView.scalesPageToFit = YES;
  [self.view addSubview:self.webView];
  
  UIActivityIndicatorView* spinner = [[[UIActivityIndicatorView alloc]
                                        initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite] autorelease];
  [spinner startAnimating];
  _activityItem = [[UIBarButtonItem alloc] initWithCustomView:spinner];
  
  _backButton = [[UIBarButtonItem alloc] initWithImage:
                 TTIMAGE(@"bundle://Three20.bundle/images/backIcon.png")
                                                 style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
  _backButton.tag = 2;
//  _backButton.enabled = NO;
  _forwardButton = [[UIBarButtonItem alloc] initWithImage:
                    TTIMAGE(@"bundle://Three20.bundle/images/forwardIcon.png")
                                                    style:UIBarButtonItemStylePlain target:self action:@selector(forwardAction)];
  _forwardButton.tag = 1;
//  _forwardButton.enabled = NO;
  _refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:
                    UIBarButtonSystemItemRefresh target:self action:@selector(refreshAction)];
  _refreshButton.tag = 3;
  _stopButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:
                 UIBarButtonSystemItemStop target:self action:@selector(stopAction)];
  _stopButton.tag = 3;
//  _actionButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:
//                   UIBarButtonSystemItemAction target:self action:@selector(shareAction)];
  
  UIBarItem* space = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:
                       UIBarButtonSystemItemFlexibleSpace target:nil action:nil] autorelease];
  
  _toolbar = [[UIToolbar alloc] initWithFrame:
              CGRectMake(0, self.view.height - TTToolbarHeight(), self.view.width, TTToolbarHeight())];
  _toolbar.autoresizingMask =
  UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
  _toolbar.tintColor = TTSTYLEVAR(toolbarTintColor);
  _toolbar.items = [NSArray arrayWithObjects:
                    _backButton, space, _forwardButton, space, _refreshButton, nil];
  [self.view addSubview:_toolbar];
  [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://thecarnaby.koocaa.com/shares.iphone"]]];
  
}

/*
 -(void)viewWillAppear:(BOOL)animated {
 [[TTNavigator navigator] openURLAction:[TTURLAction actionWithURLPath:@"http://thecarnaby.koocaa.com/shares.iphone"]];  
 }*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
  CGRect webFrame = [[UIScreen mainScreen] applicationFrame];
  webFrame.origin.y -= 20.0;
  //	webFrame.size.height -= 40.0;
  self.webView = [[[UIWebView alloc] initWithFrame:webFrame] autorelease];
  self.webView.backgroundColor = [UIColor whiteColor];
  //	self.webView.scalesPageToFit = YES;
  self.webView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
  self.webView.delegate = self;
  [self.view addSubview:self.webView];
  //  if ([current_lang rangeOfString:@"zh-Han"].location != NSNotFound) {
  //    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://thecarnaby.koocaa.com/shares.iphone?lang=zh"]]];    
  //  }else{
  [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://thecarnaby.koocaa.com/shares.iphone"]]];
  //  }
  self.count = [NSNumber numberWithInt:0];
}
*/ 

- (void)refresh {
  self.count = [NSNumber numberWithInt:0];
    //  NSString *current_lang = [[NSLocale preferredLanguages] objectAtIndex:0];    
    //  if ([current_lang rangeOfString:@"zh-Han"].location != NSNotFound) {
    //    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://thecarnaby.koocaa.com/shares.iphone?lang=zh"]]];    
    //  }else{
  [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://thecarnaby.koocaa.com/shares.iphone"]]];    
    //  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)backAction {
  [self.webView goBack];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)forwardAction {
  [self.webView goForward];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)refreshAction {
  [self.webView reload];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)stopAction {
  [self.webView stopLoading];
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
  self.count = [NSNumber numberWithInt:1];
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

/*
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType {
	NSString *URL = [[request URL] absoluteString];
    // External link?
  NSLog(@"url: %@",URL);
  NSLog(@"count: %@",self.count);  
  if ([URL isEqualToString:@"http://thecarnaby.koocaa.com/shares.iphone"]) {
    NSLog(@"url:equal URL");
  }
  if ([self.count isEqualToNumber:[NSNumber numberWithInt:0]]) {
    // Else, open in the original web view
    return YES;
  }
	if ([URL hasPrefix:@"http://"]) {
    NSLog(@"Open in TTWebView count: %@",self.count);     
    // Open in TTWebView
		TTOpenURL(URL);
		return NO;
	}
  return YES;
}
*/

@end
