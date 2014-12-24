//
//  HBFluddCell.h
//  Fludd
//
//  Created by Henry Bourne on 22/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <UIKit/UIKit.h>

@interface HBFluddCell : NSObject

@property BOOL isFludded;
@property int colorID;
@property UIColor *color;
@property int cellSize;
@property BOOL isWall;

- (id)initWithSize:(int)cellSize colorID:(int)colorID color:(UIColor *)color;

@end
