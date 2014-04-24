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
#import "HBFluddBoard.h"



@interface HBFluddBoardView : UIView

@property HBFluddBoard *model;
@property NSMutableArray *cellViews;

- (id)initWithFrame:(CGRect)frame model:(HBFluddBoard *)model;
//- (HBFluddCellView *)cellViewAtRow:(int)row column:(int)column;

@end
