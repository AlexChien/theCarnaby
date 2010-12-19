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
    [[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered
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

    // 按钮需要动态生成    
    NSManagedObjectContext *context = [[[UIApplication sharedApplication] delegate] managedObjectContext]; 
    NSFetchRequest *fetchRequest = [[[NSFetchRequest alloc] init]autorelease];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Brand" 
                                              inManagedObjectContext:context];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:
                              @"(remote_brand_id = %d)", brand_id];
    [fetchRequest setPredicate:predicate];  
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    Brand *brand = [fetchedObjects lastObject];
    // 会crash
    //NSSortDescriptor *sortNameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"remote_collection_id" ascending:YES];
    //NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortNameDescriptor, nil];
    //NSArray *collections = [[brand.collections allObjects] sortedArrayUsingDescriptors:sortDescriptors];
     NSArray *collections = [brand.collections allObjects];
    // NSLog(@"brand---- %@",brand);
    // NSSet *collections = brand.collections;
    // NSLog(@"one of collections---- %@",[[collections allObjects] lastObject]);
    NSLog(@"collections---- %@",collections);

//    [sortDescriptors release];
//    [sortDescriptor release];
    
    if (collections == nil) {
      // Handle the error.
      NSLog(@"selectedBrandCollections: %@", collections);
    }else {
      NSLog(@"selectedBrandCollections: %@", collections);
      // 按钮需要动态生成    
      Collection *element;
//      int j = 0;
//      for (element in collections) {
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        //setframe (where on screen)
//        button.frame = CGRectMake(0, 374 - (j*37), 320, 37);
//        [button setTitle:element.name forState:UIControlStateNormal];
//        button.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
//        
//        [button addTarget:self action:@selector(listBrands:) forControlEvents:UIControlEventTouchUpInside];
//        //[button addTarget:self action:@selector(brandShowView:) forControlEvents:UIControlEventTouchUpInside];
//        //[map from:@"tt://collection/(initWithID:)" toViewController:[CollectionController class]];
////        NSString *collectionUrl = [NSString stringWithFormat:@"tt://collection/%@", element.remote_collection_id];
////        NSLog(collectionUrl);
////        [button addTarget:collectionUrl action:@selector(openURLFromButton:) forControlEvents:UIControlEventTouchUpInside];
//
//        int remote_collection_id = [element.remote_collection_id integerValue];
//        [button setTag:remote_collection_id];
//        [self.view addSubview: button];
//        j++;
//      }
      
      UIImageView *imageview6 = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 420.0)];
      imageview6.frame = CGRectMake(0.0, 0.0, 320.0, 420.0);
      imageview6.alpha = 1.000;
      imageview6.autoresizesSubviews = YES;
      imageview6.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;
      imageview6.contentMode = UIViewContentModeScaleAspectFill;
      imageview6.highlighted = NO;
      imageview6.multipleTouchEnabled = NO;
      imageview6.userInteractionEnabled = NO;          
      
      UIImageView *decoration = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 209.0, 320.0, 128.0)];
      UIImage *decorationImage = [UIImage imageNamed:@"li_background.png"];
//      decoration.frame = CGRectMake(0, 330-(j-1)*37-128, 320, 128);  
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
      
       self.title = brand.name; 
      if (brand_id == 1) {       
      decoration.frame = CGRectMake(0, 330-(1-1)*37-128, 320, 128);
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 374 - (-1*37), 320, 37);
        button.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        [self.view addSubview: button];    
        UIButton *button0 = [UIButton buttonWithType:UIButtonTypeCustom];
        button0.frame = CGRectMake(0, 330 - (0*37), 320, 37);
        [button0 setTitle:[[collections objectAtIndex:0] name] forState:UIControlStateNormal];
        button0.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        [button0 addTarget:@"tt://collection/1" action:@selector(openURLFromButton:) forControlEvents:UIControlEventTouchUpInside];
        UIImage *coverImage = [UIImage imageNamed:@"Yanzi by the Carnaby Brand.jpg"];
        imageview6.image = coverImage;
        [self.view addSubview:imageview6];
        [self.view addSubview: button0];
      }else if (brand_id == 2) {
      decoration.frame = CGRectMake(0, 330-(2-1)*37-128, 320, 128);       
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 374 - (-1*37), 320, 37);
        button.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        [self.view addSubview: button];            
        UIButton *button0 = [UIButton buttonWithType:UIButtonTypeCustom];
        button0.frame = CGRectMake(0, 330 - (0*37), 320, 37);
        [button0 setTitle:[[collections objectAtIndex:0] name] forState:UIControlStateNormal];
        button0.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        [button0 addTarget:@"tt://collection/3" action:@selector(openURLFromButton:) forControlEvents:UIControlEventTouchUpInside];
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        button1.frame = CGRectMake(0, 330 - (1*37), 320, 37);
        [button1 setTitle:[[collections objectAtIndex:1] name] forState:UIControlStateNormal];
        button1.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        [button1 addTarget:@"tt://collection/2" action:@selector(openURLFromButton:) forControlEvents:UIControlEventTouchUpInside];
        UIImage *coverImage = [UIImage imageNamed:@"default.png"];
        imageview6.image = coverImage;        
        [self.view addSubview:imageview6];
        [self.view addSubview: button0];        
        [self.view addSubview: button1];
      }    
      [self.view addSubview: decoration];
      [imageview6 release];      
      [decoration release];
    }
  }
  return self;  
}

-(IBAction)listBrands:(id)sender{
  NSLog("%@",sender);
  static int counter = 0;
  if (counter++ && counter%2==0) {
    self.view.backgroundColor= [UIColor blueColor]; 
  }else {
    self.view.backgroundColor=[UIColor redColor];
  }
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
  [managedObjectContext release];
  [addingManagedObjectContext release];    
  [super dealloc];
}

@end
