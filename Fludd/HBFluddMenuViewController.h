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
#import "HBFluddMenuButtonView.h"

@interface HBFluddMenuViewController : UIViewController <HBFluddColorSetsViewControllerDelegate, HBFluddGameSizesViewControllerDelegate>

@property HBFluddGameSize *selectedGameSize;
@property HBFluddGameSizes *sizes;
@property HBFluddColorSets *colors;
@property UILabel *gameTitle;
@property UILabel *settingsTitle;
@property HBFluddMenuButtonView *smallGameButton;
@property HBFluddMenuButtonView *mediumGameButton;
@property HBFluddMenuButtonView *largeGameButton;
@property HBFluddMenuButtonView *settingsSizeButton;
@property HBFluddMenuButtonView *settingsColorButton;
@property HBFluddMenuButtonView *settingsModeButton;


- (NSString *)colorsArchivePath;
- (BOOL)saveColors;

@end
