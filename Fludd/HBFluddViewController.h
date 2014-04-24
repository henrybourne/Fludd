//
//  HBViewController.h
//  Fludd
//
//  Created by Henry Bourne on 16/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBFluddBoard.h"
#import "HBFluddBoardView.h"
#import "HBFluddCell.h"
#import "HBFluddCellView.h"
#import "HBFluddColorButtonView.h"
#import "HBFluddGame.h"

@interface HBFluddViewController : UIViewController

@property HBFluddGame *model;
@property HBFluddBoardView *boardView;

- (void)colorButtonTappedWithSender:(HBFluddColorButtonView *)sender;

@end
