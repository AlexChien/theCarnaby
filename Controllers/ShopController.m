    //
//  ShopController.m
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-19.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import "ShopController.h"


@implementation ShopController

@synthesize managedObjectContext, addingManagedObjectContext, shop_id, shop_name, _shop;

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

-(id)initWithID:(NSInteger*)remote_shop_id{
  if (self = [super init]) {
    self.shop_id  = [NSNumber numberWithInt:[remote_shop_id integerValue]];
    NSLog( @"shop_id %@", self.shop_id); 
    
    NSManagedObjectContext *context = [[[UIApplication sharedApplication] delegate] managedObjectContext]; 
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Shop" 
                                              inManagedObjectContext:context];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:
                              @"(remote_shop_id = %@)", self.shop_id];
    [fetchRequest setPredicate:predicate];  
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    NSLog( @"fetchedObjects %@", fetchedObjects);
    Shop *shop = [fetchedObjects lastObject];
    self.shop_name = shop.name;
    self._shop = shop;
    NSLog( @"shop %@", shop.name);  
    [fetchRequest release];
  }
  return self;
}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];  
  UIImageView *imageview6 = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 420.0)];
  UIImage *coverImage = [UIImage imageNamed:@"shop_pic_demo.jpg"];
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
  
  [self.view addSubview:imageview6];
  [imageview6 release];
  
  //NSString  *mapUrl = [NSString stringWithFormat:@"tt://shopmap/%@",_shop.remote_shop_id];
  //NSString  *mapUrl = [NSString stringWithFormat:@"tt://shopmap"];
  NSString  *mapUrl = [[NSString alloc] initWithFormat:@"tt://shopmap/%@",_shop.remote_shop_id];

  NSLog(@"shopmap url: %@",mapUrl);
  //[mapUrl description];
  UIButton *button0 = [UIButton buttonWithType:UIButtonTypeCustom];
  button0.frame = CGRectMake(0, 330 - (0*37), 320, 37);
  [button0 setTitle:_shop.address forState:UIControlStateNormal];
  button0.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
  [button0 addTarget:mapUrl action:@selector(openURLFromButton:) forControlEvents:UIControlEventTouchUpInside];
  //[button0 addTarget:@"tt://shopmap" action:@selector(openURLFromButton:) forControlEvents:UIControlEventTouchUpInside];  
  UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
  button1.frame = CGRectMake(0, 330 - (1*37), 320, 37);
  [button1 setTitle:_shop.name forState:UIControlStateNormal];
  button1.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
  [button1 addTarget:mapUrl action:@selector(openURLFromButton:) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview: button0];        
  [self.view addSubview: button1];
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
  [shop_id release];
  [shop_name release];
  [_shop release];
    [super dealloc];
}


@end
