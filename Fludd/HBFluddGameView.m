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
        
        // Set bounds to clip background
        self.bounds = CGRectMake(offset, offset, totalSize, totalSize);
        self.clipsToBounds = YES;
        
        // Add wall image if necessary, and set up parallax effect
        if (self.model.gameMode.type == HBFluddGameModeTypeWalls)
        {
            self.wallBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(self.frame.origin.x-10, self.frame.origin.y-10, self.frame.size.width+20, self.frame.size.height+20)];
            self.wallBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"WallFill"]];
            [self addSubview:self.wallBackgroundView];

            // Set vertical effect
            UIInterpolatingMotionEffect *verticalMotionEffect =
            [[UIInterpolatingMotionEffect alloc]
             initWithKeyPath:@"center.y"
             type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
            verticalMotionEffect.minimumRelativeValue = @(-10);
            verticalMotionEffect.maximumRelativeValue = @(10);
            
            // Set horizontal effect
            UIInterpolatingMotionEffect *horizontalMotionEffect =
            [[UIInterpolatingMotionEffect alloc]
             initWithKeyPath:@"center.x"
             type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
            horizontalMotionEffect.minimumRelativeValue = @(-10);
            horizontalMotionEffect.maximumRelativeValue = @(10);
            
            // Create group to combine both
            UIMotionEffectGroup *group = [UIMotionEffectGroup new];
            group.motionEffects = @[horizontalMotionEffect, verticalMotionEffect];
            
            // Add both effects to your view
            [self.wallBackgroundView addMotionEffect:group];
        }
        
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
    }
    
    return self;
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
