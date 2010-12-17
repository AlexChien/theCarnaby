//
//  theCarnabyAppDelegate.h
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-17.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import "Brand.h"
#import "Collection.h"
#import "Status.h"

@interface theCarnabyAppDelegate : NSObject <UIApplicationDelegate> {
  NSManagedObjectModel *managedObjectModel;
  NSManagedObjectContext *managedObjectContext;	    
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

//The properties provide access to the Core Data stack
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end

