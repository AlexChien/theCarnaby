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

  UIImageView *shopImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 420)];
  NSString *shopImageName = [[NSString alloc] initWithFormat:@"shop%@.jpg",_shop.remote_shop_id];
  UIImage *coverImage = [UIImage imageNamed:shopImageName];
  [shopImageName release];
  shopImageView.alpha = 1.000;
  shopImageView.autoresizesSubviews = YES;
  shopImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;
  shopImageView.clearsContextBeforeDrawing = YES;
  shopImageView.clipsToBounds = NO;
  shopImageView.contentMode = UIViewContentModeScaleAspectFill;
  shopImageView.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
  shopImageView.hidden = NO;
  shopImageView.highlighted = NO;
  shopImageView.image = coverImage;
  shopImageView.multipleTouchEnabled = NO;
  shopImageView.opaque = YES;
  shopImageView.tag = 0;
  shopImageView.userInteractionEnabled = NO;
  
  [self.view addSubview:shopImageView];
  [coverImage release];
  [shopImageView release];
  
  //NSString  *mapUrl = [NSString stringWithFormat:@"tt://shopmap/%@",_shop.remote_shop_id];
  NSString  *mapUrl = [[NSString alloc] initWithFormat:@"tt://shopmap/%@",_shop.remote_shop_id];
  //[mapUrl description];
  UIButton *addressButton = [UIButton buttonWithType:UIButtonTypeCustom];
  addressButton.frame = CGRectMake(0, 330 - (0*37)-37, 320, 74);  
  addressButton.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
  [addressButton addTarget:mapUrl action:@selector(openURLFromButton:) forControlEvents:UIControlEventTouchUpInside];  
  [mapUrl release];
  UIButton *nameButton = [UIButton buttonWithType:UIButtonTypeCustom];
  nameButton.frame = CGRectMake(0, 330 - (1*37)-37, 320, 37);
  if ([current_lang rangeOfString:@"zh-Han"].location != NSNotFound) {
    [nameButton setTitle:_shop.name forState:UIControlStateNormal];    
  }else{
    [nameButton setTitle:_shop.name_en forState:UIControlStateNormal];      
  }
  nameButton.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
  [nameButton addTarget:mapUrl action:@selector(openURLFromButton:) forControlEvents:UIControlEventTouchUpInside];
  UILabel *shopAddress = [[[UILabel alloc] init] autorelease];
  shopAddress.frame = CGRectMake(10, 330 - (0*37)-37, 300, 74);
  shopAddress.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];  
  shopAddress.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:1];
  shopAddress.numberOfLines = 0;
  shopAddress.adjustsFontSizeToFitWidth = YES;
  if ([current_lang rangeOfString:@"zh-Han"].location != NSNotFound) {
    //    [button0 setTitle:_shop.address forState:UIControlStateNormal];
    [shopAddress setText:_shop.address];    
  }else{
    //    [button0 setTitle:_shop.address_en forState:UIControlStateNormal];    
    [shopAddress setText:_shop.address_en];
  }  
  [self.view addSubview: addressButton];
  [self.view addSubview: nameButton];
  [self.view addSubview: shopAddress];  
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
