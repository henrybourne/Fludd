//
//  HBFluddSettingsViewController.h
//  Fludd
//
//  Created by Henry Bourne on 07/05/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBFluddColorSets.h"
#import "HBFluddMenuButtonView.h"

@protocol HBFluddColorSetsViewControllerDelegate <NSObject>
- (void)didSelectColorSetID:(int)colorSetID;
@end

@interface HBFluddColorSetsViewController : UIViewController

@property (nonatomic, weak) id<HBFluddColorSetsViewControllerDelegate> delegate;
@property HBFluddColorSets *colors;
@property NSMutableArray *colorButtons;
@property int newSelectedColorSetID;

@end
