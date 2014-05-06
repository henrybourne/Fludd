//
//  HBFluddMenuViewController.h
//  Fludd
//
//  Created by Henry Bourne on 02/05/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBFluddNewGameButtonView.h"
#import "HBFluddGameViewController.h"

@interface HBFluddMenuViewController : UIViewController

@property BoardSize selectedBoardSize;
@property UILabel *gameTitle;
@property HBFluddNewGameButtonView *smallGameButton;
@property HBFluddNewGameButtonView *mediumGameButton;
@property HBFluddNewGameButtonView *largeGameButton;

@end
