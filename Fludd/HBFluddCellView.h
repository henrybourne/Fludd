//
//  HBFluddSquare.h
//  Fludd
//
//  Created by Henry Bourne on 16/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBFluddCell.h"

@interface HBFluddCellView : UIView

@property HBFluddCell *model;

- (id)initWithFrame:(CGRect)frame model:(HBFluddCell *)model;
- (void)changeColor;

@end
