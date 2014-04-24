//
//  HBFluddSquare.m
//  Fludd
//
//  Created by Henry Bourne on 16/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddCellView.h"

@implementation HBFluddCellView

- (id)initWithFrame:(CGRect)frame model:(HBFluddCell *)model
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.model = model;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    UIBezierPath* squarePath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, self.model.cellSize, self.model.cellSize)];
    [self.model.color setFill];
    [squarePath fill];
    
    // VISUAL TEST TO SHOW WHICH ITEMS ARE FLUDDED
    if (self.model.isFludded)
    {
        UIBezierPath* dotPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake((self.model.cellSize/2)-2, (self.model.cellSize/2)-2,4, 4)];
        [[UIColor blackColor] setFill];
        [dotPath fill];
    }
}

@end
