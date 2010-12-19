//
//  BrandController.h
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-18.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//


#import "Brand.h"
#import "Collection.h"

@interface BrandController : TTViewController {
  NSManagedObjectContext *managedObjectContext;
  NSManagedObjectContext *addingManagedObjectContext;
  TTNavigator *ttNavigator;
}

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) NSManagedObjectContext *addingManagedObjectContext;
@property (nonatomic, retain) TTNavigator *ttNavigator;

@end
