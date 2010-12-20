//
//  MapController.h
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-20.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "Shop.h"

@interface MapController : TTViewController <MKMapViewDelegate> {
  NSMutableArray *mapAnnotations;
  NSNumber *shop_id;
  NSString  *shop_name;
  Shop *_shop;  
}

@property (nonatomic, retain) NSMutableArray *mapAnnotations;
@property (nonatomic, retain) NSNumber *shop_id;
@property (nonatomic, retain) NSString  *shop_name;
@property (nonatomic, retain) Shop  *_shop;

+ (CGFloat)annotationPadding;

@end
