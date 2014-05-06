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
        NSLog(@"[HBFluddGameView initWithFrame:model:]");
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
                // Scale to zero so can animate in later.
                currentCellView.transform = CGAffineTransformMakeScale(0, 0);
                currentCellView.alpha = 0;
                [self addSubview:currentCellView];
                // Add the cell into the row array
                [currentRow setObject:currentCellView atIndexedSubscript:column];
            }
            // Add the row array into the board array
            [self.cellViews setObject:currentRow atIndexedSubscript:row];
        }
        
        // Set up a timer to animate the scale of each cell in turn
        self.timerCurrentCellIndex = 0;
        self.cellAppearsTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(cellAppears:) userInfo:nil repeats:YES];//self.model.numberOfCells*self.model.numberOfCells];
    }
    return self;
}

- (void)cellAppears:(NSTimer *)timer
{
    
    // Appear in turn.
    NSMutableArray *cellsToAnimate = [NSMutableArray array];
    for (int i=0; i<=self.timerCurrentCellIndex; i++)
    {
        NSMutableArray *row = [self.cellViews objectAtIndex:i];
        [cellsToAnimate addObject:[row objectAtIndex:self.timerCurrentCellIndex]];
        if (i == self.timerCurrentCellIndex && i > 0)
        {
            for (int j=0; j<i; j++)
            {
                [cellsToAnimate addObject:[row objectAtIndex:j]];
            }
        }
    }
    
    for (HBFluddCellView *currentCell in cellsToAnimate)
    {
        [UIView animateWithDuration:0.3
                              delay:0
             usingSpringWithDamping:0.8
              initialSpringVelocity:1
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             currentCell.transform = CGAffineTransformMakeScale(1, 1);
                             currentCell.alpha = 1;
                         }
                         completion:^(BOOL finished){
                         }];
    }

    
    // INcrement cell index and invalidate if necessary
    self.timerCurrentCellIndex++;
    if (self.timerCurrentCellIndex >= self.model.numberOfCells)
    {
        [self.cellAppearsTimer invalidate];
    }
}

- (void)setNeedsDisplay
{
    [super setNeedsDisplay];
    for (NSMutableArray *row in self.cellViews)
    {
        for (HBFluddCellView *cellView in row)
        {
            [cellView changeColor];
        }
    }
    [self.movesRemainingView setNeedsDisplay];
}


@end
