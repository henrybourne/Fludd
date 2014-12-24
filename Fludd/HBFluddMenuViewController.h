//
//  HBFluddMenuViewController.h
//  Fludd
//
//  Created by Henry Bourne on 02/05/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBFluddGameViewController.h"
#import "HBFluddColorSetsViewController.h"
#import "HBFluddGameSizesViewController.h"
#import "HBFluddGameModesViewController.h"
#import "HBFluddMenuButtonView.h"

@interface HBFluddMenuViewController : UIViewController <HBFluddGameModesViewControllerDelegate, HBFluddColorSetsViewControllerDelegate, HBFluddGameSizesViewControllerDelegate>

@property HBFluddGameSize *selectedGameSize;
@property HBFluddGameSizes *sizes;
@property HBFluddColorSets *colors;
@property HBFluddGameModes *modes;
@property UILabel *gameTitle;
@property UILabel *settingsTitle;
@property UIButton *startGameButton;
@property HBFluddMenuButtonView *settingsSizeButton;
@property HBFluddMenuButtonView *settingsColorButton;
@property HBFluddMenuButtonView *settingsModeButton;
@property HBFluddMenuButtonView *howToPlayButton;
@property UIView *menuButtonsContainer;
@property UIView *cellViewsContainer;
@property NSMutableArray *cellViews;
@property int cellRows;
@property int yPosNewButton;
@property int yPosMenuButtons;


- (NSString *)colorsArchivePath;
- (BOOL)saveColors;

@end
