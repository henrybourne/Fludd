//
//  HBFluddHowToPlayContentViewController.m
//  Fludd
//
//  Created by Henry Bourne on 26/07/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddHowToPlayContentViewController.h"

@interface HBFluddHowToPlayContentViewController ()

@end

@implementation HBFluddHowToPlayContentViewController

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
    NSLog(@"[HBFluddHowToPlayContentViewController viewDidLoad]");
    
    self.view.backgroundColor = [UIColor colorWithRed:0.204 green:0.204 blue:0.204 alpha:1];
    
    self.imageView.image = [UIImage imageNamed:self.imageFile];
    self.textLabel.text = self.text;
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
