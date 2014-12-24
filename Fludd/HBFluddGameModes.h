//
//  HBFluddGameModes.h
//  Fludd
//
//  Created by Henry Bourne on 26/05/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HBFluddGameMode.h"

typedef NS_ENUM(NSInteger, HBFluddGameModeOptions) {
    HBFluddGameModeNormal,
    HBFluddGameModeWalls,
    HBFluddGameModeTimed
};

@interface HBFluddGameModes : NSObject <NSCoding>

@property NSMutableArray *modes;
@property int selectedIndex;

- (HBFluddGameMode *)modeAtIndex:(int)index;
- (HBFluddGameMode *)selectedMode;
- (void)setMode:(int)index;
- (int)numberOfModes;

@end
