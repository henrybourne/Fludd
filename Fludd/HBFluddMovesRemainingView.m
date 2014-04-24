//
//  HBFluddMovesRemainingView.m
//  Fludd
//
//  Created by Henry Bourne on 24/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddMovesRemainingView.h"

@implementation HBFluddMovesRemainingView

- (id)initWithFrame:(CGRect)frame model:(HBFluddGame *)model
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.model = model;
        
        self.movesRemainingTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 25)];
        self.movesRemainingTitleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:20];
        self.movesRemainingTitleLabel.textColor = [UIColor whiteColor];
        self.movesRemainingTitleLabel.text = @"Moves Remaining";
        [self addSubview:self.movesRemainingTitleLabel];
        
        self.movesRemainingLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 55)];
        self.movesRemainingLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:55];
        self.movesRemainingLabel.textColor = [UIColor whiteColor];
        self.movesRemainingLabel.text = [NSString stringWithFormat:@"%i", self.model.movesRemaining];
        [self addSubview:self.movesRemainingLabel];
    }
    return self;
}

- (void)setNeedsDisplay
{
    [super setNeedsDisplay];
    self.movesRemainingLabel.text = [NSString stringWithFormat:@"%i", self.model.movesRemaining];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code

}
*/

@end
