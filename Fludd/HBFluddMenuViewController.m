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
      [UIFont fontWithName:@"HelveticaNeue-Thin" size:25],NSFontAttributeName,
      [UIColor whiteColor],NSForegroundColorAttributeName,
      nil]];
    [self.navigationController.navigationBar setTitleVerticalPositionAdjustment:1 forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.title = @"Fludd";
    
    self.navigationItem.backBarButtonItem   = [[UIBarButtonItem alloc] initWithTitle:@"Menu"
                                                                               style:UIBarButtonItemStylePlain
                                                                              target:nil
                                                                              action:nil];
    
    // New Game title
    self.gameTitle = [[UILabel alloc] initWithFrame:CGRectMake(30, 25, 200, 30)];
    self.gameTitle.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:25];
    self.gameTitle.textColor = [UIColor colorWithRed:0.800 green:0.690 blue:0.263 alpha:1];
    self.gameTitle.text = @"New Game";
    [self.view addSubview:self.gameTitle];
    
    // New Game Buttons
    self.smallGameButton = [[HBFluddMenuButtonView alloc] initWithFrame:CGRectMake(0, 65, 320, 45) mainLabel:@"Small"];
    [self.smallGameButton showAccessory:HBFluddMenuButtonAccessoryTypeChevron];
    [self.smallGameButton showBorder:HBFluddMenuButtonBorderTypeTop];
    [self.smallGameButton showSublabel:@"12 x 12"];
   
    self.mediumGameButton = [[HBFluddMenuButtonView alloc] initWithFrame:CGRectMake(0, 110, 320, 45) mainLabel:@"Medium"];
    [self.mediumGameButton showAccessory:HBFluddMenuButtonAccessoryTypeChevron];
    [self.mediumGameButton showBorder:HBFluddMenuButtonBorderTypeTop];
    [self.mediumGameButton showSublabel:@"17 x 17"];
    
    self.largeGameButton = [[HBFluddMenuButtonView alloc] initWithFrame:CGRectMake(0, 155, 320, 45) mainLabel:@"Large"];
    [self.largeGameButton showAccessory:HBFluddMenuButtonAccessoryTypeChevron];
    [self.largeGameButton showBorder:HBFluddMenuButtonBorderTypeBoth];
    [self.largeGameButton showSublabel:@"22 x 22"];
    
    [self.view addSubview:self.smallGameButton];
    [self.view addSubview:self.mediumGameButton];
    [self.view addSubview:self.largeGameButton];
    
    [self.smallGameButton   addTarget:self action:@selector(newGameButtonTappedWithSender:) forControlEvents:UIControlEventTouchUpInside];
    [self.mediumGameButton  addTarget:self action:@selector(newGameButtonTappedWithSender:) forControlEvents:UIControlEventTouchUpInside];
    [self.largeGameButton   addTarget:self action:@selector(newGameButtonTappedWithSender:) forControlEvents:UIControlEventTouchUpInside];

    // Settings title
    self.settingsTitle = [[UILabel alloc] initWithFrame:CGRectMake(30, 230, 200, 30)];
    self.settingsTitle.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:25];
    self.settingsTitle.textColor = [UIColor colorWithRed:0.388 green:0.675 blue:0.733 alpha:1];
    self.settingsTitle.text = @"Settings";
    [self.view addSubview:self.settingsTitle];
    
    // Settings Buttons
    // - Sizes
    NSString *sizesPath = [self sizesArchivePath];
    self.sizes = [NSKeyedUnarchiver unarchiveObjectWithFile:sizesPath];
    if (!self.sizes)
    {
        self.sizes = [[HBFluddGameSizes alloc] init];
    }
    
    self.settingsSizeButton = [[HBFluddMenuButtonView alloc] initWithFrame:CGRectMake(0, 270, 320, 45) mainLabel:@"Game Size"];
    [self.settingsSizeButton showAccessory:HBFluddMenuButtonAccessoryTypeChevron];
    [self.settingsSizeButton showBorder:HBFluddMenuButtonBorderTypeTop];
    [self.settingsSizeButton showSublabel:[self.sizes selectedSize].title];
    
    [self.view addSubview:self.settingsSizeButton];
    [self.settingsSizeButton   addTarget:self action:@selector(settingsSizeButtonTapped:) forControlEvents:UIControlEventTouchUpInside];

    // - Colors
    NSString *colorsPath = [self colorsArchivePath];
    self.colors = [NSKeyedUnarchiver unarchiveObjectWithFile:colorsPath];
    if (!self.colors)
    {
        self.colors = [[HBFluddColorSets alloc] init];
    }
    
    self.settingsColorButton = [[HBFluddMenuButtonView alloc] initWithFrame:CGRectMake(0, 315, 320, 45) mainLabel:@"Colors"];
    [self.settingsColorButton showAccessory:HBFluddMenuButtonAccessoryTypeChevron];
    [self.settingsColorButton showBorder:HBFluddMenuButtonBorderTypeTop];
    [self.settingsColorButton showColorSet:[self.colors selectedColorSet]];
    
    [self.view addSubview:self.settingsColorButton];
    [self.settingsColorButton   addTarget:self action:@selector(settingsColorButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    // Load game modes
    ///
    
    self.settingsModeButton = [[HBFluddMenuButtonView alloc] initWithFrame:CGRectMake(0, 360, 320, 45) mainLabel:@"Game Mode"];
    [self.settingsModeButton showAccessory:HBFluddMenuButtonAccessoryTypeChevron];
    [self.settingsModeButton showBorder:HBFluddMenuButtonBorderTypeBoth];
    [self.settingsModeButton showSublabel:@"Normal"];
    
    [self.view addSubview:self.settingsModeButton];
    [self.settingsModeButton   addTarget:self action:@selector(settingsModeButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)newGameButtonTappedWithSender:(HBFluddMenuButtonView *)sender
{
    
    if ([sender.mainLabel.text isEqual:@"Small"])
    {
        NSLog(@"Small Game Tapped");
        self.selectedGameSize = [self.sizes sizeAtIndex:0];
    }
    else if ([sender.mainLabel.text isEqual: @"Medium"])
    {
        NSLog(@"Medium Game Tapped");
        self.selectedGameSize = [self.sizes sizeAtIndex:1];
    }
    else if ([sender.mainLabel.text isEqual:@"Large"])
    {
        NSLog(@"Large Game Tapped");
        self.selectedGameSize = [self.sizes sizeAtIndex:2];
    }
    
    [self performSegueWithIdentifier:@"newGameSegue" sender:self];
}

- (void)settingsSizeButtonTapped:(HBFluddMenuButtonView *)sender
{
    [self performSegueWithIdentifier:@"sizeSegue" sender:self];
}

- (void)settingsColorButtonTapped:(HBFluddMenuButtonView *)sender
{
    [self performSegueWithIdentifier:@"colorSegue" sender:self];
}

- (void)settingsModeButtonTapped:(HBFluddMenuButtonView *)sender
{
    [self performSegueWithIdentifier:@"modeSegue" sender:self];
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
    if ([segue.identifier isEqualToString:@"newGameSegue"])
    {
        HBFluddGameViewController *gameViewController = [segue destinationViewController];
        gameViewController.gameSize = self.selectedGameSize;
        gameViewController.colors = self.colors;
    }
    
    if ([segue.identifier isEqualToString:@"sizeSegue"])
    {
        HBFluddGameSizesViewController *sizesViewController = [segue destinationViewController];
        sizesViewController.sizes = self.sizes;
        sizesViewController.delegate = self;
    }
    
    if ([segue.identifier isEqualToString:@"colorSegue"])
    {
        HBFluddColorSetsViewController *colorsViewController = [segue destinationViewController];
        colorsViewController.colors = self.colors;
        colorsViewController.delegate = self;
    }
}

#pragma mark - HBFluddColorSetsViewDelegate

- (void)didSelectColorSetID:(int)colorSetID
{
    NSLog(@"[HBFluddMenuViewController didSelectColorSetID:]");
    [self.colors setColorSet:colorSetID];
    [self saveColors];
    [self.navigationController popViewControllerAnimated:YES];
    [self.settingsColorButton showColorSet:[self.colors selectedColorSet]];
    [self.view setNeedsDisplay];
}

- (void)didSelectGameSize:(int)index
{
    NSLog(@"[HBFluddMenuViewController didSelectGameSize:]");
    [self.sizes setSize:index];
    [self saveSizes];
    [self.navigationController popViewControllerAnimated:YES];
    [self.settingsSizeButton showSublabel:[self.sizes selectedSize].title];
    [self.view setNeedsDisplay];
}

#pragma mark - Archiving and Unarchiving

- (NSString *)sizesArchivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:@"sizes.archive"];
}

- (BOOL)saveSizes
{
    NSString *path = [self sizesArchivePath];
    return [NSKeyedArchiver archiveRootObject:self.sizes toFile:path];
}

- (NSString *)colorsArchivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:@"colors.archive"];
}

- (BOOL)saveColors
{
    NSString *path = [self colorsArchivePath];
    return [NSKeyedArchiver archiveRootObject:self.colors toFile:path];
}

@end
