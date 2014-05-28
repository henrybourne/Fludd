//
//  HBFluddGameSizes.m
//  Fludd
//
//  Created by Henry Bourne on 26/05/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddGameSizes.h"

@implementation HBFluddGameSizes

- (id)init
{
    self = [super init];
    if (self)
    {
        self.sizes = [NSMutableArray array];
        [self.sizes addObject:[[HBFluddGameSize alloc] initWithNumberOfCells:12 movesAllowed:22]];
        [self.sizes addObject:[[HBFluddGameSize alloc] initWithNumberOfCells:17 movesAllowed:30]];
        [self.sizes addObject:[[HBFluddGameSize alloc] initWithNumberOfCells:22 movesAllowed:36]];
        self.selectedIndex = 0;
    }
    return self;
}

- (HBFluddGameSize *)selectedSize
{
    return [self.sizes objectAtIndex:self.selectedIndex];
}

- (HBFluddGameSize *)sizeAtIndex:(int)index
{
    return [self.sizes objectAtIndex:index];
}

- (void)setSize:(int)index
{
    self.selectedIndex = index;
}

- (int)numberOfSizes
{
    return (int)[self.sizes count];
}


# pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInt:self.selectedIndex forKey:@"selectedIndex"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [self init];
    if (self) {
        self.selectedIndex = [aDecoder decodeIntForKey:@"selectedIndex"];
    }
    return self;
}

@end
