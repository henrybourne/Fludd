//
//  HBFluddSquare.m
//  Fludd
//
//  Created by Henry Bourne on 16/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddSquare.h"

@implementation HBFluddSquare

- (id)initWithSize:(int)squareSize colorID:(int)colorID color:(UIColor *)color
{
    self.size = squareSize;
    self.colorID = colorID;
    self.color = color;
    CGRect rect = CGRectMake(0, 0, squareSize, squareSize);
    return [self initWithFrame:rect];
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
    UIBezierPath* squarePath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, self.size, self.size)];
    [self.color setFill];
    [squarePath fill];
    
    if (self.isFludded)
    {
        UIBezierPath* dotPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.size/3, self.size/3, self.size/3, self.size/3)];
        [[UIColor blackColor] setFill];
        [dotPath fill];
    }
}

@end
