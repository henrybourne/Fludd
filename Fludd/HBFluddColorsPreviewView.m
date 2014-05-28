//
//  HBFluddColorsPreviewView.m
//  Fludd
//
//  Created by Henry Bourne on 06/05/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddColorsPreviewView.h"

@implementation HBFluddColorsPreviewView

- (id)initWithFrame:(CGRect)frame colorSet:(HBFluddColorSet *)colorSet
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        self.colorSet = colorSet;
        self.userInteractionEnabled = NO;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    UIBezierPath* color1Path = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 15, 15)];
    [self.colorSet.color0 setFill];
    [color1Path fill];
    UIBezierPath* color2Path = [UIBezierPath bezierPathWithRect: CGRectMake(15, 0, 15, 15)];
    [self.colorSet.color1 setFill];
    [color2Path fill];
    UIBezierPath* color3Path = [UIBezierPath bezierPathWithRect: CGRectMake(30, 0, 15, 15)];
    [self.colorSet.color2 setFill];
    [color3Path fill];
    UIBezierPath* color4Path = [UIBezierPath bezierPathWithRect: CGRectMake(45, 0, 15, 15)];
    [self.colorSet.color3 setFill];
    [color4Path fill];
    UIBezierPath* color5Path = [UIBezierPath bezierPathWithRect: CGRectMake(60, 0, 15, 15)];
    [self.colorSet.color4 setFill];
    [color5Path fill];
    UIBezierPath* color6Path = [UIBezierPath bezierPathWithRect: CGRectMake(75, 0, 15, 15)];
    [self.colorSet.color5 setFill];
    [color6Path fill];
}


@end
