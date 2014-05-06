//
//  HBFluddBoard.h
//  Fludd
//
//  Created by Henry Bourne on 16/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBFluddCellView.h"
#import "HBFluddColors.h"
#import "HBFluddGame.h"
#import "HBFluddMovesRemainingView.h"


@interface HBFluddGameView : UIView

@property HBFluddGame *model;
@property NSMutableArray *cellViews;
@property HBFluddMovesRemainingView *movesRemainingView;
@property NSTimer *cellAppearsTimer;
@property int timerCurrentCellIndex;

- (id)initWithFrame:(CGRect)frame model:(HBFluddGame *)model;
//- (HBFluddCellView *)cellViewAtRow:(int)row column:(int)column;

@end
