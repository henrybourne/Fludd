//
//  HBFluddColorButton.m
//  Fludd
//
//  Created by Henry Bourne on 23/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddColorButton.h"

@implementation HBFluddColorButton


- (id)initWithColorID:(int)colorID color:(UIColor *)color
{
    self = [self init];
    if (self)
    {
        self.colorID    = colorID;
        self.color      = color;
    }
    return self;
}


@end
