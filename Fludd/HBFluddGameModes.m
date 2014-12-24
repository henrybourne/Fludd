//
//  HBFluddGameModes.m
//  Fludd
//
//  Created by Henry Bourne on 26/05/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddGameModes.h"

@implementation HBFluddGameModes

- (id)init
{
    self = [super init];
    if (self)
    {
        self.modes = [NSMutableArray array];
        [self.modes addObject:[[HBFluddGameMode alloc] initWithType:HBFluddGameModeTypeNormal title:@"Normal" description:@"Fludd the board in the allowed number of moves."]];
        [self.modes addObject:[[HBFluddGameMode alloc] initWithType:HBFluddGameModeTypeWalls title:@"Walls" description:@"There are walls in the way. Fludd around them."]];
        //[self.modes addObject:[[HBFluddGameMode alloc] initWithType:HBFluddGameModeTypeTimed title:@"Timed" description:@"Fludd the board within the time limit. Think fast."]];
        self.selectedIndex = 0;
    }
    return self;
}

- (HBFluddGameMode *)selectedMode
{
    return [self.modes objectAtIndex:self.selectedIndex];
}

- (HBFluddGameMode *)modeAtIndex:(int)index
{
    return [self.modes objectAtIndex:index];
}

- (void)setMode:(int)index
{
    self.selectedIndex = index;
}

- (int)numberOfModes
{
    return (int)[self.modes count];
}

# pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInt:self.selectedIndex forKey:@"selectedIndex"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [self init];
    if (self)
    {
        self.selectedIndex = [aDecoder decodeIntForKey:@"selectedIndex"];
    }
    return self;
}

@end
