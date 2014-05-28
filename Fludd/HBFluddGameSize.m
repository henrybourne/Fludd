//
//  HBFluddGameSize.m
//  Fludd
//
//  Created by Henry Bourne on 26/05/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddGameSize.h"

@implementation HBFluddGameSize

- (id)initWithNumberOfCells:(int)numberOfCells movesAllowed:(int)movesAllowed
{
    self = [super init];
    if (self)
    {
        self.numberOfCells = numberOfCells;
        self.movesAllowed = movesAllowed;
        self.title = [NSString stringWithFormat:@"%i x %i", self.numberOfCells, self.numberOfCells];
    }
    return self;
}

@end
