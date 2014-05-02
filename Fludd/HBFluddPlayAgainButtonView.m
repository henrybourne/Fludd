//
//  HBFluddWonView.m
//  Fludd
//
//  Created by Henry Bourne on 26/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddPlayAgainButtonView.h"

@implementation HBFluddPlayAgainButtonView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    //// Rounded Rectangle Drawing
    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0, 0, rect.size.width, rect.size.height) cornerRadius: 4];
    [[UIColor clearColor] setFill];
    [roundedRectanglePath fill];
    [[UIColor blackColor] setStroke];
    roundedRectanglePath.lineWidth = 1;
    [roundedRectanglePath stroke];
    
    // Button Text
    UILabel *buttonText = [[UILabel alloc] initWithFrame:rect];
    buttonText.text = @"Play Again";
    buttonText.center = CGPointMake(rect.size.width/2, rect.size.height/2);
    buttonText.textAlignment = NSTextAlignmentCenter;
    buttonText.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:35];
    buttonText.textColor = [UIColor blackColor];
    [self addSubview:buttonText];
}


@end
