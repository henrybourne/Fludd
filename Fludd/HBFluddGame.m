//
//  HBFluddGame.m
//  Fludd
//
//  Created by Henry Bourne on 16/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddGame.h"

@implementation HBFluddGame

- (id)init
{
    self = [self initWithBoardSize:12];
    return self;
}

- (id)initWithBoardSize:(BoardSize)boardSize
{
    self = [super init];
    if (self)
    {
        [self newGameWithBoardSize:boardSize];
    }
    return self;
}

- (void)newGameWithBoardSize:(BoardSize)boardSize
{
    
    switch (boardSize)
    {
        case kBoardSizeSmall:
            self.boardSize      = 12;
            self.movesAllowed   = 22;
            break;
            
        case kBoardSizeMedium:
            self.boardSize      = 17;
            self.movesAllowed   = 30;
            break;
            
        case kBoardSizeLarge:
            self.boardSize      = 22;
            self.movesAllowed   = 36;
            break;
            
        default:
            self.boardSize      = 6;
            self.movesAllowed   = 12;
            break;
    }
    self.movesRemaining = self.movesAllowed;
    self.colors = [[HBFluddColors alloc] init];
    self.board = [[HBFluddBoard alloc] initWithNumberOfCells:self.boardSize colors:self.colors];
    
    // Check if a fludd should happen right away
    NSLog(@"[self.board cellAtRow:0 column:0].colorID = %i", [self.board cellAtRow:0 column:0].colorID);
    [self.board startFluddWithColorID:[self.board cellAtRow:0 column:0].colorID];
}

- (void)restartGameWithSameBoard
{
    // Implement in future
}

- (void)updateFluddWithColorID:(int)colorID
{
    [self.board startFluddWithColorID:colorID];
}

- (BOOL)isGameWon
{
    return [self.board isBoardFludded];
}

- (BOOL)isGameLost
{
    if (self.movesRemaining == 0)
    {
        return YES;
    }
    return NO;
}

@end
