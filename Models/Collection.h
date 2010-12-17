//
//  Collection.h
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-17.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import <CoreData/CoreData.h>

@class Brand;
@class Image;
@class Product;

@interface Collection :  NSManagedObject  
{
}

@property (nonatomic, retain) NSDate * updated_at;
@property (nonatomic, retain) NSString * description;
@property (nonatomic, retain) NSNumber * remote_collection_id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet* products;
@property (nonatomic, retain) Image * image;
@property (nonatomic, retain) Brand * brand;

@end


@interface Collection (CoreDataGeneratedAccessors)
- (void)addProductsObject:(Product *)value;
- (void)removeProductsObject:(Product *)value;
- (void)addProducts:(NSSet *)value;
- (void)removeProducts:(NSSet *)value;

@end

