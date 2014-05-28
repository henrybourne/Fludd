//
//  HBFluddSettingsViewController.m
//  Fludd
//
//  Created by Henry Bourne on 07/05/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddColorSetsViewController.h"

@implementation HBFluddColorSetsViewController

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
    self.navigationItem.title = @"Colors";
    
    self.colorButtons = [NSMutableArray array];
    
    for (int count = 0; count < [self.colors numberOfColorSets]; count++)
    {
        HBFluddColorSet *colorSet = [self.colors colorSetAtIndex:count];
        
        HBFluddMenuButtonView *colorButton = [[HBFluddMenuButtonView alloc] initWithFrame:CGRectMake(0, 45*count, 320, 45) mainLabel:colorSet.title];
        [colorButton showColorSet:colorSet];
        
        if (colorSet == [self.colors selectedColorSet])
        {
             [colorButton showAccessory:HBFluddMenuButtonAccessoryTypeCheck];
        }
        
        if (count == [self.colors numberOfColorSets]-1)
        {
            [colorButton showBorder:HBFluddMenuButtonBorderTypeBoth];
        }
        else
        {
            [colorButton showBorder:HBFluddMenuButtonBorderTypeTop];
        }
        
        [self.view addSubview:colorButton];
        [colorButton addTarget:self action:@selector(colorSetButtonTappedWithSender:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.colorButtons addObject:colorButton];
    }
    
}

- (void)colorSetButtonTappedWithSender:(HBFluddMenuButtonView *)sender
{
    NSLog(@"[HBFluddColorSetsViewController colorButtonTappedWithSender:]");
    [[self.colorButtons objectAtIndex:[self.colors selectedColorSetID]] showAccessory:HBFluddMenuButtonAccessoryTypeNone];
    [[self.colorButtons objectAtIndex:sender.colorPreviewView.colorSet.colorSetID] showAccessory:HBFluddMenuButtonAccessoryTypeCheck];
    self.newSelectedColorSetID = sender.colorPreviewView.colorSet.colorSetID;
    [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(selectNewColorSet) userInfo:nil repeats:NO];
    //[self.delegate didSelectColorSetID:sender.colorPreviewView.colorSet.colorSetID];
    //[self per :@"settingsSegue" sender:self];
}

- (void)selectNewColorSet
{
    [self.delegate didSelectColorSetID:self.newSelectedColorSetID];
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
