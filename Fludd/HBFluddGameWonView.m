//
//  HBFluddGameWonView.m
//  Fludd
//
//  Created by Henry Bourne on 04/05/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddGameWonView.h"

@implementation HBFluddGameWonView

+ (id)gameWonView
{
    NSLog(@"[HBFluddGameWonView gameWonView]");
    HBFluddGameWonView *gameWonView = [[[NSBundle mainBundle] loadNibNamed:@"HBFluddGameWonView" owner:nil options:nil] lastObject];
    
    // make sure gameWonView is not nil or the wrong class!
    if ([gameWonView isKindOfClass:[HBFluddGameWonView class]])
        return gameWonView;
    else
        return nil;
}

@end
