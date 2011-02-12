//
//  WebCouponsController.h
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-17.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WebCouponsController : UIViewController <UIWebViewDelegate>{
  UIWebView *webView;
}

@property (nonatomic, retain) UIWebView *webView;

@end
