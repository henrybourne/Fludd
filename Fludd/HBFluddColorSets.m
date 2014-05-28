//
//  HBFluddColors.m
//  Fludd
//
//  Created by Henry Bourne on 16/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddColorSets.h"

@implementation HBFluddColorSets

- (id)init
{
    self = [super init];
    if (self)
    {
        self.colors = [NSMutableArray array];
        [self.colors addObject:[[HBFluddColorSet alloc] initWithTitle:@"Basic"
                                                      colorSetID:(int)[self.colors count]
                                                          color0:[UIColor colorWithRed:0.741 green:0.314 blue:0.314 alpha:1]
                                                          color1:[UIColor colorWithRed:0.800 green:0.690 blue:0.263 alpha:1]
                                                          color2:[UIColor colorWithRed:0.325 green:0.741 blue:0.365 alpha:1]
                                                          color3:[UIColor colorWithRed:0.388 green:0.675 blue:0.733 alpha:1]
                                                          color4:[UIColor colorWithRed:0.306 green:0.478 blue:0.627 alpha:1]
                                                          color5:[UIColor colorWithRed:0.627 green:0.388 blue:0.722 alpha:1]]];
//        [colors addObject:[[HBFluddColorSet alloc] initWithTitle:@"Bright"
//                                                      colorSetID:(int)[colors count]
//                                                          color0:[UIColor colorWithRed:0.906 green:0.243 blue:0.243 alpha:1]
//                                                          color1:[UIColor colorWithRed:0.898 green:0.937 blue:0.180 alpha:1]
//                                                          color2:[UIColor colorWithRed:0.216 green:0.878 blue:0.169 alpha:1]
//                                                          color3:[UIColor colorWithRed:0.212 green:0.678 blue:0.996 alpha:1]
//                                                          color4:[UIColor colorWithRed:0.369 green:0.196 blue:0.871 alpha:1]
//                                                          color5:[UIColor colorWithRed:0.749 green:0.122 blue:1.000 alpha:1]]];
        [self.colors addObject:[[HBFluddColorSet alloc] initWithTitle:@"Basic Pastel"
                                                      colorSetID:(int)[self.colors count]
                                                          color0:[UIColor colorWithRed:0.682 green:0.522 blue:0.522 alpha:1]
                                                          color1:[UIColor colorWithRed:0.796 green:0.745 blue:0.553 alpha:1]
                                                          color2:[UIColor colorWithRed:0.529 green:0.710 blue:0.486 alpha:1]
                                                          color3:[UIColor colorWithRed:0.431 green:0.624 blue:0.663 alpha:1]
                                                          color4:[UIColor colorWithRed:0.514 green:0.541 blue:0.706 alpha:1]
                                                          color5:[UIColor colorWithRed:0.639 green:0.471 blue:0.706 alpha:1]]];
        [self.colors addObject:[[HBFluddColorSet alloc] initWithTitle:@"Fall"
                                                      colorSetID:(int)[self.colors count]
                                                          color0:[UIColor colorWithRed:0.278 green:0.604 blue:0.745 alpha:1]
                                                          color1:[UIColor colorWithRed:0.941 green:0.878 blue:0.749 alpha:1]
                                                          color2:[UIColor colorWithRed:0.639 green:0.482 blue:0.349 alpha:1]
                                                          color3:[UIColor colorWithRed:0.843 green:0.510 blue:0.404 alpha:1]
                                                          color4:[UIColor colorWithRed:0.647 green:0.200 blue:0.157 alpha:1]
                                                          color5:[UIColor colorWithRed:0.388 green:0.518 blue:0.231 alpha:1]]];
        [self.colors addObject:[[HBFluddColorSet alloc] initWithTitle:@"Merci"
                                                      colorSetID:(int)[self.colors count]
                                                          color0:[UIColor colorWithRed:0.012 green:0.173 blue:0.357 alpha:1]
                                                          color1:[UIColor colorWithRed:0.075 green:0.494 blue:0.757 alpha:1]
                                                          color2:[UIColor colorWithRed:0.651 green:0.843 blue:0.953 alpha:1]
                                                          color3:[UIColor colorWithRed:1.000 green:1.000 blue:1.000 alpha:1]
                                                          color4:[UIColor colorWithRed:0.753 green:0.549 blue:0.592 alpha:1]
                                                          color5:[UIColor colorWithRed:0.694 green:0.067 blue:0.200 alpha:1]]];
        [self.colors addObject:[[HBFluddColorSet alloc] initWithTitle:@"Vibrant"
                                                      colorSetID:(int)[self.colors count]
                                                          color0:[UIColor colorWithRed:0.906 green:0.906 blue:0.914 alpha:1]
                                                          color1:[UIColor colorWithRed:0.937 green:0.251 blue:0.361 alpha:1]
                                                          color2:[UIColor colorWithRed:0.992 green:0.749 blue:0.263 alpha:1]
                                                          color3:[UIColor colorWithRed:0.110 green:0.710 blue:0.569 alpha:1]
                                                          color4:[UIColor colorWithRed:0.424 green:0.376 blue:0.722 alpha:1]
                                                          color5:[UIColor colorWithRed:0.831 green:0.392 blue:0.894 alpha:1]]];
        [self.colors addObject:[[HBFluddColorSet alloc] initWithTitle:@"Greyscale"
                                                      colorSetID:(int)[self.colors count]
                                                          color0:[UIColor colorWithRed:0.000 green:0.000 blue:0.000 alpha:1]
                                                          color1:[UIColor colorWithRed:0.141 green:0.141 blue:0.141 alpha:1]
                                                          color2:[UIColor colorWithRed:0.275 green:0.271 blue:0.271 alpha:1]
                                                          color3:[UIColor colorWithRed:0.482 green:0.478 blue:0.478 alpha:1]
                                                          color4:[UIColor colorWithRed:0.765 green:0.753 blue:0.753 alpha:1]
                                                          color5:[UIColor colorWithRed:1.000 green:1.000 blue:1.000 alpha:1]]];
        self.selectedColorSetID = 0;
    }
    return self;
}

- (HBFluddColorSet *)currentFluddColors
{
    return [self.colors objectAtIndex:self.selectedColorSetID];
}

- (UIColor *)colorAtIndex:(int)colorIndex
{
    HBFluddColorSet *colorSet = [self.colors objectAtIndex:self.selectedColorSetID];
    switch (colorIndex) {
        case 0:
            return colorSet.color0;
            break;
        case 1:
            return colorSet.color1;
            break;
        case 2:
            return colorSet.color2;
            break;
        case 3:
            return colorSet.color3;
            break;
        case 4:
            return colorSet.color4;
            break;
        case 5:
            return colorSet.color5;
            break;
            
        default:
            NSLog(@"INVALID COLOR INDEX");
            return [UIColor blackColor];
            break;
    }
}

- (HBFluddColorSet *)colorSetAtIndex:(int)colorSetIndex
{
    return [self.colors objectAtIndex:colorSetIndex];
}

- (HBFluddColorSet *)selectedColorSet
{
    return [self.colors objectAtIndex:self.selectedColorSetID];
}

- (void)setColorSet:(int)colorSet
{
    if (colorSet < [self.colors count])
    {
        self.selectedColorSetID = colorSet;
    }
    else
    {
        self.selectedColorSetID = (int)[self.colors count]-1;
    }
}

- (int)numberOfColorSets
{
    return (int)[self.colors count];
}

# pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInt:self.selectedColorSetID forKey:@"selectedColorSetID"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [self init];
    if (self) {
        self.selectedColorSetID = [aDecoder decodeIntForKey:@"selectedColorSetID"];
    }
    return self;
}

@end
