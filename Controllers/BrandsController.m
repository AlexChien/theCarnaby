    //
//  BrandsController.m
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-17.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import "BrandsController.h"
#import "BrandController.h"


@implementation BrandsController

@synthesize managedObjectContext, addingManagedObjectContext;
// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      //self.title = @"Brands";
      self.title = NSLocalizedString(@"brands", nil);
      UIImage* image = [UIImage imageNamed:@"brand.png"];
      self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:self.title image:image tag:0] autorelease];  
    }
    return self;
}

//-(id)init{
//  NSLog(@"%@",self);  
//}


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
  UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 411.0)];
  view1.frame = CGRectMake(0.0, 0.0, 320.0, 411.0);
  view1.userInteractionEnabled = YES;
  
  UIImageView *imageview6 = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 420.0)];
  UIImage *coverImage = [UIImage imageNamed:@"14.jpg"];
  imageview6.frame = CGRectMake(0.0, 0.0, 320.0, 420.0);
  imageview6.alpha = 1.000;
  imageview6.autoresizesSubviews = YES;
  imageview6.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;
  imageview6.clearsContextBeforeDrawing = YES;
  imageview6.clipsToBounds = NO;
  imageview6.contentMode = UIViewContentModeScaleAspectFill;
  imageview6.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
  imageview6.hidden = NO;
  imageview6.highlighted = NO;
  imageview6.image = coverImage;
  imageview6.multipleTouchEnabled = NO;
  imageview6.opaque = YES;
  imageview6.tag = 0;
  imageview6.userInteractionEnabled = NO;
  
  [view1 addSubview:imageview6];
  self.view  = view1;
  [imageview6 release];
  [view1 release];
}


-(void)viewWillAppear:(BOOL)animated{
  [super viewWillAppear:animated];   
  [self.navigationController setNavigationBarHidden:YES animated:NO];   
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
  [super viewDidLoad];
  // 按钮需要动态生成  
  NSManagedObjectContext *context = [[[UIApplication sharedApplication] delegate] managedObjectContext]; 
  //NSLog( @"context %@", context);
  NSFetchRequest *request = [[NSFetchRequest alloc] init];
  NSEntityDescription *entity = [NSEntityDescription entityForName:@"Brand" 
                                            inManagedObjectContext:context];
  [request setEntity:entity];
  
  NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"remote_brand_id" 
                                                                 ascending:NO]; 
  NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
  [request setSortDescriptors:sortDescriptors];
  
  NSError *error = nil;
  NSMutableArray *brands = [[context executeFetchRequest:request error:&error] mutableCopy]; 
  //NSLog( @"brands %@", brands);
  
  if ([brands lastObject]== nil) {
    // Handle the error.
    NSLog(@"brands: %@", brands);
  }else {
    Brand *element;
    int j = 0;
    for (element in brands){
      UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
      //setframe (where on screen)
      button.frame = CGRectMake(0, 374 - (j*37), 320, 37);
      [button setTitle:element.name forState:UIControlStateNormal];
      button.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
      //NSString *brandUrl = [NSString stringWithFormat:@"tt://brand/%@", element.remote_brand_id];
      NSString *brandUrl = [[NSString alloc] initWithFormat:@"tt://brand/%@", element.remote_brand_id];
      [button addTarget:brandUrl action:@selector(openURLFromButton:) forControlEvents:UIControlEventTouchUpInside];
      int remote_brand_id = [element.remote_brand_id integerValue];
      [button setTag:remote_brand_id];
      [self.view addSubview: button];
      j++;
    }
    
    UIImageView *decoration = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 209.0, 320.0, 128.0)];
    UIImage *decorationImage = [UIImage imageNamed:@"li_background.png"];
    decoration.frame = CGRectMake(0, 374-(j-1)*37-128, 320, 128);
    decoration.alpha = 1.000;
    decoration.autoresizesSubviews = YES;
    decoration.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    decoration.clearsContextBeforeDrawing = YES;
    decoration.clipsToBounds = NO;
    decoration.contentMode = UIViewContentModeScaleToFill;
    decoration.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
    decoration.image = decorationImage;
    decoration.multipleTouchEnabled = NO;
    decoration.opaque = YES;
    decoration.userInteractionEnabled = NO;  
    [self.view addSubview: decoration];
    [decoration release];
  }
  [brands release];
  [request release];
  [sortDescriptor release];
  [sortDescriptors release];
}

-(void)initWithID:(id)sender{
  NSLog("%@",sender);
  static int counter = 0;
  if (counter++ && counter%2==0) {
    self.view.backgroundColor= [UIColor blueColor]; 
  }else {
    self.view.backgroundColor=[UIColor redColor];
  }
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
