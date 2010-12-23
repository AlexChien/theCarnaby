    //
//  BrandController.m
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-18.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import "BrandController.h"
#import "CollectionController.h"

@implementation BrandController

@synthesize managedObjectContext, addingManagedObjectContext, ttNavigator;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    UIImage* image = [UIImage imageNamed:@"brand.png"];
    self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:self.title image:image tag:0] autorelease];  

    self.navigationItem.backBarButtonItem =
    [[[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"back", nil)
                                      style:UIBarButtonItemStyleBordered
                                     target:nil action:nil] autorelease];
    
  }
  return self;
}


- (id)init {
  //  NSLog(@"%@",self);  
  if (self = [super init]) {
  }
  return self;
}

-(id)initWithID:(NSInteger *)remote_brand_id{
  if (self = [super init]) {
    int *brand_id = [remote_brand_id integerValue];
    
    NSLog( @"brand %d", brand_id); 
    
    // 品牌背景图片
    UIImageView *imageview6 = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 420.0)];
    imageview6.frame = CGRectMake(0.0, 0.0, 320.0, 420.0);
    imageview6.alpha = 1.000;
    imageview6.autoresizesSubviews = YES;
    imageview6.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;
    imageview6.contentMode = UIViewContentModeScaleAspectFill;
    imageview6.highlighted = NO;
    imageview6.multipleTouchEnabled = NO;
    imageview6.userInteractionEnabled = NO;
    NSString *imageName = [[NSString alloc] initWithFormat:@"%dbrand.jpg", brand_id];    
    UIImage *coverImage = [UIImage imageNamed:imageName];
    imageview6.image = coverImage;
    [self.view addSubview:imageview6];
    [imageview6 release];    

    // 按钮需要动态生成
    NSManagedObjectContext *context = [[[UIApplication sharedApplication] delegate] managedObjectContext]; 
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Brand" 
                                              inManagedObjectContext:context];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:
                              @"(remote_brand_id = %d)", brand_id];
    [fetchRequest setPredicate:predicate];  
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    Brand *brand = [fetchedObjects lastObject];
    self.title = brand.name;     
    // 会crash
    //NSSortDescriptor *sortNameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"remote_collection_id" ascending:YES];
    //NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortNameDescriptor, nil];
    //NSArray *collections = [[brand.collections allObjects] sortedArrayUsingDescriptors:sortDescriptors];
    //[sortNameDescriptor release];
    //[sortDescriptors release];    
    NSArray *collections = [brand.collections allObjects];
    // NSLog(@"brand---- %@",brand);
    // NSSet *collections = brand.collections;
    // NSLog(@"one of collections---- %@",[[collections allObjects] lastObject]);
    // NSLog(@"collections---- %@",collections);
    
    if (collections == nil) {
      // Handle the error.
      NSLog(@"selectedBrandCollections: %@", collections);
    }else {
      NSLog(@"selectedBrandCollections: %@", collections);
      // 按钮需要动态生成    
      Collection *element;
      int j = 0;
      for (element in collections) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        //setframe (where on screen)
        button.frame = CGRectMake(0, 330 - (j*37), 320, 37);
        [button setTitle:element.name forState:UIControlStateNormal];
        button.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        NSString *collectionUrl = [[NSString alloc] initWithFormat:@"tt://collection/%@", element.remote_collection_id];
        [button addTarget:collectionUrl action:@selector(openURLFromButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview: button];
        j++;
      }
      UIImageView *decoration = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 209.0, 320.0, 128.0)];
      UIImage *decorationImage = [UIImage imageNamed:@"li_background.png"];
      decoration.frame = CGRectMake(0, 330-(j-1)*37-128, 320, 128);
      decoration.alpha = 1.000;
      decoration.autoresizesSubviews = YES;
      decoration.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
      decoration.clearsContextBeforeDrawing = YES;
      decoration.clipsToBounds = NO;
      decoration.contentMode = UIViewContentModeScaleToFill;
      decoration.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
      decoration.hidden = NO;
      decoration.highlighted = NO;
      decoration.image = decorationImage;
      decoration.multipleTouchEnabled = NO;
      decoration.opaque = YES;
      decoration.tag = 0;
      decoration.userInteractionEnabled = NO; 
      [self.view addSubview: decoration];
      [decoration release];
    }
    [fetchRequest release];
  }
  return self;  
}

 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
   UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 411.0)];
   view1.frame = CGRectMake(0.0, 0.0, 320.0, 411.0);
   view1.userInteractionEnabled = YES;
   self.view  = view1;
   [view1 release];
 }



-(void)viewWillAppear:(BOOL)animated{
  [super viewWillAppear:animated];   
  [self.navigationController setNavigationBarHidden:NO animated:NO];   
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
  [super viewDidLoad];
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
  [ttNavigator release];
  [managedObjectContext release];
  [addingManagedObjectContext release];    
  [super dealloc];
}

@end
