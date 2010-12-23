//
//  Annotation.h
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-20.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface Annotation : NSObject  <MKAnnotation> {
  NSNumber *latitude;
  NSNumber *longitude;
  NSString *_title;
  NSString *_subtitle;
  CLLocationCoordinate2D coordinate;
}

@property (nonatomic, retain) NSNumber *latitude;
@property (nonatomic, retain) NSNumber *longitude;
@property (nonatomic, retain) NSString *_title;
@property (nonatomic, retain) NSString *_subtitle;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

// add an init method so you can set the coordinate property on startup
- (id) initWithCoordinate:(CLLocationCoordinate2D)coord;

@end
