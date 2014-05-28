//
//  HBFluddColorSet.h
//  Fludd
//
//  Created by Henry Bourne on 07/05/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBFluddColorSet : NSObject

@property int colorSetID;
@property NSString *title;
@property UIColor *color0;
@property UIColor *color1;
@property UIColor *color2;
@property UIColor *color3;
@property UIColor *color4;
@property UIColor *color5;

- (id)initWithTitle:(NSString *)title colorSetID:(int)colorSetID color0:(UIColor *)color0 color1:(UIColor *)color1 color2:(UIColor *)color2 color3:(UIColor *)color3 color4:(UIColor *)color4 color5:(UIColor *)color5;

@end
