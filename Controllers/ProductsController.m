    //
//  ProductsController.m
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-17.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import "ProductsController.h"
#import "ImagesController.h"

@implementation ProductsController

@synthesize managedObjectContext, addingManagedObjectContext;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      self.title = @"New Products";
      UIImage* image = [UIImage imageNamed:@"new.png"];
      self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:self.title image:image tag:0] autorelease];
      self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc]  initWithTitle:@"Back" 
                                                                                 style:UIBarButtonItemStyleDone 
                                                                                target:self
                                                                                action:@selector(backHome)] autorelease];
      
//      self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"right button" 
//                                                                                 style:UIBarButtonItemStyleBordered
//                                                                                target:@"tt://tabBar/1" 
//                                                                                action:@selector(openURL)] autorelease];
    
    }
    return self;
}

-(void)backHome{
  self.tabBarController.selectedIndex = 0;
  [self.tabBarController.selectedViewController viewDidAppear:YES];
//  TTOpenURL([NSString stringWithFormat:@"tt://tabBar/1", self.view]);
}

/*
-(id)initWithState:(NSString*)state{
  if (self = [super init]) {

    
    
  }
  return self;
}

- (id)init {
  if (self = [super init]) {

  }
  return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
 self.title = @"New Products";
 UIImage* image = [UIImage imageNamed:@"new.png"];
 self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:self.title image:image tag:0] autorelease]; 
  
 self.navigationItem.backBarButtonItem =
  [[[UIBarButtonItem alloc] initWithTitle:@"Catalog" style:UIBarButtonItemStyleBordered
                                   target:nil action:nil] autorelease];  
}
*/

/*
-(void)viewWillAppear:(BOOL)animated{
  [super viewWillAppear:animated];  
//  self.navigationItem.backBarButtonItem =
//  [[[UIBarButtonItem alloc] initWithTitle:@"Catalog" style:UIBarButtonItemStyleBordered
//                                    target:@"tt://brands" action:nil] autorelease];  
}
 */

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
  //  NSLog(@"%@",self.delegate);
  //  NSLog(@"%@",_delegate);
  //[_delegate thumbsViewController:self.columnCount = 3];  
  //self.columnCount = 3;
  //self.thumbSize=100;
  self.photoSource = [[PhotoSource alloc]
                      initWithType:PhotoSourceNormal
                      //initWithType:PhotoSourceDelayed
                      // initWithType:PhotoSourceLoadError
                      // initWithType:PhotoSourceDelayed|PhotoSourceSourceLoadError
                      title:@"New Products"
                      photos:[[NSArray alloc] initWithObjects:
                              [[[CIImage alloc]
                                initWithURL:@"http://farm4.static.flickr.com/3246/2957580101_33c799fc09_o.jpg"
                                smallURL:@"http://farm4.static.flickr.com/3246/2957580101_d63ef56b15_t.jpg"
                                size:CGSizeMake(960, 1280)] autorelease],
                              [[[CIImage alloc]
                                initWithURL:@"http://farm4.static.flickr.com/3444/3223645618_13fe36887a_o.jpg"
                                smallURL:@"http://farm4.static.flickr.com/3444/3223645618_f5e2fa7fea_t.jpg"
                                size:CGSizeMake(320, 480)
                                caption:@"These are the wood tiles that we had installed after the accident."] autorelease],
                              [[[CIImage alloc]
                                initWithURL:@"http://farm2.static.flickr.com/1124/3164979509_bcfdd72123.jpg?v=0"
                                smallURL:@"http://farm2.static.flickr.com/1124/3164979509_bcfdd72123_t.jpg"
                                size:CGSizeMake(320, 480)
                                caption:@"A hike."] autorelease],
                              [[[CIImage alloc]
                                initWithURL:@"http://farm4.static.flickr.com/3106/3203111597_d849ef615b.jpg?v=0"
                                smallURL:@"http://farm4.static.flickr.com/3106/3203111597_d849ef615b_t.jpg"
                                size:CGSizeMake(320, 480)] autorelease],
                              [[[CIImage alloc]
                                initWithURL:@"http://farm4.static.flickr.com/3099/3164979221_6c0e583f7d.jpg?v=0"
                                smallURL:@"http://farm4.static.flickr.com/3099/3164979221_6c0e583f7d_t.jpg"
                                size:CGSizeMake(320, 480)] autorelease],
                              [[[CIImage alloc]
                                initWithURL:@"http://farm4.static.flickr.com/3081/3164978791_3c292029f2.jpg?v=0"
                                smallURL:@"http://farm4.static.flickr.com/3081/3164978791_3c292029f2_t.jpg"
                                size:CGSizeMake(320, 480)] autorelease],
                              nil
                              ]
                      
                      photos2:nil
//                      photos2:[[NSArray alloc] initWithObjects:
//                               [[[CIImage alloc]
//                                 initWithURL:@"http://farm4.static.flickr.com/3280/2949707060_e639b539c5_o.jpg"
//                                 smallURL:@"http://farm4.static.flickr.com/3280/2949707060_8139284ba5_t.jpg"
//                                 size:CGSizeMake(800, 533)] autorelease],
//                               nil]
                      ];  
  
}



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    //    return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
  NSLog(@"%@", interfaceOrientation);
}


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
