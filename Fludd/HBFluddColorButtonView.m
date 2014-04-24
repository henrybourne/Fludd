//
//  HBFluddColorButton.m
//  Fludd
//
//  Created by Henry Bourne on 17/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddColorButtonView.h"

@implementation HBFluddColorButtonView

- (id)initWithFrame:(CGRect)frame model:(HBFluddColorButton *)model
{
    self = [self initWithFrame:frame];
    if (self)
    {
        self.model = model;
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
    [self.model.color setFill];
    [squarePath fill];
}


@end
