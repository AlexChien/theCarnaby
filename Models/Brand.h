//
//  Brand.h
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-17.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import <CoreData/CoreData.h>

@class Collection;
@class Image;
@class Product;

@interface Brand :  NSManagedObject  
{
}

@property (nonatomic, retain) NSNumber * remote_brand_id;
@property (nonatomic, retain) NSString * logo_file_name;
@property (nonatomic, retain) NSDate * logo_updated_at;
@property (nonatomic, retain) NSString * logo_url;
@property (nonatomic, retain) NSString * description;
@property (nonatomic, retain) NSDate * updated_at;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet* products;
@property (nonatomic, retain) NSSet* collections;
@property (nonatomic, retain) Image * image;

@end


@interface Brand (CoreDataGeneratedAccessors)
- (void)addProductsObject:(Product *)value;
- (void)removeProductsObject:(Product *)value;
- (void)addProducts:(NSSet *)value;
- (void)removeProducts:(NSSet *)value;

- (void)addCollectionsObject:(Collection *)value;
- (void)removeCollectionsObject:(Collection *)value;
- (void)addCollections:(NSSet *)value;
- (void)removeCollections:(NSSet *)value;

@end

