//
//  HBFluddColors.h
//  Fludd
//
//  Created by Henry Bourne on 16/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HBFluddColorSet.h"

@interface HBFluddColorSets : NSObject <NSCoding>

@property NSMutableArray *colors;
@property int selectedColorSetID;

- (HBFluddColorSet *)currentFluddColors;
- (UIColor *)colorAtIndex:(int)colorIndex;
- (HBFluddColorSet *)colorSetAtIndex:(int)colorSetIndex;
- (HBFluddColorSet *)selectedColorSet;
- (void)setColorSet:(int)colorSet;
- (int)numberOfColorSets;

@end
