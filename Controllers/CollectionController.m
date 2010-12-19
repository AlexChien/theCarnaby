    //
//  CollectionController.m
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-18.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import "CollectionController.h"
#import "ImagesController.h"

@implementation CollectionController

@synthesize managedObjectContext, addingManagedObjectContext, collection_id, colletion_title;

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

- (id)init {
  //  NSLog(@"%@",self);  
  if (self = [super init]) {
  }
  return self;
}

-(id)initWithID:(NSInteger *)remote_collection_id{
  if (self = [super init]) {
    self.collection_id  = [NSNumber numberWithInt:[remote_collection_id integerValue]];
    NSLog( @"collection_id %d", self.collection_id); 
    
    NSManagedObjectContext *context = [[[UIApplication sharedApplication] delegate] managedObjectContext]; 
    NSFetchRequest *fetchRequest = [[[NSFetchRequest alloc] init]autorelease];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Collection" 
                                              inManagedObjectContext:context];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:
                              @"(remote_collection_id = %@)", collection_id];
    [fetchRequest setPredicate:predicate];  
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    Collection *collection = [fetchedObjects lastObject];
    self.colletion_title = collection.name;
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
  int remote_collection_id = [self.collection_id integerValue];
  
  if (remote_collection_id == 1) {
    NSMutableArray  *photos_array = [[[NSMutableArray alloc] init] autorelease];
    for (int i = 1; i<15; ++i) {
      //NSLog(@"%d",i);
      NSString  *url = [NSString stringWithFormat:@"bundle://%d.jpg", i];
      NSString *tUrl = [NSString stringWithFormat:@"bundle://%ds.jpg", i];
      //NSLog(@"%@",tUrl);    
      [photos_array addObject:[[[CIImage alloc]  initWithURL:url smallURL:tUrl 
                                                        size:CGSizeMake(75, 75)] autorelease]];
    }
    NSArray *array = [NSArray arrayWithArray:photos_array];
    self.photoSource = [[PhotoSource alloc]
                        initWithType:PhotoSourceNormal
                        title:self.colletion_title
                        photos:array photos2:nil];  
   }else if (remote_collection_id == 2) {
     NSMutableArray  *photos_array = [[[NSMutableArray alloc] init] autorelease];
     for (int i = 16; i<49; ++i) {
       //NSLog(@"%d",i);
       NSString  *url = [NSString stringWithFormat:@"bundle://%d.jpg", i];
       NSString *tUrl = [NSString stringWithFormat:@"bundle://%ds.jpg", i];
       //NSLog(@"%@",tUrl);    
       [photos_array addObject:[[[CIImage alloc]  initWithURL:url smallURL:tUrl 
                                                         size:CGSizeMake(75, 75)] autorelease]];
     }
     NSArray *array = [NSArray arrayWithArray:photos_array];
     self.photoSource = [[PhotoSource alloc]
                         initWithType:PhotoSourceNormal
                         title:self.colletion_title
                         photos:array photos2:nil];     
   }else if (remote_collection_id == 3) {
     NSMutableArray  *photos_array = [[[NSMutableArray alloc] init] autorelease];
     for (int i = 49; i<81; ++i) {
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
                         title:self.colletion_title
                         photos:array photos2:nil];   
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
  [collection_id release];
  [colletion_title release];
  [super dealloc];
}


@end
