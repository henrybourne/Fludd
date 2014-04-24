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

@interface HBFluddViewController : UIViewController

@property HBFluddGame *model;
@property HBFluddGameView *gameView;
@property HBFluddMovesRemainingView *movesRemainingView;

- (void)colorButtonTappedWithSender:(HBFluddColorButtonView *)sender;

@end
