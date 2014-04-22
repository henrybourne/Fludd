//
//  HBFluddBoard.m
//  Fludd
//
//  Created by Henry Bourne on 16/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddBoardView.h"

@implementation HBFluddBoardView

- (id)initWithFrame:(CGRect)frame numberOfSquares:(int)numberOfSquares colors:(HBFluddColors *)currentColors
{
    self = [self initWithFrame:frame];
    if (self)
    {
        NSLog(@"[HBFluddBoard initWithNumberOfSquares]");
        
        self.boardColors = currentColors;
        board = [NSMutableArray arrayWithCapacity:numberOfSquares];
        int randomColorIndex;
        int squareSize = kHBFluddBoardSize/numberOfSquares;
        
        for (int i = 0; i < numberOfSquares; i++)
        {
            // Set up the row array
            NSMutableArray *currentRow = [NSMutableArray arrayWithCapacity:numberOfSquares];
            for (int j = 0; j < numberOfSquares; j++) {
                randomColorIndex = arc4random_uniform(6);
                HBFluddSquare *currentSquare = [[HBFluddSquare alloc] initWithSize:squareSize colorID:randomColorIndex color:[self.boardColors colorAtIndex:randomColorIndex]];
                
                // Set up first fludded square
                if (i == 0 && j == 0)
                {
                    currentSquare.isFludded = YES;
                }

                // Position and add square to board
                [currentSquare setFrame:CGRectMake(squareSize*j, squareSize*i, squareSize, squareSize)];
                [self addSubview:currentSquare];
                
                // Add the square into the row array
                [currentRow setObject:currentSquare atIndexedSubscript:j];
            }
            
            // Add the row array into the board array
            [board setObject:currentRow atIndexedSubscript:i];
        }
        
        
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        NSLog(@"[HBFluddBoard initWithFrame]");
    }
    return self;
}

//- (void)drawRect:(CGRect)rect
//{
//  
//}

- (HBFluddSquare *)squareAtRow:(int)row andColumn:(int)column
{
    return [[board objectAtIndex:row] objectAtIndex:column];
}

@end
