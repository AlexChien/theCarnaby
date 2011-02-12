//
//  Brand.h
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-17.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Collection, Image, Product;

@interface Brand : NSManagedObject {
@private
}
@property (nonatomic, retain) NSNumber * remote_brand_id;
@property (nonatomic, retain) NSString * logo_file_name;
@property (nonatomic, retain) NSDate * logo_updated_at;
@property (nonatomic, retain) NSString * logo_url;
@property (nonatomic, retain) NSDate * updated_at;
@property (nonatomic, retain) NSString * remote_description;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet* products;
@property (nonatomic, retain) NSSet* collections;
@property (nonatomic, retain) Image * image;

@end
