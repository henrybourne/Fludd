//
//  HBFluddColorButton.m
//  Fludd
//
//  Created by Henry Bourne on 17/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddColorButton.h"

@implementation HBFluddColorButton

- (id)initWithFrame:(CGRect)frame colorID:(int)colorID color:(UIColor *)color
{
    self = [self initWithFrame:frame];
    if (self)
    {
        self.colorID = colorID;
        self.color = color;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}



- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UIBezierPath* squarePath = [UIBezierPath bezierPathWithRect:rect];
    [self.color setFill];
    [squarePath fill];
}


@end
