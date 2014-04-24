//
//  HBFluddBoard.h
//  Fludd
//
//  Created by Henry Bourne on 22/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HBFluddColors.h"
#import "HBFluddCell.h"
#import "HBFluddCellView.h"

static const int kHBFluddBoardSize = 300;

@interface HBFluddBoard : NSObject

@property NSMutableArray *cells;
@property HBFluddColors *colors;
@property int numberOfCells;
@property int cellSize;

- (id)initWithNumberOfCells:(int)numberOfSquares colors:(HBFluddColors *)currentColors;
- (HBFluddCell *)cellAtRow:(int)row column:(int)column;
- (void)startFluddWithColorID:(int)colorID;
- (void)fluddNeighboursAtRow:(int)row column:(int)column withColorID:(int)colorID;
- (void)fluddAtRow:(int)row column:(int)column withColorID:(int)colorID;
- (BOOL)isBoardFludded;

@end
