//
//  HBFluddGameSize.m
//  Fludd
//
//  Created by Henry Bourne on 26/05/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddGameSize.h"

@implementation HBFluddGameSize

- (id)initWithNumberOfCells:(int)numberOfCells
               movesAllowed:(int)movesAllowed
              numberOfWalls:(int)numberOfWalls
                timeAllowed:(int)timeAllowed
                      title:(NSString *)title
{
    self = [super init];
    if (self)
    {
        self.numberOfCells = numberOfCells;
        self.movesAllowed = movesAllowed;
        self.numberOfWalls = numberOfWalls;
        self.title = title;
        self.timeAllowed = timeAllowed;
    }
    return self;
}

@end
