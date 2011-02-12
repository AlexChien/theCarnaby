//
//  NewsController.h
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-17.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface NewsController : UIViewController <UIWebViewDelegate> {
    UIWebView *webView;
}

@property (nonatomic, retain) UIWebView *webView;

@end
