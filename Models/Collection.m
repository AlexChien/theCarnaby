//
//  Collection.m
//  theCarnaby
//
//  Created by stainless on 11-2-11.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "Collection.h"
#import "Brand.h"
#import "Image.h"
#import "Product.h"


@implementation Collection
@dynamic updated_at;
@dynamic remote_description;
@dynamic remote_collection_id;
@dynamic name;
@dynamic products;
@dynamic image;
@dynamic brand;

- (void)addProductsObject:(Product *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"products" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"products"] addObject:value];
    [self didChangeValueForKey:@"products" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeProductsObject:(Product *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"products" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"products"] removeObject:value];
    [self didChangeValueForKey:@"products" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addProducts:(NSSet *)value {    
    [self willChangeValueForKey:@"products" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"products"] unionSet:value];
    [self didChangeValueForKey:@"products" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeProducts:(NSSet *)value {
    [self willChangeValueForKey:@"products" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"products"] minusSet:value];
    [self didChangeValueForKey:@"products" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}




@end
