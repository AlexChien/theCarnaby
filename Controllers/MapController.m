    //
//  MapController.m
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-20.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import "MapController.h"

@implementation MapController

@synthesize mapAnnotations, shop_id, shop_name, _shop;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
//      MKMapView *mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 411.0)];
//      self.view = mapView;
    }
    return self;
}


-(id)initWithID:(NSInteger*)remote_shop_id{
  if (self = [super init]) {
    NSLog( @"map_shop_id %@", remote_shop_id); 
    /*
    self.shop_id  = [NSNumber numberWithInt:[remote_shop_id integerValue]];
    NSLog( @"map_shop_id %@", self.shop_id); 
    
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
     */
  }
  return self;
}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

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
  [mapAnnotations release];
  [shop_id release];
  [shop_name release];
  [_shop release];  
    [super dealloc];
}


@end
