//
//  ShopController.h
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-19.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import "Shop.h"


@interface ShopController : TTViewController {
  NSManagedObjectContext *managedObjectContext;
  NSManagedObjectContext *addingManagedObjectContext;
  NSNumber *shop_id;
  NSString  *shop_name;
}

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) NSManagedObjectContext *addingManagedObjectContext;
@property (nonatomic, retain) NSNumber *shop_id;
@property (nonatomic, retain) NSString  *shop_name;
@end
