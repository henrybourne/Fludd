//
//  HBFluddCell.m
//  Fludd
//
//  Created by Henry Bourne on 22/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddCell.h"

@implementation HBFluddCell

- (id)initWithSize:(int)cellSize colorID:(int)colorID color:(UIColor *)color
{
    self = [super init];
    if (self)
    {
        self.cellSize   = cellSize;
        self.colorID    = colorID;
        self.color      = color;
        self.isFludded  = NO;
        self.isWall     = NO;
    }
    return self;
}



@end
