//
//  HBFluddColors.m
//  Fludd
//
//  Created by Henry Bourne on 16/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddColors.h"

@implementation HBFluddColors

- (id)init
{
    self = [super init];
    if (self)
    {
        colors = [NSArray arrayWithObjects:
                  [NSArray arrayWithObjects:[UIColor colorWithRed:0.741 green:0.314 blue:0.314 alpha:1],
                   [UIColor colorWithRed:0.800 green:0.690 blue:0.263 alpha:1],
                   [UIColor colorWithRed:0.325 green:0.741 blue:0.365 alpha:1],
                   [UIColor colorWithRed:0.388 green:0.675 blue:0.733 alpha:1],
                   [UIColor colorWithRed:0.306 green:0.478 blue:0.627 alpha:1],
                   [UIColor colorWithRed:0.627 green:0.388 blue:0.722 alpha:1],
                   nil],
                  nil];
        selectedColorSet = 0;
    }
    return self;
}

- (NSArray *)currentFluddColors
{
    return [colors objectAtIndex:selectedColorSet];
}

- (UIColor *)colorAtIndex:(int)colorIndex
{
    return [[colors objectAtIndex:selectedColorSet] objectAtIndex:colorIndex];
}

- (void)setColorSet:(int)colorSet
{
    if (colorSet < [colors count])
    {
        selectedColorSet = colorSet;
    }
    else
    {
        selectedColorSet = (int)[colors count]-1;
    }
    
}

@end
