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
        self.backgroundColor = self.model.color;
    }
    return self;
}

- (void)changeColor
{
//    [UIView animateWithDuration:0.3 animations:^{ self.backgroundColor = self.model.color; }];
    [UIView animateWithDuration:0.2
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{ self.backgroundColor = self.model.color; }
                     completion:nil];
}

@end
