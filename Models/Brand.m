// 
//  Brand.m
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-17.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import "Brand.h"
#import "Collection.h"
#import "Image.h"
#import "Product.h"


@implementation Brand
@dynamic remote_brand_id;
@dynamic logo_file_name;
@dynamic logo_updated_at;
@dynamic logo_url;
@dynamic updated_at;
@dynamic remote_description;
@dynamic name;
@dynamic products;
@dynamic collections;
@dynamic image;

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


- (void)addCollectionsObject:(Collection *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"collections" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"collections"] addObject:value];
    [self didChangeValueForKey:@"collections" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeCollectionsObject:(Collection *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"collections" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"collections"] removeObject:value];
    [self didChangeValueForKey:@"collections" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addCollections:(NSSet *)value {    
    [self willChangeValueForKey:@"collections" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"collections"] unionSet:value];
    [self didChangeValueForKey:@"collections" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeCollections:(NSSet *)value {
    [self willChangeValueForKey:@"collections" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"collections"] minusSet:value];
    [self didChangeValueForKey:@"collections" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}



@end
