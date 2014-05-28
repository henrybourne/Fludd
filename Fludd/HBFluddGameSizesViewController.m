//
//  HBFluddGameSizesViewController.m
//  Fludd
//
//  Created by Henry Bourne on 26/05/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddGameSizesViewController.h"

@interface HBFluddGameSizesViewController ()

@end

@implementation HBFluddGameSizesViewController

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
    self.navigationItem.title = @"Game Size";
    
    self.sizeButtons = [NSMutableArray array];
    
    for (int count = 0; count < [self.sizes numberOfSizes]; count++)
    {
        HBFluddGameSize *gameSize = [self.sizes sizeAtIndex:count];
        
        HBFluddMenuButtonView *sizeButton = [[HBFluddMenuButtonView alloc] initWithFrame:CGRectMake(0, 45*count, 320, 45) mainLabel:gameSize.title];
        [sizeButton showSublabel:[NSString stringWithFormat:@"%i moves", gameSize.movesAllowed]];
        
        if (gameSize == [self.sizes selectedSize])
        {
            [sizeButton showAccessory:HBFluddMenuButtonAccessoryTypeCheck];
        }
        
        if (count == [self.sizes numberOfSizes]-1)
        {
            [sizeButton showBorder:HBFluddMenuButtonBorderTypeBoth];
        }
        else
        {
            [sizeButton showBorder:HBFluddMenuButtonBorderTypeTop];
        }
        
        sizeButton.index = count;
        
        [self.view addSubview:sizeButton];
        [sizeButton addTarget:self action:@selector(sizeButtonTappedWithSender:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.sizeButtons addObject:sizeButton];
    }
}


- (void)sizeButtonTappedWithSender:(HBFluddMenuButtonView *)sender
{
    NSLog(@"[HBFluddColorSetsViewController colorButtonTappedWithSender:]");
    [[self.sizeButtons objectAtIndex:[self.sizes selectedIndex]] showAccessory:HBFluddMenuButtonAccessoryTypeNone];
    [[self.sizeButtons objectAtIndex:sender.index] showAccessory:HBFluddMenuButtonAccessoryTypeCheck];
    self.newSelectedSizeIndex = sender.index;
    [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(selectGameSize) userInfo:nil repeats:NO];
    //[self.delegate didSelectColorSetID:sender.colorPreviewView.colorSet.colorSetID];
    //[self per :@"settingsSegue" sender:self];
}

- (void)selectGameSize
{
    [self.delegate didSelectGameSize:self.newSelectedSizeIndex];
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
