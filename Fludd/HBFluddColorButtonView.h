//
//  HBFluddColorButton.h
//  Fludd
//
//  Created by Henry Bourne on 17/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBFluddColorButton.h"

@interface HBFluddColorButtonView : UIButton


@property HBFluddColorButton *model;

- (id)initWithFrame:(CGRect)frame model:(HBFluddColorButton *)model;

@end
