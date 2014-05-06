//
//  HBFluddMenuViewController.m
//  Fludd
//
//  Created by Henry Bourne on 02/05/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddMenuViewController.h"

@interface HBFluddMenuViewController ()

@end

@implementation HBFluddMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.204 green:0.204 blue:0.204 alpha:1];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.251 green:0.251 blue:0.251 alpha:1];
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIFont fontWithName:@"HelveticaNeue-Thin" size:35],NSFontAttributeName,
      [UIColor whiteColor],NSForegroundColorAttributeName,
      nil]];
    self.navigationItem.title = @"Fludd";
    [self.navigationController.navigationBar setTitleVerticalPositionAdjustment:5 forBarMetrics:UIBarMetricsDefault];
    
    self.navigationItem.backBarButtonItem   = [[UIBarButtonItem alloc] initWithTitle:@"Menu"
                                                                               style:UIBarButtonItemStylePlain
                                                                              target:nil
                                                                              action:nil];
    
    // New Game title
    self.gameTitle = [[UILabel alloc] initWithFrame:CGRectMake(30, 35, 200, 20)];
    self.gameTitle.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:25];
    self.gameTitle.textColor = [UIColor colorWithRed:0.800 green:0.690 blue:0.263 alpha:1];
    self.gameTitle.text = @"New Game";
    [self.view addSubview:self.gameTitle];
    
    // New Game Buttons
    self.smallGameButton = [[HBFluddNewGameButtonView alloc] initWithFrame:CGRectMake(0, 65, 320, 45)
                                                                 mainLabel:@"Small"
                                                                  subLabel:@"12 x 12"
                                                          showBottomBorder:NO];
   
    self.mediumGameButton = [[HBFluddNewGameButtonView alloc] initWithFrame:CGRectMake(0, 110, 320, 45)
                                                                  mainLabel:@"Medium"
                                                                   subLabel:@"17 x 17"
                                                           showBottomBorder:NO];
    
    self.largeGameButton = [[HBFluddNewGameButtonView alloc] initWithFrame:CGRectMake(0, 155, 320, 45)
                                                                 mainLabel:@"Large"
                                                                  subLabel:@"22 x 22"
                                                          showBottomBorder:YES];
    
    [self.view addSubview:self.smallGameButton];
    [self.view addSubview:self.mediumGameButton];
    [self.view addSubview:self.largeGameButton];
    
    [self.smallGameButton   addTarget:self action:@selector(newGameButtonTappedWithSender:) forControlEvents:UIControlEventTouchUpInside];
    [self.mediumGameButton  addTarget:self action:@selector(newGameButtonTappedWithSender:) forControlEvents:UIControlEventTouchUpInside];
    [self.largeGameButton   addTarget:self action:@selector(newGameButtonTappedWithSender:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)newGameButtonTappedWithSender:(HBFluddNewGameButtonView *)sender
{
    
    if ([sender.mainLabel.text isEqual:@"Small"])
    {
        NSLog(@"Small Game Tapped");
        self.selectedBoardSize = kBoardSizeSmall;
    }
    else if ([sender.mainLabel.text isEqual: @"Medium"])
    {
        NSLog(@"Medium Game Tapped");
        self.selectedBoardSize = kBoardSizeMedium;
    }
    else if ([sender.mainLabel.text isEqual:@"Large"])
    {
        NSLog(@"Large Game Tapped");
        self.selectedBoardSize = kBoardSizeLarge;
    }
    
    [self performSegueWithIdentifier:@"newGameSegue" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSLog(@"Prepare for segue");
    HBFluddGameViewController *gameViewController = [segue destinationViewController];
    gameViewController.boardSize = self.selectedBoardSize;
}


@end
