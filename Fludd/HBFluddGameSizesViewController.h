//
//  HBFluddGameSizesViewController.h
//  Fludd
//
//  Created by Henry Bourne on 26/05/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBFluddGameSizes.h"
#import "HBFluddMenuButtonView.h"

@protocol HBFluddGameSizesViewControllerDelegate <NSObject>
- (void)didSelectGameSize:(int)index;
@end

@interface HBFluddGameSizesViewController : UIViewController

@property (nonatomic, weak) id<HBFluddGameSizesViewControllerDelegate> delegate;
@property HBFluddGameSizes *sizes;
@property NSMutableArray *sizeButtons;
@property int newSelectedSizeIndex;

@end
