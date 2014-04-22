//
//  HBFluddColorButton.h
//  Fludd
//
//  Created by Henry Bourne on 17/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HBFluddColorButton : UIControl

@property int colorID;
@property UIColor *color;

- (id)initWithFrame:(CGRect)frame colorID:(int)colorID color:(UIColor *)color;

@end
