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
        // Initialization code
        UILabel *movesRemainingTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 60)];
        movesRemainingTitleLabel.text = @"Moves Remaining";
        [self addSubview:movesRemainingTitleLabel];
        UILabel *movesRemainingLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, 300, 60)];
        movesRemainingLabel.text = self.model.board.mo;
        [self addSubview:movesRemainingLabel];
    }
    return self;
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
