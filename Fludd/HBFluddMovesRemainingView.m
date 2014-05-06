//
//  HBFluddMovesRemainingView.m
//  Fludd
//
//  Created by Henry Bourne on 24/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddMovesRemainingView.h"

@implementation HBFluddMovesRemainingView

- (id)initWithFrame:(CGRect)frame model:(HBFluddGame *)model compactView:(BOOL)compactView
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.model = model;
        self.compactView = compactView;
        
        if (self.compactView == YES)
        {
            self.movesRemainingTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(53, 24, 300, 25)];
            self.movesRemainingTitleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:17];

            self.movesRemainingLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 55)];
            self.movesRemainingLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:40];
        }
        else
        {
            self.movesRemainingTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 25)];
            self.movesRemainingTitleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:20];

            self.movesRemainingLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 55)];
            self.movesRemainingLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:55];
        }
        
        self.movesRemainingTitleLabel.textColor = [UIColor whiteColor];
        self.movesRemainingTitleLabel.text = @"Moves Remaining";
        [self addSubview:self.movesRemainingTitleLabel];
        
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
    if (self.compactView == YES)
    {
        if (self.model.movesRemaining < 10)
        {
            self.movesRemainingTitleLabel.frame = CGRectMake(30, self.movesRemainingTitleLabel.frame.origin.y, self.movesRemainingTitleLabel.frame.size.width,self.movesRemainingTitleLabel.frame.size.height);
        }
        else
        {
            self.movesRemainingTitleLabel.frame = CGRectMake(53, self.movesRemainingTitleLabel.frame.origin.y, self.movesRemainingTitleLabel.frame.size.width,self.movesRemainingTitleLabel.frame.size.height);
        }
    }
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
