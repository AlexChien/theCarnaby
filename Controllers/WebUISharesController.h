//
//  WebSharesController.h
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-17.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WebUISharesController : UIViewController <UIWebViewDelegate>  {
  UIWebView *webView;
  NSNumber *count;
  
  UIToolbar*        _toolbar;  
  UIBarButtonItem*  _backButton;
  UIBarButtonItem*  _forwardButton;
  UIBarButtonItem*  _refreshButton;
  UIBarButtonItem*  _stopButton;
  UIBarButtonItem*  _actionButton;
  UIBarButtonItem*  _activityItem;  
}

@property (nonatomic, retain) UIWebView *webView;
@property (nonatomic, retain) NSNumber *count;

@end
