//
//  Video.h
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-17.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface Video :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * path;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSDate * updated_at;
@property (nonatomic, retain) NSString * description;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSNumber * remote_video_id;

@end



