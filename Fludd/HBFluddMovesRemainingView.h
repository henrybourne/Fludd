//
//  HBFluddMovesRemainingView.h
//  Fludd
//
//  Created by Henry Bourne on 24/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBFluddGame.h"

@interface HBFluddMovesRemainingView : UIView

@property HBFluddGame *model;
@property UILabel *movesRemainingLabel;
@property UILabel *movesRemainingTitleLabel;
@property BOOL compactView;

- (id)initWithFrame:(CGRect)frame model:(HBFluddGame *)model compactView:(BOOL)compactView;

@end
