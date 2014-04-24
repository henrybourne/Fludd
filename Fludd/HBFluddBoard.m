//
//  HBFluddBoard.m
//  Fludd
//
//  Created by Henry Bourne on 22/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddBoard.h"

@implementation HBFluddBoard

- (id)initWithNumberOfCells:(int)numberOfCells colors:(HBFluddColors *)currentColors
{
    self = [super init];
    if (self)
    {
        NSLog(@"[HBFluddBoard initWithNumberOfCells]");
        
        self.colors = currentColors;
        self.numberOfCells = numberOfCells;
        self.cells = [NSMutableArray arrayWithCapacity:self.numberOfCells];
        self.cellSize = kHBFluddBoardSize/self.numberOfCells;
        
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
    }
    return self;
}

- (HBFluddCell *)cellAtRow:(int)row column:(int)column
{
    return [[self.cells objectAtIndex:row] objectAtIndex:column];
}

- (void)startFluddWithColorID:(int)colorID
{
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
    
    // Check to see if the game is won
    

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
            if ([self cellAtRow:row column:column].isFludded) {
                return NO;
            }
        }
    }
    return YES;
}

@end