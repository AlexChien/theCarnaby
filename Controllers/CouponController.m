    //
//  CouponController.m
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-19.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import "CouponController.h"


@implementation CouponController

@synthesize managedObjectContext, addingManagedObjectContext;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/




/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
  
  UIImageView *couponImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 60.0, 320.0, 84.0)];
  UIImage *couponImage = [UIImage imageNamed:@"coupon_demo.jpg"];  
  couponImageView.frame = CGRectMake(0.0, 60.0, 320.0, 84.0);
  couponImageView.alpha = 1.000;
  couponImageView.autoresizesSubviews = YES;
  couponImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  couponImageView.clearsContextBeforeDrawing = YES;
  couponImageView.clipsToBounds = NO;
  couponImageView.contentMode = UIViewContentModeCenter;
  couponImageView.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
  couponImageView.hidden = NO;
  couponImageView.highlighted = NO;
  couponImageView.image = couponImage;
  couponImageView.multipleTouchEnabled = NO;
  couponImageView.opaque = YES;
  couponImageView.tag = 0;
  couponImageView.userInteractionEnabled = NO;
  
  UIView *couponView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 367.0)];
  couponView.frame = CGRectMake(0.0, 0.0, 320.0, 367.0);
  couponView.alpha = 1.000;
  couponView.autoresizesSubviews = YES;
  couponView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  couponView.backgroundColor = [UIColor colorWithWhite:1.000 alpha:1.000];
  couponView.clearsContextBeforeDrawing = YES;
  couponView.clipsToBounds = NO;
  couponView.contentMode = UIViewContentModeScaleToFill;
  couponView.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
  couponView.hidden = NO;
  couponView.multipleTouchEnabled = NO;
  couponView.opaque = YES;
  couponView.tag = 0;
  couponView.userInteractionEnabled = YES;
  
  UILabel *couponTitle = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 144.0, 280.0, 21.0)];
  couponTitle.frame = CGRectMake(20.0, 144.0, 280.0, 21.0);
  couponTitle.adjustsFontSizeToFitWidth = YES;
  couponTitle.alpha = 1.000;
  couponTitle.autoresizesSubviews = YES;
  couponTitle.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
  couponTitle.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
  couponTitle.clearsContextBeforeDrawing = YES;
  couponTitle.clipsToBounds = YES;
  couponTitle.contentMode = UIViewContentModeLeft;
  couponTitle.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
  couponTitle.enabled = YES;
  couponTitle.font = [UIFont fontWithName:@"Helvetica" size:17.000];
  couponTitle.hidden = NO;
  couponTitle.highlightedTextColor = [UIColor colorWithWhite:1.000 alpha:1.000];
  couponTitle.lineBreakMode = UILineBreakModeTailTruncation;
  couponTitle.minimumFontSize = 10.000;
  couponTitle.multipleTouchEnabled = NO;
  couponTitle.numberOfLines = 1;
  couponTitle.opaque = NO;
  couponTitle.shadowOffset = CGSizeMake(0.0, -1.0);
  couponTitle.tag = 0;
  couponTitle.text = @"全场7-8折优惠券";
  couponTitle.textAlignment = UITextAlignmentCenter;
  couponTitle.textColor = [UIColor colorWithRed:0.000 green:0.000 blue:0.000 alpha:1.000];
  couponTitle.userInteractionEnabled = NO;
  
//  NSString* kText = @"\
//  This is a test of styled labels.  Styled labels support \
//  <b>bold text</b>, <i>italic text</i>, <span class=\"blueText\">colored text</span>, \
//  <span class=\"largeText\">font sizes</span>, \
//  <span class=\"blueBox\">spans with backgrounds</span>, inline images \
//  <img src=\"bundle://smiley.png\"/>, and <a href=\"http://www.google.com\">hyperlinks</a> you can \
//  actually touch. URLs are automatically converted into links, like this: http://www.foo.com\
//  <div>You can enclose blocks within an HTML div.</div>\
//  Both line break characters\n\nand HTML line breaks<br/>are respected.";  
  NSString* kText = @"所有店面均可使用。<br/>凭此券全场7-8折优惠。<br/>有效期9月1日到9月30日";  
  TTStyledTextLabel* couponDetail = [[TTStyledTextLabel alloc] initWithFrame:CGRectMake(20.0, 194.0, 635.0, 183.0)];
  couponDetail.frame = CGRectMake(20.0, 194.0, 635.0, 183.0);
  couponDetail.font = [UIFont systemFontOfSize:15];
  couponDetail.text = [TTStyledText textFromXHTML:kText lineBreaks:YES URLs:YES];
  couponDetail.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);
  //label1.backgroundColor = [UIColor grayColor];
  [couponDetail sizeToFit];
  
  [couponView addSubview:couponImageView];
  [couponView addSubview:couponTitle];
  [couponView addSubview:couponDetail];  
  
  [self.view addSubview:couponView];
  [couponTitle release];
  [couponDetail release];
  [couponView release];  
  [couponImageView release];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
  [managedObjectContext release];
  [addingManagedObjectContext release];  
    [super dealloc];
}


@end
