//
//  Image.h
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-17.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Brand, Collection, Coupon, Product;

@interface Image : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * caption;
@property (nonatomic, retain) NSNumber * position;
@property (nonatomic, retain) NSString * urlThumb;
@property (nonatomic, retain) NSString * photoSource;
@property (nonatomic, retain) NSNumber * size;
@property (nonatomic, retain) NSNumber * remote_image_id;
@property (nonatomic, retain) NSString * urlSmall;
@property (nonatomic, retain) NSString * urlLarge;
@property (nonatomic, retain) Product * product;
@property (nonatomic, retain) Brand * brand;
@property (nonatomic, retain) Coupon * coupon;
@property (nonatomic, retain) Collection * collection;

@end
