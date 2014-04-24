//
//  HBFluddBoard.m
//  Fludd
//
//  Created by Henry Bourne on 16/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddGameView.h"

@implementation HBFluddGameView

- (id)initWithFrame:(CGRect)frame model:(HBFluddGame *)model
{
    self = [self initWithFrame:frame];
    if (self)
    {
        NSLog(@"[HBFluddBoardView initWithFrame:model:]");
        self.model = model;
        
        // Calculate total board size and create an offset to center it
        int totalSize = self.model.cellSize * self.model.numberOfCells;
        int offset = (self.frame.size.width - totalSize)/2;
        
        // Set up the individual cell views
        self.cellViews = [NSMutableArray arrayWithCapacity:self.model.numberOfCells];
        for (int row = 0; row < self.model.numberOfCells; row++)
        {
            // Set up the row array
            NSMutableArray *currentRow = [NSMutableArray arrayWithCapacity:self.model.numberOfCells];
            for (int column = 0; column < self.model.numberOfCells; column++)
            {
                HBFluddCell *currentCell = [self.model cellAtRow:row column:column];
                HBFluddCellView *currentCellView = [[HBFluddCellView alloc] initWithFrame:CGRectMake((self.model.cellSize*column)+offset, (self.model.cellSize*row)+offset, self.model.cellSize, self.model.cellSize)
                                                                                    model:currentCell];
                [self addSubview:currentCellView];
                // Add the cell into the row array
                [currentRow setObject:currentCellView atIndexedSubscript:column];
            }
            // Add the row array into the board array
            [self.cellViews setObject:currentRow atIndexedSubscript:row];
        }
     
        // Set up 'moves remaining' view
        self.movesRemainingView = [[HBFluddMovesRemainingView alloc] initWithFrame:CGRectMake(0, 380, 300, 40) model:self.model];
        [self addSubview:self.movesRemainingView];
        
    }
    return self;
}

- (void)setNeedsDisplay
{
    [super setNeedsDisplay];
    for (NSMutableArray *row in self.cellViews) {
        for (HBFluddCellView *cell in row) {
            [cell setNeedsDisplay];
        }
    }
    
    [self.movesRemainingView setNeedsDisplay];
}

//- (HBFluddCellView *)cellViewAtRow:(int)row column:(int)column
//{
//    return nil;
//}

//- (void)drawRect:(CGRect)rect
//{
//    
////    for (int row = 0; row < self.model.numberOfCells; row++)
////    {
////        for (int column = 0; column < self.model.numberOfCells; column++)
////        {
////            
////        }
////    }
//}

//- (HBFluddCellView *)squareAtRow:(int)row andColumn:(int)column
//{
//    return [[cells objectAtIndex:row] objectAtIndex:column];
//}

@end
