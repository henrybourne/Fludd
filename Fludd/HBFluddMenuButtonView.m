//
//  HBFluddMenuButtonView.m
//  Fludd
//
//  Created by Henry Bourne on 06/05/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddMenuButtonView.h"

@implementation HBFluddMenuButtonView

- (id)initWithFrame:(CGRect)frame mainLabel:(NSString *)mainLabel
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        
        // Main title
        self.mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, self.frame.origin.y, self.frame.size.width-30, self.frame.size.height)];
        self.mainLabel.center = CGPointMake(self.mainLabel.center.x, self.frame.size.height/2.0);
        self.mainLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
        self.mainLabel.textColor = [UIColor whiteColor];
        self.mainLabel.text = mainLabel;
        [self addSubview:self.mainLabel];
        
        //self.showTopBorder = YES;
        //self.showBottomBorder = NO;
        //[self shouldShowChevron:YES];
    }
    return self;
}

- (void)shouldShowTopBorder:(BOOL)showTopBorder
{
    self.showTopBorder = showTopBorder;
    [self setNeedsDisplay];
}

- (void)shouldShowBottomBorder:(BOOL)showBottomBorder
{
    self.showBottomBorder = showBottomBorder;
    [self setNeedsDisplay];
}

- (void)showAccessory:(HBFluddMenuButtonAccessoryType)accessoryType
{
    if (accessoryType == HBFluddMenuButtonAccessoryTypeNone)
    {
        // Chevron
        if (self.accessory) {
            [self.accessory removeFromSuperview];
            self.accessory = nil;
        }
    }
    
    if (accessoryType == HBFluddMenuButtonAccessoryTypeChevron)
    {
        // Chevron
        self.accessory = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Chevron.png"]];
        self.accessory.center = CGPointMake(self.frame.size.width-20, self.frame.size.height/2.0);
        [self addSubview:self.accessory];
    }
    
    if (accessoryType == HBFluddMenuButtonAccessoryTypeCheck)
    {
        // Check
        self.accessory = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Check.png"]];
        self.accessory.center = CGPointMake(self.frame.size.width-20, self.frame.size.height/2.0);
        [self addSubview:self.accessory];
    }
}

- (void)showBorder:(HBFluddMenuButtonBorderType)borderType
{
    if (borderType == HBFluddMenuButtonBorderTypeTop || borderType == HBFluddMenuButtonBorderTypeBoth)
    {
        self.showTopBorder = YES;
    }
    if (borderType == HBFluddMenuButtonBorderTypeBottom || borderType == HBFluddMenuButtonBorderTypeBoth)
    {
        self.showBottomBorder = YES;
    }
    [self setNeedsDisplay];
}

- (void)showSublabel:(NSString *)sublabel
{
    if (self.subLabel)
    {
        [self.subLabel removeFromSuperview];
        self.subLabel = nil;
    }
    
    // Sub title
    self.subLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, self.frame.origin.y, self.frame.size.width-200, self.frame.size.height)];
    self.subLabel.center = CGPointMake(self.subLabel.center.x, self.frame.size.height/2.0);
    self.subLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    self.subLabel.textColor = [UIColor colorWithRed:0.600 green:0.600 blue:0.600 alpha:1];
    self.subLabel.textAlignment = NSTextAlignmentRight;
    //self.subLabel.backgroundColor= [UIColor grayColor];
    self.subLabel.text = sublabel;
    [self addSubview:self.subLabel];
}

- (void)showColorSet:(HBFluddColorSet *)colorSet
{
    // color preview
    self.colorPreviewView = [[HBFluddColorsPreviewView alloc] initWithFrame:CGRectMake(180, 15, 90, 15) colorSet:colorSet];
    [self addSubview:self.colorPreviewView];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    // Drawing code
    UIColor *lineColor = [UIColor colorWithRed:0.353 green:0.353 blue:0.353 alpha:1];
    
    if (self.showTopBorder)
    {
        //// Upper Line
        UIBezierPath* upperLine = [UIBezierPath bezierPathWithRect: CGRectMake(30, 0, rect.size.width-30, 0.5)];
        [lineColor setFill];
        [upperLine fill];
    }
    
    if (self.showBottomBorder)
    {
        //// Lower Line
        UIBezierPath* lowerLine = [UIBezierPath bezierPathWithRect: CGRectMake(30, self.frame.size.height-0.5, rect.size.width-30, 0.5)];
        [lineColor setFill];
        [lowerLine fill];
    }
    
}

@end
