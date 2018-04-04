//
//  HBGameModesViewController.m
//  Fludd
//
//  Created by Henry Bourne on 28/05/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddGameModesViewController.h"

@interface HBFluddGameModesViewController ()

@end

@implementation HBFluddGameModesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.204 green:0.204 blue:0.204 alpha:1];
    self.navigationItem.title = @"Game Mode";
    
    self.modeButtons = [NSMutableArray array];
    
    for (int count = 0; count < [self.modes numberOfModes]; count++)
    {
        HBFluddGameMode *gameMode = [self.modes modeAtIndex:count];
        
        HBFluddMenuButtonView *sizeButton = [[HBFluddMenuButtonView alloc] initWithFrame:CGRectMake(0, 45*count, 320, 45) mainLabel:gameMode.title];
        
        if (gameMode == [self.modes selectedMode])
        {
            [sizeButton showAccessory:HBFluddMenuButtonAccessoryTypeCheck];
        }
        
        [sizeButton showBorder:HBFluddMenuButtonBorderTypeBottom];
        
//        if (count == [self.modes numberOfModes]-1)
//        {
//            [sizeButton showBorder:HBFluddMenuButtonBorderTypeBoth];
//        }
//        else
//        {
//            [sizeButton showBorder:HBFluddMenuButtonBorderTypeTop];
//        }
        
        sizeButton.index = count;
        
        [self.view addSubview:sizeButton];
        [sizeButton addTarget:self action:@selector(modeButtonTappedWithSender:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.modeButtons addObject:sizeButton];
    }
}


- (void)modeButtonTappedWithSender:(HBFluddMenuButtonView *)sender
{
    NSLog(@"[HBFluddColorSetsViewController colorButtonTappedWithSender:]");
    [[self.modeButtons objectAtIndex:[self.modes selectedIndex]] showAccessory:HBFluddMenuButtonAccessoryTypeNone];
    [[self.modeButtons objectAtIndex:sender.index] showAccessory:HBFluddMenuButtonAccessoryTypeCheck];
    self.newSelectedIndex = sender.index;
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(selectGameSize) userInfo:nil repeats:NO];
    //[self.delegate didSelectColorSetID:sender.colorPreviewView.colorSet.colorSetID];
    //[self per :@"settingsSegue" sender:self];
}

- (void)selectGameSize
{
    [self.delegate didSelectGameMode:self.newSelectedIndex];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
