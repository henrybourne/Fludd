//
//  HBViewController.m
//  Fludd
//
//  Created by Henry Bourne on 16/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddViewController.h"
#import "HBFluddSquare.h"
#import "HBFluddBoardView.h"
#import "HBFluddColorButton.h"

@interface HBFluddViewController ()

@end

@implementation HBFluddViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.251 green:0.251 blue:0.251 alpha:1];
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIFont fontWithName:@"HelveticaNeue-Thin" size:35],NSFontAttributeName,
      [UIColor whiteColor],NSForegroundColorAttributeName,
      nil]];
    self.navigationItem.title = @"Fludd";
    //self.navigationItem.leftBarButtonItem.image = [UIImage imageWithContentsOfFile:@"plus.png"];
    
    // Create the game colors
    HBFluddColors *colors = [[HBFluddColors alloc] init];
    
    // Create the board
    CGRect boardFrame = CGRectMake(10, 10, 300, 300);
    HBFluddBoardView *board = [[HBFluddBoardView alloc] initWithFrame:boardFrame numberOfSquares:12 colors:colors];
    [self.view addSubview:board];
    
    // Create the color buttons
    CGRect colorButtonFrame0 = CGRectMake(10, 340, 42, 42);
    CGRect colorButtonFrame1 = CGRectMake(62, 340, 42, 42);
    CGRect colorButtonFrame2 = CGRectMake(113, 340, 42, 42);
    CGRect colorButtonFrame3 = CGRectMake(165, 340, 42, 42);
    CGRect colorButtonFrame4 = CGRectMake(217, 340, 42, 42);
    CGRect colorButtonFrame5 = CGRectMake(268, 340, 42, 42);
    
    HBFluddColorButton *colorButton0 = [[HBFluddColorButton alloc] initWithFrame:colorButtonFrame0 colorID:0 color:[colors colorAtIndex:0]];
    HBFluddColorButton *colorButton1 = [[HBFluddColorButton alloc] initWithFrame:colorButtonFrame1 colorID:1 color:[colors colorAtIndex:1]];
    HBFluddColorButton *colorButton2 = [[HBFluddColorButton alloc] initWithFrame:colorButtonFrame2 colorID:2 color:[colors colorAtIndex:2]];
    HBFluddColorButton *colorButton3 = [[HBFluddColorButton alloc] initWithFrame:colorButtonFrame3 colorID:3 color:[colors colorAtIndex:3]];
    HBFluddColorButton *colorButton4 = [[HBFluddColorButton alloc] initWithFrame:colorButtonFrame4 colorID:4 color:[colors colorAtIndex:4]];
    HBFluddColorButton *colorButton5 = [[HBFluddColorButton alloc] initWithFrame:colorButtonFrame5 colorID:5 color:[colors colorAtIndex:5]];
    
    [self.view addSubview:colorButton0];
    [self.view addSubview:colorButton1];
    [self.view addSubview:colorButton2];
    [self.view addSubview:colorButton3];
    [self.view addSubview:colorButton4];
    [self.view addSubview:colorButton5];
    
    // Set up 'moves remaining' view
    //UILabel *movesRemainingLabel = [UILabel alloc] initWithFrame:<#(CGRect)#>
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
