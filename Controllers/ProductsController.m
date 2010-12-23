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
      self.title = NSLocalizedString(@"new_products", nil); 
      UIImage* image = [UIImage imageNamed:@"new.png"];
      self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:self.title image:image tag:0] autorelease];
      self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc]  initWithTitle:NSLocalizedString(@"back", nil)
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
  
  NSMutableArray  *photos_array = [[[NSMutableArray alloc] init] autorelease];
  for (int i = 1; i<81; ++i) {
    //NSLog(@"%d",i);
    NSString  *url = [NSString stringWithFormat:@"bundle://%d.jpg", i];
    NSString *tUrl = [NSString stringWithFormat:@"bundle://%ds.jpg", i];
    //NSLog(@"%@",tUrl);    
    [photos_array addObject:[[[CIImage alloc]  initWithURL:url smallURL:tUrl 
                                                      size:CGSizeMake(75, 75)] autorelease]];
    }
  
//  [photos_array addObject:nil];
  NSArray *array = [NSArray arrayWithArray:photos_array];
//  NSLog(@"array %@", array);  
     self.photoSource = [[PhotoSource alloc]
                         initWithType:PhotoSourceNormal
                         //initWithType:PhotoSourceDelayed
                         // initWithType:PhotoSourceLoadError
                         // initWithType:PhotoSourceDelayed|PhotoSourceSourceLoadError
                         //title:@"New Products"
                         title : NSLocalizedString(@"new_products", nil)
                         photos:array photos2:nil];

  
/*
  self.photoSource = [[PhotoSource alloc]
                      initWithType:PhotoSourceNormal
                      //initWithType:PhotoSourceDelayed
                      // initWithType:PhotoSourceLoadError
                      // initWithType:PhotoSourceDelayed|PhotoSourceSourceLoadError
                      title:@"New Products"
                      photos:[[NSArray alloc] initWithObjects:
                              [[[CIImage alloc]
                                initWithURL:@"bundle://1.jpg"
                                smallURL:@"bundle://1s.jpg"
                                size:CGSizeMake(75, 75)] autorelease],
                              [[[CIImage alloc]
                                initWithURL:@"bundle://2.jpg"
                                smallURL:@"bundle://2s.jpg"
                                size:CGSizeMake(75, 75)
                                caption:@"These are the wood tiles that we had installed after the accident."] autorelease],
                              [[[CIImage alloc]
                                initWithURL:@"bundle://3.jpg"
                                smallURL:@"bundle://3s.jpg"
                                size:CGSizeMake(75, 75)
                                caption:@"A hike."] autorelease],
                              [[[CIImage alloc]
                                initWithURL:@"bundle://4.jpg"
                                smallURL:@"bundle://4s.jpg"
                                size:CGSizeMake(75, 75)] autorelease],
                              [[[CIImage alloc]
                                initWithURL:@"bundle://5.jpg"
                                smallURL:@"bundle://5s.jpg"
                                size:CGSizeMake(75, 75)] autorelease],
                              [[[CIImage alloc]
                                initWithURL:@"bundle://6.jpg"
                                smallURL:@"bundle://6s.jpg"
                                size:CGSizeMake(75, 75)] autorelease],
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
*/   
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  return 150;
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
