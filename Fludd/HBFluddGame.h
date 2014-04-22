//
//  HBFluddGame.h
//  Fludd
//
//  Created by Henry Bourne on 16/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HBFluddColors.h"
#import "HBFluddSquare.h"
#import "HBFluddBoardView.h"

static const int kNumberOfColors = 6;


@interface HBFluddGame : NSObject

@property int boardSize;
@property HBFluddBoardView *board;
@property HBFluddColors *colors;



@end
