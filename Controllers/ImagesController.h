//
//  ImagesController.h
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-17.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "Collection.h"
//#import "Photo.h"


///////////////////////////////////////////////////////////////////////////////////////////////////

typedef enum {
  PhotoSourceNormal = 0,
  PhotoSourceDelayed = 1,
  PhotoSourceVariableCount = 2,
  PhotoSourceLoadError = 4,
} PhotoSourceType;

///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark TTPhotoSource


@interface PhotoSource : TTURLRequestModel <TTPhotoSource> {
  PhotoSourceType _type;
  NSString* _title;
  NSMutableArray* _photos;
  NSArray* _tempPhotos;
  NSTimer* _loadTimer;
}

- (id)initWithType:(PhotoSourceType)type title:(NSString*)title
            photos:(NSArray*)photos photos2:(NSArray*)photos2;

@end


///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark TTPhoto


@interface CIImage : NSObject <TTPhoto> {
  id<TTPhotoSource> _photoSource;
  NSString* _thumbURL;
  NSString* _smallURL;
  NSString* _URL;
  CGSize _size;
  NSInteger _index;
  NSString* _caption;
}

- (id)initWithURL:(NSString*)URL smallURL:(NSString*)smallURL size:(CGSize)size;

- (id)initWithURL:(NSString*)URL smallURL:(NSString*)smallURL size:(CGSize)size
          caption:(NSString*)caption;


@end
