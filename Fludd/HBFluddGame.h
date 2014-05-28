//
//  HBFluddGame.h
//  Fludd
//
//  Created by Henry Bourne on 16/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HBFluddColorSets.h"
#import "HBFluddCell.h"
#import "HBFluddGameSize.h"

static const int kNumberOfColors = 6;
static const int kHBFluddBoardSizeInPoints = 300;

typedef enum {
    kBoardSizeSmall,
    kBoardSizeMedium,
    kBoardSizeLarge
} BoardSize;


@interface HBFluddGame : NSObject

@property int numberOfCells;
@property int cellSize;
@property NSMutableArray *cells;
@property HBFluddColorSets *colors;
@property int movesAllowed;
@property int movesRemaining;
@property BOOL isFirstMove;

- (id)initWithGameSize:(HBFluddGameSize *)gameSize colors:(HBFluddColorSets *)colors;
- (void)newGameWithGameSize:(HBFluddGameSize *)gameSize colors:(HBFluddColorSets *)colors;
- (void)restartGameWithSameBoard;
- (BOOL)isGameWon;
- (BOOL)isGameLost;

- (HBFluddCell *)cellAtRow:(int)row column:(int)column;
- (void)startFluddWithColorID:(int)colorID;
- (void)fluddNeighboursAtRow:(int)row column:(int)column withColorID:(int)colorID;
- (void)fluddAtRow:(int)row column:(int)column withColorID:(int)colorID;
- (BOOL)isBoardFludded;

@end
