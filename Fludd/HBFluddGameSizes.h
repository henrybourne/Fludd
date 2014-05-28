//
//  HBFluddGameSizes.h
//  Fludd
//
//  Created by Henry Bourne on 26/05/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HBFluddGameSize.h"

@interface HBFluddGameSizes : NSObject <NSCoding>

@property NSMutableArray *sizes;
@property int selectedIndex;

- (HBFluddGameSize *)sizeAtIndex:(int)index;
- (HBFluddGameSize *)selectedSize;
- (void)setSize:(int)index;
- (int)numberOfSizes;

@end
