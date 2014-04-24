//
//  HBFluddColorButton.h
//  Fludd
//
//  Created by Henry Bourne on 23/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBFluddColorButton : NSObject

@property int colorID;
@property UIColor *color;

- (id)initWithColorID:(int)colorID color:(UIColor *)color;

@end
