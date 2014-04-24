//
//  HBFluddGame.h
//  Fludd
//
//  Created by Henry Bourne on 16/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HBFluddColors.h"
#import "HBFluddBoard.h"

static const int kNumberOfColors = 6;

typedef enum {
    kBoardSizeSmall,
    kBoardSizeMedium,
    kBoardSizeLarge
} BoardSize;


@interface HBFluddGame : NSObject

@property int boardSize;
@property HBFluddBoard *board;
@property HBFluddColors *colors;
@property int movesAllowed;
@property int movesRemaining;
@property NSArray *boardSizeParameters;

- (id)initWithBoardSize:(BoardSize)boardSize;
- (void)newGameWithBoardSize:(BoardSize)boardSize;
- (void)restartGameWithSameBoard;
- (void)updateFluddWithColorID:(int)colorID;
- (BOOL)isGameWon;
- (BOOL)isGameLost;

@end
