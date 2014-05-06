//
//  HBFluddNewGameButtonView.h
//  Fludd
//
//  Created by Henry Bourne on 04/05/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HBFluddNewGameButtonView : UIButton

@property BOOL showBottomBorder;
@property UILabel *mainLabel;
@property UILabel *subLabel;
@property UIImageView *chevron;

- (id)initWithFrame:(CGRect)frame mainLabel:(NSString *)mainLabel subLabel:(NSString *)subLabel showBottomBorder:(BOOL)showBottomBorder;

@end
