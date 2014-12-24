//
//  HBFluddSquare.m
//  Fludd
//
//  Created by Henry Bourne on 16/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddCellView.h"

@implementation HBFluddCellView

- (id)initWithFrame:(CGRect)frame model:(HBFluddCell *)model
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.model = model;
        if (self.model.isWall)
        {
            // tile background
            self.backgroundColor = [UIColor clearColor];
        }
        else
        {
            self.backgroundColor = self.model.color;
        }
    }
    return self;
}

- (void)changeColor
{
    [UIView animateWithDuration:0.2
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         
                         if (self.model.isWall)
                         {
                             self.backgroundColor = [UIColor clearColor];
                         }
                         else
                         {
                             self.backgroundColor = self.model.color;
                         }
                     }
                     completion:nil];
}

- (void)cellAppears:(NSTimer *)timer
{
    NSLog(@"[HBFluddCellView cellAppears]");
    
    //double randomDelay = arc4random_uniform(100)/50.0;
    //NSLog(@"[HBFluddCellView cellAppears] randomDelay %f", randomDelay);
    
    [UIView animateWithDuration:0.2
                          delay:0
         usingSpringWithDamping:0.6
          initialSpringVelocity:1
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.transform = CGAffineTransformMakeScale(1, 1);
                         self.alpha = 1;
                     }
                     completion:^(BOOL finished){
                     }];
}

//- (void)drawRect:(CGRect)rect
//{
//    if (self.model.isWall)
//    {
//        // Figure out how many wall squares to draw
//        int numberOfWallSquares = 6;
//        if (self.frame.size.width <= 20) {
//            numberOfWallSquares = 2;
//        }
//        else if (self.frame.size.width <= 40) {
//            numberOfWallSquares = 4;
//        }
//        else if (self.frame.size.width <= 50) {
//            numberOfWallSquares = 5;
//        }
//        
//        // Draw the grid of wall squares
//        int wallSquareSize = self.frame.size.width/numberOfWallSquares;
//        for (int row = 0; row < numberOfWallSquares; row++) {
//            for (int column = 0; column < numberOfWallSquares; column++) {
//                UIBezierPath* wallSquare = [UIBezierPath bezierPathWithRect: CGRectMake(wallSquareSize*column, wallSquareSize*row, wallSquareSize, wallSquareSize)];
//                UIColor *wallSquareColor = [UIColor colorWithRed:0.161 green:0.161 blue:0.161 alpha:1];
//                if ((row+column)%2 == 0) {
//                    wallSquareColor = [UIColor colorWithRed:0.243 green:0.243 blue:0.243 alpha:1];
//                }
//                [wallSquareColor setFill];
//                [wallSquare fill];
//            }
//        }
//    }
//}

@end
