    //
//  BrandsController.m
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-17.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import "BrandsController.h"


@implementation BrandsController

@synthesize managedObjectContext, addingManagedObjectContext;
// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      self.title = @"Brands";
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

}


-(void)viewWillAppear:(BOOL)animated{
  [super viewWillAppear:animated];   
  [self.navigationController setNavigationBarHidden:YES animated:NO];   
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
//
//  NSLog(@"sharedApplication %@",[[UIApplication sharedApplication] delegate]);
//  NSLog( @"managedObjectContext %@", [[[UIApplication sharedApplication] delegate] managedObjectContext] );
//  
//
//  self.managedObjectContext = [[[UIApplication sharedApplication] delegate] managedObjectContext];
//  NSLog( @" self.managedObjectContext %@", self.managedObjectContext);
/*
  
  NSManagedObjectContext *context = [[[UIApplication sharedApplication] delegate] managedObjectContext]; 
  NSLog( @"context %@", context);
  NSFetchRequest *request = [[NSFetchRequest alloc] init];
  NSEntityDescription *entity = [NSEntityDescription entityForName:@"Brand" 
                                            inManagedObjectContext:context];
  [request setEntity:entity];
  
  NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"remote_brand_id" 
                                                                 ascending:NO]; 
  NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
  [request setSortDescriptors:sortDescriptors];
  [sortDescriptors release];
  [sortDescriptor release];
  
  NSError *error = nil;
  NSMutableArray *brands = [[context executeFetchRequest:request error:&error] mutableCopy]; 
  NSLog( @"context %@", brands);


  if ([brands lastObject]== nil) {
    // Handle the error.
    NSLog(@"brands: %@", brands);
  }else {
    // 按钮需要动态生成
    Brand *element;
    int j = 0;
    for (element in brands)
    {
      UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
      //setframe (where on screen)
      button.frame = CGRectMake(0, 374 - (j*37), 320, 37);
      [button setTitle:element.name forState:UIControlStateNormal];
      button.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
      
      //[button addTarget:self action:@selector(listBrands:) forControlEvents:UIControlEventTouchUpInside];
      [button addTarget:self action:@selector(brandShowView:) forControlEvents:UIControlEventTouchUpInside];
      
      int remote_brand_id = [element.remote_brand_id integerValue];
      [button setTag:remote_brand_id];
      [self.view addSubview: button];
      j++;
    }
    UIImageView *decoration = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 209.0, 320.0, 128.0)];
    UIImage *decorationImage = [UIImage imageNamed:@"li_background.png"];
    //decoration.frame = CGRectMake(0, 172, 320, 128);
    decoration.frame = CGRectMake(0, 374-(j-1)*37-128, 320, 128);  
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
  }
  [brands release];
  [request release];
*/
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