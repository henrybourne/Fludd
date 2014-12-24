//
//  HBFluddHowToPlayViewController.h
//  Fludd
//
//  Created by Henry Bourne on 26/07/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBFluddHowToPlayContentViewController.h"

@interface HBFluddHowToPlayViewController : UIViewController <UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageImages;
@property (strong, nonatomic) NSArray *pageText;

@end
