//
//  HBViewController.m
//  Fludd
//
//  Created by Henry Bourne on 16/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddViewController.h"

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
    
    // Add New Game Button
    UIImage *plusImage = [UIImage imageNamed:@"plus.png"];
    UIButton *plus = [UIButton buttonWithType:UIButtonTypeCustom];
    plus.bounds = CGRectMake( 10, 0, plusImage.size.width/2, plusImage.size.height/2);
    //[plus addTarget:self action:@selector(handleBack:) forControlEvents:UIControlEventTouchUpInside];
    [plus setImage:plusImage forState:UIControlStateNormal];
    UIBarButtonItem *newButton = [[UIBarButtonItem alloc] initWithCustomView:plus];
    self.navigationItem.leftBarButtonItem = newButton;
    //[self.navigationItem setHidesBackButton:YES animated:YES];
    //[self.navigationItem setLeftBarButtonItem:nil animated:NO];
    //[self.navigationItem setBackBarButtonItem:nil];
    
    // Add Settings Button
    UIImage *settingsImage = [UIImage imageNamed:@"settings.png"];
    UIButton *settings = [UIButton buttonWithType:UIButtonTypeCustom];
    settings.bounds = CGRectMake( 0, 10, settingsImage.size.width/2, settingsImage.size.height/2);
    //[plus addTarget:self action:@selector(handleBack:) forControlEvents:UIControlEventTouchUpInside];
    [settings setImage:settingsImage forState:UIControlStateNormal];
    UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc] initWithCustomView:settings];
    self.navigationItem.rightBarButtonItem = settingsButton;

    // Create the game model
    self.model = [[HBFluddGame alloc] initWithBoardSize:kBoardSizeMedium];
    // Create the game view
    CGRect boardFrame = CGRectMake(10, 10, 300, 300);
    self.gameView = [[HBFluddGameView alloc] initWithFrame:boardFrame model:self.model];
    [self.view addSubview:self.gameView];
    
    // Create the color button models
    HBFluddColorButton *colorButton0 = [[HBFluddColorButton alloc] initWithColorID:0 color:[self.model.colors colorAtIndex:0]];
    HBFluddColorButton *colorButton1 = [[HBFluddColorButton alloc] initWithColorID:1 color:[self.model.colors colorAtIndex:1]];
    HBFluddColorButton *colorButton2 = [[HBFluddColorButton alloc] initWithColorID:2 color:[self.model.colors colorAtIndex:2]];
    HBFluddColorButton *colorButton3 = [[HBFluddColorButton alloc] initWithColorID:3 color:[self.model.colors colorAtIndex:3]];
    HBFluddColorButton *colorButton4 = [[HBFluddColorButton alloc] initWithColorID:4 color:[self.model.colors colorAtIndex:4]];
    HBFluddColorButton *colorButton5 = [[HBFluddColorButton alloc] initWithColorID:5 color:[self.model.colors colorAtIndex:5]];
    
    // Color button views
    CGRect colorButtonFrame0 = CGRectMake(10, 340, 42, 42);
    CGRect colorButtonFrame1 = CGRectMake(62, 340, 42, 42);
    CGRect colorButtonFrame2 = CGRectMake(113, 340, 42, 42);
    CGRect colorButtonFrame3 = CGRectMake(165, 340, 42, 42);
    CGRect colorButtonFrame4 = CGRectMake(217, 340, 42, 42);
    CGRect colorButtonFrame5 = CGRectMake(268, 340, 42, 42);
    HBFluddColorButtonView *colorButtonView0 = [[HBFluddColorButtonView alloc] initWithFrame:colorButtonFrame0 model:colorButton0];
    HBFluddColorButtonView *colorButtonView1 = [[HBFluddColorButtonView alloc] initWithFrame:colorButtonFrame1 model:colorButton1];
    HBFluddColorButtonView *colorButtonView2 = [[HBFluddColorButtonView alloc] initWithFrame:colorButtonFrame2 model:colorButton2];
    HBFluddColorButtonView *colorButtonView3 = [[HBFluddColorButtonView alloc] initWithFrame:colorButtonFrame3 model:colorButton3];
    HBFluddColorButtonView *colorButtonView4 = [[HBFluddColorButtonView alloc] initWithFrame:colorButtonFrame4 model:colorButton4];
    HBFluddColorButtonView *colorButtonView5 = [[HBFluddColorButtonView alloc] initWithFrame:colorButtonFrame5 model:colorButton5];
    [colorButtonView0 addTarget:self action:@selector(colorButtonTappedWithSender:) forControlEvents:UIControlEventTouchUpInside];
    [colorButtonView1 addTarget:self action:@selector(colorButtonTappedWithSender:) forControlEvents:UIControlEventTouchUpInside];
    [colorButtonView2 addTarget:self action:@selector(colorButtonTappedWithSender:) forControlEvents:UIControlEventTouchUpInside];
    [colorButtonView3 addTarget:self action:@selector(colorButtonTappedWithSender:) forControlEvents:UIControlEventTouchUpInside];
    [colorButtonView4 addTarget:self action:@selector(colorButtonTappedWithSender:) forControlEvents:UIControlEventTouchUpInside];
    [colorButtonView5 addTarget:self action:@selector(colorButtonTappedWithSender:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:colorButtonView0];
    [self.view addSubview:colorButtonView1];
    [self.view addSubview:colorButtonView2];
    [self.view addSubview:colorButtonView3];
    [self.view addSubview:colorButtonView4];
    [self.view addSubview:colorButtonView5];
    

    
}

- (void)colorButtonTappedWithSender:(HBFluddColorButtonView *)sender
{
    NSLog(@"ColorButtonTappedWithSender: ColorID = %i", sender.model.colorID);
    [self.model startFluddWithColorID:sender.model.colorID];
    [self.view setNeedsDisplay];
    [self.gameView setNeedsDisplay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
