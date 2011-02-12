//
//  Collection.h
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-17.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Brand, Image, Product;

@interface Collection : NSManagedObject {
@private
}
@property (nonatomic, retain) NSDate * updated_at;
@property (nonatomic, retain) NSString * remote_description;
@property (nonatomic, retain) NSNumber * remote_collection_id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet* products;
@property (nonatomic, retain) Image * image;
@property (nonatomic, retain) Brand * brand;

@end
