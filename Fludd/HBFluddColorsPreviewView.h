//
//  HBFluddColorsPreviewView.h
//  Fludd
//
//  Created by Henry Bourne on 06/05/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBFluddColorSets.h"

@interface HBFluddColorsPreviewView : UIView

@property HBFluddColorSet *colorSet;

- (id)initWithFrame:(CGRect)frame colorSet:(HBFluddColorSet *)colorSet;

@end
