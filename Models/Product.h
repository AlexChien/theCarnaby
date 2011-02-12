//
//  Product.h
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-17.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Brand, Collection, Image;

@interface Product : NSManagedObject {
@private
}
@property (nonatomic, retain) NSNumber * remote_product_id;
@property (nonatomic, retain) NSNumber * position;
@property (nonatomic, retain) NSString * sku;
@property (nonatomic, retain) NSNumber * price;
@property (nonatomic, retain) NSString * remote_description;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Collection * collection;
@property (nonatomic, retain) Image * image;
@property (nonatomic, retain) Brand * brand;

@end
