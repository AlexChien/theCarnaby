//
//  CollectionController.h
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-18.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import "Collection.h"
#import "Product.h"


@interface CollectionController : TTThumbsViewController {
  NSManagedObjectContext *managedObjectContext;
  NSManagedObjectContext *addingManagedObjectContext;
  NSNumber *collection_id;
  NSString  *colletion_title;
}

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) NSManagedObjectContext *addingManagedObjectContext;
@property (nonatomic, retain) NSNumber *collection_id;
@property (nonatomic, retain) NSString  *colletion_title;

@end
