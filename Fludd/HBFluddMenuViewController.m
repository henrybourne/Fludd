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
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.204 green:0.204 blue:0.204 alpha:1];//[UIColor colorWithRed:0.251 green:0.251 blue:0.251 alpha:1];
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIFont fontWithName:@"HelveticaNeue-Light" size:25],NSFontAttributeName,
      [UIColor whiteColor],NSForegroundColorAttributeName,
      nil]];
    [self.navigationController.navigationBar setTitleVerticalPositionAdjustment:2 forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.title = @"Fludd";
    
    self.navigationItem.backBarButtonItem   = [[UIBarButtonItem alloc] initWithTitle:@"Menu"
                                                                               style:UIBarButtonItemStylePlain
                                                                              target:nil
                                                                              action:nil];
    
    // ----------------------------------------
    // Set up cell view variables
    if ([UIScreen mainScreen].bounds.size.height == 568)
    {
        // iPhone retina-4 inch
        self.cellRows = 10;
        self.yPosMenuButtons = 165;
        self.yPosNewButton = 35;
    }
    else
    {
        // iPhone retina-3.5 inch
        self.cellRows = 5;
        self.yPosMenuButtons = 145;
        self.yPosNewButton = 25;
    }
    
    // ---------------------------------------
    // New Game Button
    int startGameButtonWidth = 86;
    self.startGameButton = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2)-(startGameButtonWidth/2), self.yPosNewButton, startGameButtonWidth, startGameButtonWidth)];
    self.startGameButton.layer.cornerRadius = self.startGameButton.bounds.size.width/2.0;
    self.startGameButton.layer.borderWidth = 1.0;
    self.startGameButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.startGameButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-light" size:17];
    self.startGameButton.titleLabel.textColor = [UIColor whiteColor];
    self.startGameButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.startGameButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.startGameButton setTitle:@"New\nGame" forState:UIControlStateNormal];
    [self.view addSubview:self.startGameButton];
    [self.startGameButton   addTarget:self action:@selector(newGameButtonTappedWithSender:) forControlEvents:UIControlEventTouchUpInside];
    
    // ---------------------------------
    // Settings Buttons
    int menuButtonHeight = 45;
    int menuButtonCount = 4;
    self.menuButtonsContainer = [[UIView alloc] initWithFrame:CGRectMake(0, self.yPosMenuButtons, self.view.frame.size.width, menuButtonHeight * menuButtonCount)];
    
    // Load game modes
    NSString *modesPath = [self modesArchivePath];
    self.modes = [NSKeyedUnarchiver unarchiveObjectWithFile:modesPath];
    if (!self.modes)
    {
        self.modes = [[HBFluddGameModes alloc] init];
    }
    
    self.settingsModeButton = [[HBFluddMenuButtonView alloc] initWithFrame:CGRectMake(0, 0, 320, menuButtonHeight) mainLabel:@"Game Mode"];
    [self.settingsModeButton showAccessory:HBFluddMenuButtonAccessoryTypeChevron];
    [self.settingsModeButton showBorder:HBFluddMenuButtonBorderTypeTop];
    [self.settingsModeButton showSublabel:[self.modes selectedMode].title];
    
    [self.menuButtonsContainer addSubview:self.settingsModeButton];
    [self.settingsModeButton   addTarget:self action:@selector(settingsModeButtonTapped:) forControlEvents:UIControlEventTouchUpInside];

    
    // - Sizes
    NSString *sizesPath = [self sizesArchivePath];
    self.sizes = [NSKeyedUnarchiver unarchiveObjectWithFile:sizesPath];
    if (!self.sizes)
    {
        self.sizes = [[HBFluddGameSizes alloc] init];
    }
    
    self.settingsSizeButton = [[HBFluddMenuButtonView alloc] initWithFrame:CGRectMake(0, menuButtonHeight, 320, menuButtonHeight) mainLabel:@"Difficulty"];
    [self.settingsSizeButton showAccessory:HBFluddMenuButtonAccessoryTypeChevron];
    [self.settingsSizeButton showBorder:HBFluddMenuButtonBorderTypeTop];
    [self.settingsSizeButton showSublabel:[self.sizes selectedSize].title];
    
    [self.menuButtonsContainer addSubview:self.settingsSizeButton];
    [self.settingsSizeButton   addTarget:self action:@selector(settingsSizeButtonTapped:) forControlEvents:UIControlEventTouchUpInside];

    // - Colors
    NSString *colorsPath = [self colorsArchivePath];
    self.colors = [NSKeyedUnarchiver unarchiveObjectWithFile:colorsPath];
    if (!self.colors)
    {
        self.colors = [[HBFluddColorSets alloc] init];
    }
    
    self.settingsColorButton = [[HBFluddMenuButtonView alloc] initWithFrame:CGRectMake(0, menuButtonHeight*2, 320, menuButtonHeight) mainLabel:@"Colors"];
    [self.settingsColorButton showAccessory:HBFluddMenuButtonAccessoryTypeChevron];
    [self.settingsColorButton showBorder:HBFluddMenuButtonBorderTypeTop];
    [self.settingsColorButton showColorSet:[self.colors selectedColorSet]];
    
    [self.menuButtonsContainer addSubview:self.settingsColorButton];
    [self.settingsColorButton   addTarget:self action:@selector(settingsColorButtonTapped:) forControlEvents:UIControlEventTouchUpInside];

    // - How to Play
    self.howToPlayButton = [[HBFluddMenuButtonView alloc] initWithFrame:CGRectMake(0, menuButtonHeight*3, 320, menuButtonHeight) mainLabel:@"How to Play"];
    [self.howToPlayButton showAccessory:HBFluddMenuButtonAccessoryTypeChevron];
    [self.howToPlayButton showBorder:HBFluddMenuButtonBorderTypeBoth];
    
    [self.menuButtonsContainer addSubview:self.howToPlayButton];
    [self.howToPlayButton addTarget:self action:@selector(howToPlayButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    
    // Add all menu items
    [self.view addSubview:self.menuButtonsContainer];

}

- (void)viewWillAppear:(BOOL)animated
{
    // Set up the cell views at the bottom of the screen
    int rows = self.cellRows;
    int columns = 32;
    int cellSize = self.view.frame.size.width/columns;

    // Remove this if it exists to clean up all subviews
    [self.cellViewsContainer removeFromSuperview];
    
    self.cellViewsContainer = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - (cellSize * rows), self.view.frame.size.width, cellSize*rows)];
    self.cellViews = [NSMutableArray arrayWithCapacity:rows];
    
    for (int row = 0; row < rows; row++)
    {
        // Set up the row array
        NSMutableArray *columnCellViews = [NSMutableArray arrayWithCapacity:columns];
        for (int column = 0; column < columns; column++)
        {
            int randomColorIndex = arc4random_uniform(6);
            
            HBFluddCell *currentCell = [[HBFluddCell alloc] initWithSize:cellSize
                                                                 colorID:randomColorIndex
                                                                   color:[self.colors colorAtIndex:randomColorIndex]];
            HBFluddCellView *currentCellView = [[HBFluddCellView alloc] initWithFrame:CGRectMake((cellSize*column), (cellSize*row), cellSize, cellSize)
                                                                                model:currentCell];
            
            int appearanceSeed = (int)arc4random_uniform(columns);
            int probability = ((double)(row*1.5)/(double)rows * (double)columns);
//            NSLog(@"%i %i", appearanceSeed, probability);
            if (appearanceSeed > probability) {
                currentCellView.alpha = 0;
            }
            
            [self.cellViewsContainer addSubview:currentCellView];
            // Add the cell into the row array
            [columnCellViews setObject:currentCellView atIndexedSubscript:column];
        }
        // Add the row array into the board array
        [self.cellViews setObject:columnCellViews atIndexedSubscript:row];
    }
    
    [self.view addSubview:self.cellViewsContainer];
}

