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
  
  UIImageView *imageview3 = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 60.0, 320.0, 84.0)];
  UIImage *couponImage = [UIImage imageNamed:@"coupon_demo.jpg"];  
  imageview3.frame = CGRectMake(0.0, 60.0, 320.0, 84.0);
  imageview3.alpha = 1.000;
  imageview3.autoresizesSubviews = YES;
  imageview3.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  imageview3.clearsContextBeforeDrawing = YES;
  imageview3.clipsToBounds = NO;
  imageview3.contentMode = UIViewContentModeCenter;
  imageview3.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
  imageview3.hidden = NO;
  imageview3.highlighted = NO;
  imageview3.image = couponImage;
  imageview3.multipleTouchEnabled = NO;
  imageview3.opaque = YES;
  imageview3.tag = 0;
  imageview3.userInteractionEnabled = NO;
  
  UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 367.0)];
  view1.frame = CGRectMake(0.0, 0.0, 320.0, 367.0);
  view1.alpha = 1.000;
  view1.autoresizesSubviews = YES;
  view1.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  view1.backgroundColor = [UIColor colorWithWhite:1.000 alpha:1.000];
  view1.clearsContextBeforeDrawing = YES;
  view1.clipsToBounds = NO;
  view1.contentMode = UIViewContentModeScaleToFill;
  view1.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
  view1.hidden = NO;
  view1.multipleTouchEnabled = NO;
  view1.opaque = YES;
  view1.tag = 0;
  view1.userInteractionEnabled = YES;
  
  UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 144.0, 280.0, 21.0)];
  label4.frame = CGRectMake(20.0, 144.0, 280.0, 21.0);
  label4.adjustsFontSizeToFitWidth = YES;
  label4.alpha = 1.000;
  label4.autoresizesSubviews = YES;
  label4.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
  label4.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
  label4.clearsContextBeforeDrawing = YES;
  label4.clipsToBounds = YES;
  label4.contentMode = UIViewContentModeLeft;
  label4.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
  label4.enabled = YES;
  label4.font = [UIFont fontWithName:@"Helvetica" size:17.000];
  label4.hidden = NO;
  label4.highlightedTextColor = [UIColor colorWithWhite:1.000 alpha:1.000];
  label4.lineBreakMode = UILineBreakModeTailTruncation;
  label4.minimumFontSize = 10.000;
  label4.multipleTouchEnabled = NO;
  label4.numberOfLines = 1;
  label4.opaque = NO;
  label4.shadowOffset = CGSizeMake(0.0, -1.0);
  label4.tag = 0;
  label4.text = @"全场7-8折优惠券";
  label4.textAlignment = UITextAlignmentCenter;
  label4.textColor = [UIColor colorWithRed:0.000 green:0.000 blue:0.000 alpha:1.000];
  label4.userInteractionEnabled = NO;
  
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
  TTStyledTextLabel* label1 = [[TTStyledTextLabel alloc] initWithFrame:CGRectMake(20.0, 194.0, 635.0, 183.0)];
  label1.frame = CGRectMake(20.0, 194.0, 635.0, 183.0);
  label1.font = [UIFont systemFontOfSize:15];
  label1.text = [TTStyledText textFromXHTML:kText lineBreaks:YES URLs:YES];
  label1.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);
  //label1.backgroundColor = [UIColor grayColor];
  [label1 sizeToFit];
  
  [view1 addSubview:imageview3];
  [view1 addSubview:label4];
  [view1 addSubview:label1];  
  
  [self.view addSubview:view1];
  [label4 release];
  [label1 release];
  [view1 release];  
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
