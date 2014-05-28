//
//  HBFluddGame.m
//  Fludd
//
//  Created by Henry Bourne on 16/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddGame.h"

@implementation HBFluddGame

- (id)initWithGameSize:(HBFluddGameSize *)gameSize colors:(HBFluddColorSets *)colors
{
    self = [super init];
    if (self)
    {
        [self newGameWithGameSize:gameSize colors:colors];
    }
    return self;
}

- (void)newGameWithGameSize:(HBFluddGameSize *)gameSize colors:(HBFluddColorSets *)colors
{
    
    self.movesAllowed = gameSize.movesAllowed;
    self.numberOfCells = gameSize.numberOfCells;
    self.movesRemaining = self.movesAllowed;
    self.colors = colors;
    self.isFirstMove = YES;
    
    // Set up the cells
    self.cells = [NSMutableArray arrayWithCapacity:self.numberOfCells];
    self.cellSize = kHBFluddBoardSizeInPoints/self.numberOfCells;
    
    int randomColorIndex;
    
    for (int row = 0; row < self.numberOfCells; row++)
    {
        // Set up the row array
        NSMutableArray *currentRow = [NSMutableArray arrayWithCapacity:self.numberOfCells];
        for (int column = 0; column < self.numberOfCells; column++)
        {
            randomColorIndex = arc4random_uniform(6);
            HBFluddCell *currentCell = [[HBFluddCell alloc] initWithSize:self.cellSize
                                                                 colorID:randomColorIndex
                                                                   color:[self.colors colorAtIndex:randomColorIndex]];
            
            // Set up first fludded cell
            if (column == 0 && row == 0)
            {
                currentCell.isFludded = YES;
            }
            
            // Add the cell into the row array
            [currentRow setObject:currentCell atIndexedSubscript:column];
        }
        
        // Add the row array into the board array
        [self.cells setObject:currentRow atIndexedSubscript:row];
    }
    
    // Check if a fludd should happen right away
    [self startFluddWithColorID:[self cellAtRow:0 column:0].colorID];
}

- (void)restartGameWithSameBoard
{
    // Implement in future
}

- (BOOL)isGameWon
{
    return [self isBoardFludded];
}

- (BOOL)isGameLost
{
    if (self.movesRemaining == 0 && ![self isBoardFludded])
    {
        return YES;
    }
    return NO;
}

- (HBFluddCell *)cellAtRow:(int)row column:(int)column
{
    return [[self.cells objectAtIndex:row] objectAtIndex:column];
}

- (void)startFluddWithColorID:(int)colorID
{
    // Don't do anything if the color is the same as the current fludd color
    if (colorID == [[self cellAtRow:0 column:0] colorID] && !self.isFirstMove)
    {
        return;
    }
    
    // Change color of all fludded cells
    for (int row = 0; row < self.numberOfCells; row++)
    {
        for (int column = 0; column < self.numberOfCells; column++)
        {
            HBFluddCell *currentCell = [self cellAtRow:row column:column];
            if (currentCell.isFludded)
            {
                currentCell.colorID = colorID;
                currentCell.color = [self.colors colorAtIndex:colorID];
            }
        }
    }
    
    // Check all neighbors and fludd those that are the same color
    for (int row = 0; row < self.numberOfCells; row++)
    {
        for (int column = 0; column < self.numberOfCells; column++)
        {
            [self fluddNeighboursAtRow:row column:column withColorID:colorID];
        }
    }
    
    if (!self.isFirstMove)
    {
        // Check to see if the game is won
        self.movesRemaining--;
    }
    else
    {
        self.isFirstMove = NO;
    }
    
}

- (void)fluddNeighboursAtRow:(int)row column:(int)column withColorID:(int)colorID
{
    HBFluddCell *currentCell = [self cellAtRow:row column:column];
    if (currentCell.isFludded)
    {
        if (row > 0)
        {
            [self fluddAtRow:row-1 column:column withColorID:colorID];
        }
        if (row < self.numberOfCells-1)
        {
            [self fluddAtRow:row+1 column:column withColorID:colorID];
        }
        if (column > 0)
        {
            [self fluddAtRow:row column:column-1 withColorID:colorID];
        }
        if (column < self.numberOfCells-1)
        {
            [self fluddAtRow:row column:column+1 withColorID:colorID];
        }
    }
}

- (void)fluddAtRow:(int)row column:(int)column withColorID:(int)colorID
{
    HBFluddCell *currentCell = [self cellAtRow:row column:column];
    if (currentCell.isFludded)
    {
        return;
    }
    if (currentCell.colorID == colorID)
    {
        currentCell.isFludded = YES;
        // Recurse to test neighbors of newly fludded cell
        [self fluddNeighboursAtRow:row column:column withColorID:colorID];
    }
}

- (BOOL)isBoardFludded
{
    for (int row = 0; row < self.numberOfCells; row++)
    {
        for (int column = 0; column < self.numberOfCells; column++)
        {
            if (![self cellAtRow:row column:column].isFludded) {
                return NO;
            }
        }
    }
    return YES;
}

# pragma mark - NSCoder

//- (void)encodeWithCoder:(NSCoder *)aCoder {
//    [aCoder encodeInt:self.numberOfCells forKey:@"numberOfCells"];
//    [aCoder encodeInt:self.cellSize forKey:@"cellSize"];
//    [aCoder encodeObject:self.cells forKey:@"cells"];
//    [aCoder encodeObject:self.colors forKey:@"colors"];
//    [aCoder encodeInt:self.movesAllowed forKey:@"movesAllowed"];
//    [aCoder encodeInt:self.movesRemaining forKey:@"movesRemaining"];
//    [aCoder encodeBool:self.isFirstMove forKey:@"isFirstMove"];
//}

//- (id)initWithCoder:(NSCoder *)aDecoder {
//    
//}

@end
