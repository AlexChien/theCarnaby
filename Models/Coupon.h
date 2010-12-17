//
//  Coupon.h
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-17.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import <CoreData/CoreData.h>

@class Image;

@interface Coupon :  NSManagedObject  
{
}

@property (nonatomic, retain) NSNumber * discount;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * detail;
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) NSNumber * remote_coupon_id;
@property (nonatomic, retain) Image * image;

@end



