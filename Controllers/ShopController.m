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
  NSString *current_lang = [[NSLocale preferredLanguages] objectAtIndex:0];  
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
    if ([current_lang rangeOfString:@"zh-Han"].location != NSNotFound) {
      self.shop_name = shop.name;
    }else{
      self.shop_name = shop.name_en;      
    }
    self._shop = shop;
    NSLog( @"shop %@", self.shop_name);  
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
  NSString *current_lang = [[NSLocale preferredLanguages] objectAtIndex:0];

  UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 367.0)];
  backgroundImageView.frame = CGRectMake(0.0, 0.0, 320.0, 367.0);
  backgroundImageView.contentMode = UIViewContentModeScaleToFill;
  UIImage *bgImage = [UIImage imageNamed:@"bg.jpg"];
  backgroundImageView.image = bgImage;  

  UIImageView *shopImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 240.0)];
  NSString *shopImageName = [[NSString alloc] initWithFormat:@"shop%@.jpg",_shop.remote_shop_id];
  UIImage *shopImage = [UIImage imageNamed:shopImageName];
  [shopImageName release];
  shopImageView.image = shopImage;  

  [self.view addSubview:backgroundImageView];
  [self.view addSubview:shopImageView];
  [bgImage release];
  [backgroundImageView release];
  [shopImage release];
  [shopImageView release];

  UILabel *shopName = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 248.0, 280.0, 28.0)];
  shopName.frame = CGRectMake(20.0, 248.0, 280.0, 28.0);
  shopName.font = [UIFont fontWithName:@"Verdana" size:18.000];
  shopName.lineBreakMode = UILineBreakModeWordWrap;
  shopName.shadowColor = [UIColor colorWithWhite:1.000 alpha:1.000];
  shopName.shadowOffset = CGSizeMake(1.0, 1.0);
//  shopName.textAlignment = UITextAlignmentLeft;
  shopName.textAlignment = UITextAlignmentCenter;
  shopName.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
  
  UILabel *shopAddress = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 270.0, 280.0, 83.0)];
  shopAddress.frame = CGRectMake(20.0, 270.0, 280.0, 83.0);
  shopAddress.font = [UIFont fontWithName:@"Helvetica" size:15.000];
  shopAddress.lineBreakMode = UILineBreakModeWordWrap;
  shopAddress.numberOfLines = 4;
  shopAddress.textAlignment = UITextAlignmentLeft;
  shopAddress.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];

  //NSString  *mapUrl = [NSString stringWithFormat:@"tt://shopmap/%@",_shop.remote_shop_id];
  NSString  *mapUrl = [[NSString alloc] initWithFormat:@"tt://shopmap/%@",_shop.remote_shop_id];
  //[mapUrl description];  
  
  UIButton *shopMapButton = [UIButton buttonWithType:UIButtonTypeCustom];
  shopMapButton.frame = CGRectMake(0.0, 240.0, 320.0, 127.0);
  shopMapButton.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
  [shopMapButton addTarget:mapUrl action:@selector(openURLFromButton:) forControlEvents:UIControlEventTouchUpInside];     

  if ([current_lang rangeOfString:@"zh-Han"].location != NSNotFound) {
    [shopName setText:_shop.name];    
    [shopAddress setText:_shop.address];
  }else{
    [shopName setText:_shop.name_en];
    [shopAddress setText:_shop.address_en];
  }
  [self.view addSubview:shopName];
  [self.view addSubview:shopAddress]; 
  [self.view addSubview:shopMapButton];
  [shopName release];
  [shopAddress release];
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
