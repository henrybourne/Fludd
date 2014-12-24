//
//  HBFluddHowToPlayViewController.m
//  Fludd
//
//  Created by Henry Bourne on 26/07/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddHowToPlayViewController.h"

@interface HBFluddHowToPlayViewController ()

@end

@implementation HBFluddHowToPlayViewController

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
    NSLog(@"[HBFluddHowToPlayViewController viewDidLoad]");
    
    self.view.backgroundColor = [UIColor colorWithRed:0.204 green:0.204 blue:0.204 alpha:1];
    self.navigationItem.title = @"How to Play";
    
    self.pageImages = @[@"BoardImage1", @"BoardImage2", @"BoardImage3", @"BoardImage4", @"BoardImage5"];
    self.pageText = @[@"The game starts with the top left square fludded.",
                      @"Change the colour of the fludded square using the buttons below the board. Neighbouring squares that are the same colour as the new colour will be fludded.",
                      @"Continue to change the colour of fludded squares to fludd more of the board.",
                      @"Try to fludd the whole board before you run out of moves.",
                      @"In ‘Walls’ mode there are some squares that cannot be fludded. You’ll have to fludd around them."];
    
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"HowToPlayPageViewController"];
    self.pageViewController.dataSource = self;
    
    HBFluddHowToPlayContentViewController *startingPageContentViewController = [self viewControllerAtIndex:0];
    NSArray *pageViewControllers = @[startingPageContentViewController];
    
    [self.pageViewController setViewControllers:pageViewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (HBFluddHowToPlayContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageText count] == 0) || (index > [self.pageText count]))
    {
        return nil;
    }
    
    HBFluddHowToPlayContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"HowToPlayContentViewController"];
    pageContentViewController.imageFile = self.pageImages[index];
    pageContentViewController.text = self.pageText[index];
    pageContentViewController.pageIndex = index;

    return pageContentViewController;
}

#pragma mark - PageViewControllerDataSource

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageText count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((HBFluddHowToPlayContentViewController *) viewController).pageIndex;
    
    if (index==NSNotFound)
    {
        return nil;
    }
    
    index++;
    
    if (index == [self.pageText count])
    {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    
    NSUInteger index = ((HBFluddHowToPlayContentViewController *) viewController).pageIndex;
    
    if ((index==0) || (index==NSNotFound))
    {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
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
