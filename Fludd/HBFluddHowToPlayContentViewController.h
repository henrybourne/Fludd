//
//  HBFluddHowToPlayContentViewController.h
//  Fludd
//
//  Created by Henry Bourne on 26/07/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HBFluddHowToPlayContentViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@property NSUInteger pageIndex;
@property NSString *text;
@property NSString *imageFile;

@end
