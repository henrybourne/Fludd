//
//  HBViewController.m
//  Fludd
//
//  Created by Henry Bourne on 16/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddGameViewController.h"

@interface HBFluddGameViewController ()

@end

@implementation HBFluddGameViewController

- (id)initWithBoardSize:(BoardSize)boardSize
{
    self = [super init];
    if (self)
    {
        self.boardSize = boardSize;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    // Add New Game Button
//    UIImage *plusImage = [UIImage imageNamed:@"plus.png"];
//    UIButton *plus = [UIButton buttonWithType:UIButtonTypeCustom];
//    plus.bounds = CGRectMake( 10, 0, plusImage.size.width/2, plusImage.size.height/2);
//    [plus addTarget:self action:@selector(newButtonTapped) forControlEvents:UIControlEventTouchUpInside];
//    [plus setImage:plusImage forState:UIControlStateNormal];
//    UIBarButtonItem *newButton = [[UIBarButtonItem alloc] initWithCustomView:plus];
//    self.navigationItem.leftBarButtonItem = newButton;
    
//    // Add Settings Button
//    UIImage *settingsImage = [UIImage imageNamed:@"settings.png"];
//    UIButton *settings = [UIButton buttonWithType:UIButtonTypeCustom];
//    settings.bounds = CGRectMake( 0, 10, settingsImage.size.width/2, settingsImage.size.height/2);
//    //[plus addTarget:self action:@selector(handleBack:) forControlEvents:UIControlEventTouchUpInside];
//    [settings setImage:settingsImage forState:UIControlStateNormal];
//    UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc] initWithCustomView:settings];
//    self.navigationItem.rightBarButtonItem = settingsButton;

    
    self.view.backgroundColor = [UIColor colorWithRed:0.204 green:0.204 blue:0.204 alpha:1];
    
//    [self.navigationController.navigationBar setTitleTextAttributes:
//     [NSDictionary dictionaryWithObjectsAndKeys:
//      [UIFont fontWithName:@"HelveticaNeue-Thin" size:35],NSFontAttributeName,
//      [UIColor whiteColor],NSForegroundColorAttributeName,
//      nil]];
//    self.navigationItem.title = @"Fludd";
//    [self.navigationController.navigationBar setTitleVerticalPositionAdjustment:5 forBarMetrics:UIBarMetricsDefault];
    

    
    // Create the game model
    NSLog(@"HBFluddGameViewController self.boardSize = %i", self.boardSize);
    self.model = [[HBFluddGame alloc] initWithBoardSize:self.boardSize];
    // Create the game view
    self.boardFrame = CGRectMake(10, 10, 300, 300);
    self.gameView = [[HBFluddGameView alloc] initWithFrame:self.boardFrame model:self.model];
    [self.view addSubview:self.gameView];
    self.isGameActive = YES;
    
    // Create the color button models
    HBFluddColorButton *colorButton0 = [[HBFluddColorButton alloc] initWithColorID:0 color:[self.model.colors colorAtIndex:0]];
    HBFluddColorButton *colorButton1 = [[HBFluddColorButton alloc] initWithColorID:1 color:[self.model.colors colorAtIndex:1]];
    HBFluddColorButton *colorButton2 = [[HBFluddColorButton alloc] initWithColorID:2 color:[self.model.colors colorAtIndex:2]];
    HBFluddColorButton *colorButton3 = [[HBFluddColorButton alloc] initWithColorID:3 color:[self.model.colors colorAtIndex:3]];
    HBFluddColorButton *colorButton4 = [[HBFluddColorButton alloc] initWithColorID:4 color:[self.model.colors colorAtIndex:4]];
    HBFluddColorButton *colorButton5 = [[HBFluddColorButton alloc] initWithColorID:5 color:[self.model.colors colorAtIndex:5]];
    
    // View Y positions for screen sizes
    int colorButtonY = 0;
    if ([UIScreen mainScreen].bounds.size.height == 568)
    {
        // iPhone retina-4 inch
        colorButtonY = 340;
    }
    else
    {
        // iPhone retina-3.5 inch
        colorButtonY = 320;
    }
    
    // Color button views
    
    CGRect colorButtonFrame0 = CGRectMake(10, colorButtonY, 42, 42);
    CGRect colorButtonFrame1 = CGRectMake(62, colorButtonY, 42, 42);
    CGRect colorButtonFrame2 = CGRectMake(113, colorButtonY, 42, 42);
    CGRect colorButtonFrame3 = CGRectMake(165, colorButtonY, 42, 42);
    CGRect colorButtonFrame4 = CGRectMake(217, colorButtonY, 42, 42);
    CGRect colorButtonFrame5 = CGRectMake(268, colorButtonY, 42, 42);
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
    
    // Set up 'moves remaining' view
    if ([UIScreen mainScreen].bounds.size.height == 568)
    {
        // iPhone retina-4 inch
        self.movesRemainingView = [[HBFluddMovesRemainingView alloc] initWithFrame:CGRectMake(10, 400, 300, 40) model:self.model compactView:NO];
    }
    else
    {
        // iPhone retina-3.5 inch
        self.movesRemainingView = [[HBFluddMovesRemainingView alloc] initWithFrame:CGRectMake(10, 360, 300, 40) model:self.model compactView:YES];
    }
    [self.view addSubview:self.movesRemainingView];
    
}


- (void)colorButtonTappedWithSender:(HBFluddColorButtonView *)sender
{
    NSLog(@"ColorButtonTappedWithSender: ColorID = %i", sender.model.colorID);
    if (self.isGameActive)
    {
        [self.model startFluddWithColorID:sender.model.colorID];
        if ([self.model isGameLost])
        {
            NSLog(@"GAME LOST");
            self.isGameActive = NO;
            [self gameLost];

        }
        if ([self.model isGameWon])
        {
            NSLog(@"GAME WON");
            self.isGameActive = NO;
            [self gameWon];
        }
        [self.view setNeedsDisplay];
        [self.gameView setNeedsDisplay];
        [self.movesRemainingView setNeedsDisplay];
    }
    

}

- (void)newButtonTapped
{
    self.isGameActive = YES;
    self.oldGameView = self.gameView;
    [self.model newGameWithBoardSize:self.boardSize];
    self.gameView = [[HBFluddGameView alloc] initWithFrame:self.boardFrame model:self.model];
    [self.view insertSubview:self.gameView belowSubview:self.oldGameView];
    [self clearOldGameView];
    [self.movesRemainingView setNeedsDisplay];
}

- (void)gameWon
{
    self.gameWonView = [HBFluddGameWonView gameWonView];
    int x = self.gameView.frame.origin.x + ((self.gameView.frame.size.width/2)-(self.gameWonView.frame.size.width/2));
    int y = self.gameView.frame.origin.y + ((self.gameView.frame.size.height/2)-(self.gameWonView.frame.size.height/2));
    self.gameWonView.frame = CGRectMake(x, y, self.gameWonView.frame.size.width, self.gameWonView.frame.size.height);
    [self.gameWonView.playAgainButton addTarget:self action:@selector(newButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    self.gameWonView.alpha = 0;
    self.gameWonView.transform = CGAffineTransformMakeScale(0.5, 0.5);
    [self.view addSubview:self.gameWonView];
    [UIView animateWithDuration:0.3
                          delay:0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0.5
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.gameWonView.transform = CGAffineTransformMakeScale(1, 1);
                         self.gameWonView.alpha = 1;
                     }
                     completion:^(BOOL finished){
                     }];
}

- (void)gameLost
{
    self.gameLostView = [HBFluddGameLostView gameLostView];
    int x = self.gameView.frame.origin.x + ((self.gameView.frame.size.width/2)-(self.gameLostView.frame.size.width/2));
    int y = self.gameView.frame.origin.y + ((self.gameView.frame.size.height/2)-(self.gameLostView.frame.size.height/2));
    self.gameLostView.frame = CGRectMake(x, y, self.gameLostView.frame.size.width, self.gameLostView.frame.size.height);
    [self.gameLostView.playAgainButton addTarget:self action:@selector(newButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    self.gameLostView.alpha  = 0;
    self.gameLostView.transform = CGAffineTransformMakeScale(0.5, 0.5);
    [self.view addSubview:self.gameLostView];
    [UIView animateWithDuration:0.3
                          delay:0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0.5
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.gameLostView.transform = CGAffineTransformMakeScale(1, 1);
                         self.gameLostView.alpha = 1;
                     }
                     completion:^(BOOL finished){
                     }];
}

- (void)clearOldGameView
{
    
    [UIView animateWithDuration:0.3
                          delay:0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0.5
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.oldGameView.alpha = 0;
                         self.oldGameView.transform = CGAffineTransformMakeScale(0.5, 0.5);
                         self.gameWonView.alpha = 0;
                         self.gameWonView.transform = CGAffineTransformMakeScale(0.5, 0.5);
                         self.gameLostView.alpha = 0;
                         self.gameLostView.transform = CGAffineTransformMakeScale(0.5, 0.5);
                     }
                     completion:^(BOOL finished){
                         [self.gameLostView removeFromSuperview];
                         self.gameLostView = nil;
                         [self.gameWonView removeFromSuperview];
                         self.gameWonView = nil;
                         [self.oldGameView removeFromSuperview];
                         self.oldGameView = nil;
                     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
