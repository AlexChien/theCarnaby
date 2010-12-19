    //
//  CouponsController.m
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-17.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import "CouponsController.h"


@implementation CouponsController

@synthesize managedObjectContext, addingManagedObjectContext;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      self.title = @"Coupons";
      UIImage* image = [UIImage imageNamed:@"coupon.png"];
      self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:self.title image:image tag:0] autorelease];
      self.dataSource = [TTSectionedDataSource dataSourceWithObjects:
                         @"Food",
                         [TTTableTextItem itemWithText:@"Porridge" URL:@"tt://shop/1"],
                         [TTTableTextItem itemWithText:@"Bacon & Eggs" URL:@"tt://shop/2"],
                         [TTTableTextItem itemWithText:@"French Toast" URL:@"tt://shop/3"],
                         @"Drinks",
                         [TTTableTextItem itemWithText:@"Coffee" URL:@"tt://shop/4"],
                         [TTTableTextItem itemWithText:@"Orange Juice" URL:@"tt://shop/5"],
                         @"Other",
                         [TTTableTextItem itemWithText:@"Just Desserts" URL:@"tt://shop/6"],
                         [TTTableTextItem itemWithText:@"Complaints" URL:@"tt://shop/7"],
                         nil];      
      
    }
    return self;
}

/*
-(id)init{
  self.title = @"Coupons";
  UIImage* image = [UIImage imageNamed:@"coupon.png"];
  self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:self.title image:image tag:0] autorelease];
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
  self.navigationItem.backBarButtonItem =
  [[[UIBarButtonItem alloc] initWithTitle:@"Catalog" style:UIBarButtonItemStyleBordered
                                   target:@"tt://brands" action:nil] autorelease];      
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
