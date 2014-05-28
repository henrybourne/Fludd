//
//  HBFluddColorSet.m
//  Fludd
//
//  Created by Henry Bourne on 07/05/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddColorSet.h"

@implementation HBFluddColorSet

- (id)initWithTitle:(NSString *)title colorSetID:(int)colorSetID color0:(UIColor *)color0 color1:(UIColor *)color1 color2:(UIColor *)color2 color3:(UIColor *)color3 color4:(UIColor *)color4 color5:(UIColor *)color5
{
    self = [super init];
    if (self)
    {
        self.colorSetID = colorSetID;
        self.title = title;
        self.color0 = color0;
        self.color1 = color1;
        self.color2 = color2;
        self.color3 = color3;
        self.color4 = color4;
        self.color5 = color5;
    }
    return self;
}

@end
