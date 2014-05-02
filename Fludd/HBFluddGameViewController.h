//
//  HBViewController.h
//  Fludd
//
//  Created by Henry Bourne on 16/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBFluddGame.h"
#import "HBFluddGameView.h"
#import "HBFluddColorButtonView.h"
#import "HBFluddMovesRemainingView.h"
#import "HBFluddPlayAgainButtonView.h"
#import "HBFluddGameOverView.h"

@interface HBFluddGameViewController : UIViewController

@property HBFluddGame *model;
@property HBFluddGameView *gameView;
@property HBFluddGameView *oldGameView;
@property HBFluddMovesRemainingView *movesRemainingView;
@property HBFluddGameOverView *gameOverView;
@property CGRect boardFrame;
@property BOOL isGameActive;

- (void)colorButtonTappedWithSender:(HBFluddColorButtonView *)sender;
- (void)newButtonTapped;

@end
