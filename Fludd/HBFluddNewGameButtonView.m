//
//  HBFluddNewGameButtonView.m
//  Fludd
//
//  Created by Henry Bourne on 04/05/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddNewGameButtonView.h"

@implementation HBFluddNewGameButtonView

- (id)initWithFrame:(CGRect)frame mainLabel:(NSString *)mainLabel subLabel:(NSString *)subLabel showBottomBorder:(BOOL)showBottomBorder
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        
        self.showBottomBorder = showBottomBorder;
        
        // Main title
        self.mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, self.frame.origin.y, self.frame.size.width-30, self.frame.size.height)];
        self.mainLabel.center = CGPointMake(self.mainLabel.center.x, self.frame.size.height/2.0);
        self.mainLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
        self.mainLabel.textColor = [UIColor whiteColor];
        self.mainLabel.text = mainLabel;
        [self addSubview:self.mainLabel];
        
        // Sub title
        self.subLabel = [[UILabel alloc] initWithFrame:CGRectMake(220, self.frame.origin.y, self.frame.size.width-30, self.frame.size.height)];
        self.subLabel.center = CGPointMake(self.subLabel.center.x, self.frame.size.height/2.0);
        self.subLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:15];
        self.subLabel.textColor = [UIColor colorWithRed:0.600 green:0.600 blue:0.600 alpha:1];
        self.subLabel.text = subLabel;
        [self addSubview:self.subLabel];
        
        // Chevron
        self.chevron = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Chevron.png"]];
        self.chevron.center = CGPointMake(self.frame.size.width-20, self.frame.size.height/2.0);
        [self addSubview:self.chevron];

    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UIColor *lineColor = [UIColor colorWithRed:0.353 green:0.353 blue:0.353 alpha:1];
    
    //// Upper Line
    UIBezierPath* upperLine = [UIBezierPath bezierPathWithRect: CGRectMake(30, 0, rect.size.width-30, 0.5)];
    [lineColor setFill];
    [upperLine fill];
    if (self.showBottomBorder)
    {
        //// Lower Line
        UIBezierPath* lowerLine = [UIBezierPath bezierPathWithRect: CGRectMake(30, self.frame.size.height-0.5, rect.size.width-30, 0.5)];
        [lineColor setFill];
        [lowerLine fill];
    }
    
}


@end
