//
//  HBFluddMenuButtonView.h
//  Fludd
//
//  Created by Henry Bourne on 06/05/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBFluddColorSet.h"
#import "HBFluddColorsPreviewView.h"

typedef NS_ENUM(NSInteger, HBFluddMenuButtonAccessoryType) {
    HBFluddMenuButtonAccessoryTypeNone,
    HBFluddMenuButtonAccessoryTypeChevron,
    HBFluddMenuButtonAccessoryTypeCheck
};

typedef NS_ENUM(NSInteger, HBFluddMenuButtonBorderType) {
    HBFluddMenuButtonBorderTypeTop,
    HBFluddMenuButtonBorderTypeBottom,
    HBFluddMenuButtonBorderTypeBoth
};

@interface HBFluddMenuButtonView : UIButton

@property BOOL showChevron;
@property BOOL showTopBorder;
@property BOOL showBottomBorder;
@property UILabel *mainLabel;
@property UILabel *subLabel;
@property UIImageView *accessory;
@property HBFluddColorsPreviewView *colorPreviewView;
@property int index;

- (id)initWithFrame:(CGRect)frame mainLabel:(NSString *)mainLabel;
- (void)showAccessory:(HBFluddMenuButtonAccessoryType)accessoryType;
- (void)showBorder:(HBFluddMenuButtonBorderType)borderType;
- (void)showSublabel:(NSString *)sublabel;
- (void)showColorSet:(HBFluddColorSet *)colorSet;


@end
