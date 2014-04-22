//
//  HBFluddColors.h
//  Fludd
//
//  Created by Henry Bourne on 16/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBFluddColors : NSObject
{
    NSArray *colors;
    int selectedColorSet;
}

- (NSArray *)currentFluddColors;
- (UIColor *)colorAtIndex:(int)colorIndex;
- (void)setColorSet:(int)colorSet;
//- (UIColor *)randomColor;

@end
