//
//  TabBarController.m
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-17.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import "TabBarController.h"


@implementation TabBarController

//@synthesize managedObjectContext, addingManagedObjectContext;

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

-(id)initWithIndex:(NSInteger *)tabIndex{
  if (self = [super init]) {
    self.selectedIndex = tabIndex;
    [self.navigationController setNavigationBarHidden:YES animated:NO];    
    [self.selectedViewController viewDidAppear:YES];
  }
  return self;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
  [super viewDidLoad];
  [self setTabURLs:[NSArray arrayWithObjects:
                    //@"tt://brands",
                    @"tt://collections",
                    //@"tt://products/new",
                    @"tt://news",
                    //@"http://127.0.0.1:3000/news.iphone",
                    @"tt://coupons",                 
                    @"tt://shops",
                    @"tt://videos",
                    @"tt://shares",
                    //@"http://127.0.0.1:3000/shares.iphone",                    
                    nil]]; 
}

-(void)viewWillAppear:(BOOL)animated {
  NSArray *tabs =  [self viewControllers];
  UIViewController *viewController = [tabs objectAtIndex:5];
  viewController.title = NSLocalizedString(@"shares", nil);
  [viewController setTitle:NSLocalizedString(@"shares", nil)];
  viewController.tabBarItem.image = [UIImage imageNamed:@"share.png"];
  viewController.tabBarItem.title = NSLocalizedString(@"shares", nil);
  viewController.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc]  initWithTitle:NSLocalizedString(@"back", nil)
                                                                                        style:UIBarButtonItemStyleDone 
                                                                                       target:self
                                                                                       action:@selector(backHome)] autorelease];
}

-(void)backHome{
  self.tabBarController.selectedIndex = 0;
  [self.tabBarController.selectedViewController viewDidAppear:YES];
    //  TTOpenURL([NSString stringWithFormat:@"tt://tabBar/1", self.view]);
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
    [super dealloc];
}


@end
