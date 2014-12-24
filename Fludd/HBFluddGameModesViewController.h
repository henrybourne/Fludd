//
//  HBGameModesViewController.h
//  Fludd
//
//  Created by Henry Bourne on 28/05/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBFluddGameModes.h"
#import "HBFluddMenuButtonView.h"

@protocol HBFluddGameModesViewControllerDelegate <NSObject>
- (void)didSelectGameMode:(int)index;
@end

@interface HBFluddGameModesViewController : UIViewController

@property (nonatomic, weak) id<HBFluddGameModesViewControllerDelegate> delegate;
@property HBFluddGameModes *modes;
@property NSMutableArray *modeButtons;
@property int newSelectedIndex;

@end
