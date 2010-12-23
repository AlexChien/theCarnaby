//
//  Annotation.m
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-20.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import "Annotation.h"


@implementation Annotation


@synthesize _title;
@synthesize _subtitle;
@synthesize latitude;
@synthesize longitude;
@synthesize coordinate;


//-(id)initWithLatitude:(NSNumber*)latitude longitude(NSNumber*)longitude title:(NSString*)title subtitle:(NSString:*)subtitle{
//  if (self = [super init]) {
//    self.lati
//  }
//  return self;
//}

- (id) initWithCoordinate:(CLLocationCoordinate2D)coord{
  if (self = [super init]) {
    coordinate = coord;
  }
  return self;  
}

//- (CLLocationCoordinate2D)coordinate;
//{
//  CLLocationCoordinate2D theCoordinate;
//  theCoordinate.latitude = [self.latitude floatValue];
//  theCoordinate.longitude = [self.longitude floatValue];
//  return theCoordinate; 
//}


- (void)dealloc
{
  [_title release];
  [_subtitle release];
  [latitude release];
  [longitude release];
  [super dealloc];
}

// required if you set the MKPinAnnotationView's "canShowCallout" property to YES
- (NSString *)title{
  return self._title;
}

// optional
- (NSString *)subtitle{
  return self._subtitle;
}




@end
