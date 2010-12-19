//
//  CouponController.h
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-19.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import "Coupon.h"


@interface CouponController : TTViewController {
  NSManagedObjectContext *managedObjectContext;
  NSManagedObjectContext *addingManagedObjectContext;
}

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) NSManagedObjectContext *addingManagedObjectContext;

@end
