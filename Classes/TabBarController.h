//
//  TabBarController.h
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-17.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import <Three20/Three20.h>


@interface TabBarController : UITabBarController {
  NSManagedObjectContext *managedObjectContext;
  NSManagedObjectContext *addingManagedObjectContext;
}

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) NSManagedObjectContext *addingManagedObjectContext;

@end