- (void)newGameButtonTappedWithSender:(HBFluddMenuButtonView *)sender
{
    self.selectedGameSize = [self.sizes selectedSize];
    [self performSegueWithIdentifier:@"newGameSegue" sender:self];
}

- (void)settingsSizeButtonTapped:(HBFluddMenuButtonView *)sender
{
    [self performSegueWithIdentifier:@"sizesSegue" sender:self];
}

- (void)settingsColorButtonTapped:(HBFluddMenuButtonView *)sender
{
    [self performSegueWithIdentifier:@"colorsSegue" sender:self];
}

- (void)settingsModeButtonTapped:(HBFluddMenuButtonView *)sender
{
    [self performSegueWithIdentifier:@"modesSegue" sender:self];
}

- (void)howToPlayButtonTapped:(HBFluddMenuButtonView *)sender
{
    NSLog(@"How To play tapped");
    [self performSegueWithIdentifier:@"howToPlaySegue" sender:self];
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
        gameViewController.gameMode = [self.modes selectedMode];
        gameViewController.colors = self.colors;
    }
    
    if ([segue.identifier isEqualToString:@"modesSegue"])
    {
        HBFluddGameModesViewController *modesViewController = [segue destinationViewController];
        modesViewController.modes = self.modes;
        modesViewController.delegate = self;
    }
    
    if ([segue.identifier isEqualToString:@"sizesSegue"])
    {
        HBFluddGameSizesViewController *sizesViewController = [segue destinationViewController];
        sizesViewController.sizes = self.sizes;
        sizesViewController.delegate = self;
    }
    
    if ([segue.identifier isEqualToString:@"colorsSegue"])
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

- (void)didSelectGameMode:(int)index
{
    NSLog(@"[HBFluddMenuViewController didSelectGameMode:]");
    [self.modes setMode:index];
    [self saveModes];
    [self.navigationController popViewControllerAnimated:YES];
    [self.settingsModeButton showSublabel:[self.modes selectedMode].title];
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

- (NSString *)modesArchivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:@"modes.archive"];
}

- (BOOL)saveModes
{
    NSString *path = [self modesArchivePath];
    return [NSKeyedArchiver archiveRootObject:self.modes toFile:path];
}

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
