//
//  HBFluddGameLostView.m
//  Fludd
//
//  Created by Henry Bourne on 04/05/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddGameLostView.h"

@implementation HBFluddGameLostView

+ (id)gameLostView
{
    NSLog(@"[HBFluddGameLostView gameLostView]");
    HBFluddGameLostView *gameLostView = [[[NSBundle mainBundle] loadNibNamed:@"HBFluddGameLostView" owner:nil options:nil] lastObject];
    
    // make sure gameWonView is not nil or the wrong class!
    if ([gameLostView isKindOfClass:[HBFluddGameLostView class]])
        return gameLostView;
    else
        return nil;
}

@end
