//
//  MapController.m
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-20.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import "MapController.h"
#import "Annotation.h"

@implementation MapController

@synthesize mapView, mapAnnotations, shop_id, shop_name, _shop;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      MKMapView *newMapView = [[MKMapView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 367.0)];
      newMapView.showsUserLocation = YES;
      self.mapView = newMapView;
    //  [newMapView release];
    }
    return self;
}


-(id)initWithID:(NSInteger*)remote_shop_id{
  if (self = [super init]) {
    NSString *current_lang = [[NSLocale preferredLanguages] objectAtIndex:0];    
//    NSLog( @"map shop id %@", remote_shop_id); 

    self.shop_id  = [NSNumber numberWithInt:[remote_shop_id integerValue]];
//    NSLog( @"shop_id %@", self.shop_id); 
    
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
    Shop *shop = [fetchedObjects lastObject];
    if ([current_lang rangeOfString:@"zh-Han"].location != NSNotFound) {
      self.shop_name = shop.name;
    }else{
      self.shop_name = shop.name_en;
    }
    self._shop = shop;
//    NSLog( @"shop map name %@", shop.name);
    [fetchRequest release];
    
    // create out annotations array (in this example only 2)
    self.mapAnnotations = [[NSMutableArray alloc] initWithCapacity:2];
    
    CLLocationCoordinate2D  theCoordinate = {
      [shop.latitude floatValue],
      [shop.longitude floatValue]
    };
    
    Annotation * annotation = [[Annotation alloc] initWithCoordinate:theCoordinate];
    if ([current_lang rangeOfString:@"zh-Han"].location != NSNotFound) {
      annotation._title = self._shop.name;
      annotation._subtitle = self._shop.address;
    }else{
      annotation._title = self._shop.name_en;
      annotation._subtitle = self._shop.address_en;
    }

//    NSLog( @"shopAnnotation coordinate%@", annotation.title);
    
    [self.mapAnnotations addObject:annotation];
    [annotation release];
    
    [self gotoLocation];    // finally goto shop
  }
  return self;
}


- (void)gotoLocation {
  // start off by default centered in shop
  MKCoordinateRegion newRegion;
  newRegion.center.latitude = [self._shop.latitude floatValue];
  newRegion.center.longitude = [self._shop.longitude floatValue];
  NSLog(@"latitude %f",[self._shop.latitude floatValue]);
  NSLog(@"longitude %f",[self._shop.longitude floatValue]);  
//  newRegion.center.latitude = 37.786996;
//  newRegion.center.longitude = -122.440100;  
  newRegion.span.latitudeDelta = 0.112872;
  newRegion.span.longitudeDelta = 0.109863;
  
  [self.mapView setRegion:newRegion animated:YES];
  NSLog(@"%@",[self.mapAnnotations lastObject]);

  [self.mapView addAnnotation:[self.mapAnnotations lastObject]];  
  
  [self.view addSubview:self.mapView];  
}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
//  self.navigationItem.backBarButtonItem =
//  [[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered
//                                   target:nil action:nil] autorelease];  
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
  self.mapAnnotations = nil;
  self.mapView =nil;
}


- (void)dealloc {
  [mapView release];
  [mapAnnotations release];
  [shop_id release];
  [shop_name release];
  [_shop release];
    [super dealloc];
}


@end
