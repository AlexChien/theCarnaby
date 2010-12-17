//
//  Shop.h
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-17.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface Shop :  NSManagedObject  
{
}

@property (nonatomic, retain) NSNumber * remote_shop_id;
@property (nonatomic, retain) NSString * description;
@property (nonatomic, retain) NSString * address_en;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSString * description_en;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSString * province;
@property (nonatomic, retain) NSString * province_en;
@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * shop_type;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSDate * updated_at;
@property (nonatomic, retain) NSString * city_en;
@property (nonatomic, retain) NSString * name_en;
@property (nonatomic, retain) NSString * name;

@end



