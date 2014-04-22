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
    self = [super init];
    if (self)
    {
        self.boardSize = 12;
        //self.board = [[HBFluddBoard alloc] initWithBoardSize:self.boardSize];

    }
    return self;
}



@end
