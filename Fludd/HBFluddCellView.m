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
    [UIView animateWithDuration:0.2
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{ self.backgroundColor = self.model.color; }
                     completion:nil];
}

- (void)cellAppears:(NSTimer *)timer
{
    NSLog(@"[HBFluddCellView cellAppears]");
    
    //double randomDelay = arc4random_uniform(100)/50.0;
    //NSLog(@"[HBFluddCellView cellAppears] randomDelay %f", randomDelay);
    
    [UIView animateWithDuration:0.2
                          delay:0
         usingSpringWithDamping:0.6
          initialSpringVelocity:1
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.transform = CGAffineTransformMakeScale(1, 1);
                         self.alpha = 1;
                     }
                     completion:^(BOOL finished){
                     }];
}

@end
