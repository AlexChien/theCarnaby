//
//  PagesController.h
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-17.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import <Three20/Three20.h>

typedef enum {
  PageNone,
  PageBrands,
  PageCollections,  
  PageProducts,
  PageCoupons,
  PageShops,
  PageVideos,
  PageShares,  
} Page;

@interface PagesController : UIViewController {
  Page _page;
}

@property(nonatomic) Page page;

@end
