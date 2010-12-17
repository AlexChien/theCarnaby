//
//  theCarnabyAppDelegate.m
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-17.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import "theCarnabyAppDelegate.h"
#import "TabBarController.h"
#import "BrandsController.h"
#import "CollectionsController.h"
#import "ProductsController.h"
#import "CouponsController.h"
#import "ShopsController.h"
#import "VideosController.h"
#import "SharesController.h"
#import "PagesController.h"

@implementation theCarnabyAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
    /*
    [self.window makeKeyAndVisible];    
    return YES;
     */
  
  // 导入初始数据
  [self importInitData];
  
  TTNavigator* navigator = [TTNavigator navigator];
  navigator.persistenceMode = TTNavigatorPersistenceModeAll;  
  navigator.window = window;
// navigator.window = [[[UIWindow alloc] initWithFrame:TTScreenBounds()] autorelease];

  TTURLMap* map = navigator.URLMap;
  
  // Any URL that doesn't match will fall back on this one, and open in the web browser
  [map from:@"*" toViewController:[TTWebController class]];
  
  // The tab bar controller is shared, meaning there will only ever be one created.  Loading
  // This URL will make the existing tab bar controller appear if it was not visible.
  //[map from:@"tt://tabBar/(initWithContext:)" toSharedViewController:[TabBarController class]];
  [map from:@"tt://tabBar" toSharedViewController:[TabBarController class]];  
  [map from:@"tt://page/(initWithName:)" toSharedViewController:[PagesController class]];  
  
  [map from:@"tt://brands" toViewController:[BrandsController class]];
  [map from:@"tt://brands/(initWithID:)" toViewController:[BrandsController class]];
  [map from:@"tt://products/(initWithState:)" toViewController:[ProductsController class]];
  [map from:@"tt://coupons" toViewController:[CouponsController class]];
  [map from:@"tt://shops" toViewController:[ShopsController class]];
  [map from:@"tt://videos" toViewController:[VideosController class]];
  [map from:@"tt://shares" toViewController:[SharesController class]];  
  [map from:@"tt://collections/(initWithID:)" toViewController:[CollectionsController class]];  
  
  // Before opening the tab bar, we see if the controller history was persisted the last time
  if (![navigator restoreViewControllers]) {
    // This is the first launch, so we just start with the tab bar
    [navigator openURLAction:[TTURLAction actionWithURLPath:@"tt://tabBar"]];
  }
  
  return YES;  
  
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}

////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Core Data stack

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *) managedObjectContext {
	
  if (managedObjectContext != nil) {
    return managedObjectContext;
  }
	
  NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
  if (coordinator != nil) {
    managedObjectContext = [[NSManagedObjectContext alloc] init];
    [managedObjectContext setPersistentStoreCoordinator: coordinator];
  }
  return managedObjectContext;
}


/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created by merging all of the models found in the application bundle.
 */
- (NSManagedObjectModel *)managedObjectModel {
	
  if (managedObjectModel != nil) {
    return managedObjectModel;
  }
  managedObjectModel = [[NSManagedObjectModel mergedModelFromBundles:nil] retain];    
  return managedObjectModel;
}


/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
	
  if (persistentStoreCoordinator != nil) {
    return persistentStoreCoordinator;
  }
	
	
	NSString *storePath = [[self applicationDocumentsDirectory] stringByAppendingPathComponent: @"theCarnaby.sqlite"];
	/*
	 Set up the store.
	 For the sake of illustration, provide a pre-populated default store.
	 */
	NSFileManager *fileManager = [NSFileManager defaultManager];
  // If the expected store doesn't exist, copy the default store.
	if (![fileManager fileExistsAtPath:storePath]) {
		NSString *defaultStorePath = [[NSBundle mainBundle] pathForResource:@"theCarnaby" ofType:@"sqlite"];
		if (defaultStorePath) {
			[fileManager copyItemAtPath:defaultStorePath toPath:storePath error:NULL];
		}
	}
  
	NSURL *storeUrl = [NSURL fileURLWithPath:storePath];
	
	NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];	
  persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: [self managedObjectModel]];
  
	NSError *error;
	if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:options error:&error]) {
    // Update to handle the error appropriately.
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		exit(-1);  // Fail
  }    
	
  return persistentStoreCoordinator;
}


////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Init Data Import

// 初始数据导入
-(void) importInitData{
  NSManagedObjectContext *context = self.managedObjectContext;
  NSFetchRequest *request = [[NSFetchRequest alloc] init];
  NSEntityDescription *entity = [NSEntityDescription entityForName:@"Status" 
                                            inManagedObjectContext:context];  
  [request setEntity:entity];
  NSError *statusError;
  NSMutableArray *status = [[context executeFetchRequest:request error:&statusError] mutableCopy];
  if ([status lastObject] == nil) {
    //导入品牌
    Brand *yanziCarnaby = [NSEntityDescription insertNewObjectForEntityForName:@"Brand" inManagedObjectContext:context];
    Brand *brandCarnaby = [NSEntityDescription insertNewObjectForEntityForName:@"Brand" inManagedObjectContext:context];    
    yanziCarnaby.name = @"Yanzi by the Carnaby";
    yanziCarnaby.remote_brand_id = [NSNumber numberWithInt:1];
    brandCarnaby.name = @"the Carnaby";
    brandCarnaby.remote_brand_id = [NSNumber numberWithInt:2];
    //导入系列
    Collection *yanzi2010FW = [NSEntityDescription insertNewObjectForEntityForName:@"Collection" inManagedObjectContext:context];
    Collection *theCarnabyPunk = [NSEntityDescription insertNewObjectForEntityForName:@"Collection" inManagedObjectContext:context];
    Collection *theCarnabyVictoria = [NSEntityDescription insertNewObjectForEntityForName:@"Collection" inManagedObjectContext:context];  
    yanzi2010FW.name = @"Yanzi 2010FW";
    yanzi2010FW.brand = yanziCarnaby;
    yanzi2010FW.remote_collection_id = [NSNumber numberWithInt:1];  
    theCarnabyPunk.name =@"the Carnaby Punk";
    theCarnabyPunk.brand = brandCarnaby;
    theCarnabyPunk.remote_collection_id = [NSNumber numberWithInt:2];
    theCarnabyVictoria.name =@"the Carnaby Victoria";
    theCarnabyVictoria.brand = brandCarnaby;
    theCarnabyVictoria.remote_collection_id = [NSNumber numberWithInt:3];
    //标记状态
    Status *initStatus = [NSEntityDescription insertNewObjectForEntityForName:@"Status" inManagedObjectContext:context];  
    initStatus.init_data = [NSNumber numberWithInt:1];      
    //保存
    NSError *error;
    if (![context save:&error]) {
      NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
  } 
}



////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Application's documents directory

/**
 Returns the path to the application's documents directory.
 */
- (NSString *)applicationDocumentsDirectory {
  
  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
  // NSLog(@"%@", paths);  
  NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
  return basePath;
}


////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
  [window release];
  [managedObjectContext release];
  [managedObjectModel release];
  [persistentStoreCoordinator release];  
  [super dealloc];
}


@end
