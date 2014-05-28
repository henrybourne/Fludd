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
#import "HBFluddGameWonView.h"
#import "HBFluddGameLostView.h"
#import "HBFluddGameSize.h"

@interface HBFluddGameViewController : UIViewController

@property HBFluddGame *model;
@property HBFluddColorSets *colors;
@property HBFluddGameView *gameView;
@property HBFluddGameView *oldGameView;
@property HBFluddMovesRemainingView *movesRemainingView;
@property HBFluddGameWonView *gameWonView;
@property HBFluddGameLostView *gameLostView;
@property HBFluddGameSize *gameSize;
@property CGRect boardFrame;
@property BOOL isGameActive;

- (id)initWithGameSize:(HBFluddGameSize *)gameSize;
- (void)colorButtonTappedWithSender:(HBFluddColorButtonView *)sender;
- (void)newButtonTapped;

@end
