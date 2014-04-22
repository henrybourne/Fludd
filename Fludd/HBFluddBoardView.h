//
//  HBFluddBoard.h
//  Fludd
//
//  Created by Henry Bourne on 16/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBFluddSquare.h"
#import "HBFluddColors.h"

static const int kHBFluddBoardSize = 300;


@interface HBFluddBoardView : UIView
{
    
    NSMutableArray *board;
    int boardSize;
}
@property HBFluddColors *boardColors;

- (id)initWithFrame:(CGRect)frame numberOfSquares:(int)numberOfSquares colors:(HBFluddColors *)currentColors;

@end
