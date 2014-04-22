//
//  HBFluddSquare.h
//  Fludd
//
//  Created by Henry Bourne on 16/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HBFluddSquare : UIView

@property BOOL isFludded;
@property int colorID;
@property UIColor *color;
@property int size;

- (id)initWithSize:(int)squareSize colorID:(int)colorID color:(UIColor *)color;

@end
