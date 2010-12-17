    //
//  PagesController.m
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-17.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import "PagesController.h"


@implementation PagesController

@synthesize page = _page;

///////////////////////////////////////////////////////////////////////////////////////////////////
// private

- (NSString*)nameForPage:(Page)page {
  switch (page) {
    case PageBrands:
      return @"Brands";
    case PageCollections:
      return @"Collections";
    case PageProducts:
      return @"Products";
    case PageCoupons:
      return @"Coupons";
    case PageShops:
      return @"Shops";
    case PageVideos:
      return @"Videos";
    case PageShares:
      return @"Shares";
    default:
      return @"";
  }
}

- (UIImage*)iconForPage:(Page)page {
  switch (page) {
    case PageBrands:
      return [UIImage imageNamed:@"brand.png"];
    case PageCollections:
      return [UIImage imageNamed:@"new.png"];
    case PageProducts:
      return [UIImage imageNamed:@"new.png"];
    case PageCoupons:
      return[UIImage imageNamed:@"coupon.png"];
    case PageShops:
      return [UIImage imageNamed:@"shop.png"];
    case PageVideos:
      return [UIImage imageNamed:@"video.png"];
    case PageShares:
      return [UIImage imageNamed:@"brand.png"];
    default:
      return [UIImage imageNamed:@""];
  }
}


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

- (id)initWithName:(Page)page {
  if (self = [super init]) {
    self.page = page;
  }
  return self;
}

- (id)init {
  if (self = [super init]) {
    _page = PageNone;
  }
  return self;
}

- (void)setPage:(Page)page {
  _page = page;
  
  self.title = [self nameForPage:page];
  
  UIImage* image = [self iconForPage:page];
  self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:self.title image:image tag:0] autorelease];
  
  self.navigationItem.backBarButtonItem =
  [[[UIBarButtonItem alloc] initWithTitle:@"the Carnaby" style:UIBarButtonItemStyleBordered
                                   target:nil action:nil] autorelease];

 // TTNavigator* navigator = [TTNavigator navigator];
//  navigator.persistenceMode = TTNavigatorPersistenceModeAll;    
  
  if (_page == PageBrands) {
    self.navigationController.navigationBarHidden=YES;
    NSLog(@"tabBarController%@",self.view);    
    NSLog(@"tabBarController%@",self.tabBarController);
    NSLog(@"navigationController%@",self.navigationController);
//    // Before opening the tab bar, we see if the controller history was persisted the last time
//    if (![navigator restoreViewControllers]) {
//      // This is the first launch, so we just start with the tab bar
//      [navigator openURLAction:[TTURLAction actionWithURLPath:@"tt://products/new"]];
//    }
  } else if (_page == PageCollections) {    
    
  } else if (_page == PageProducts) {

  } else if (_page == PageCoupons) {

  } else if (_page == PageShops) {
  
  } else if (_page == PageVideos) {
  
  } else if (_page == PageShares) {
  }
}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

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
    [super dealloc];
}


@end
