//
//  OnboardingViewController.m
//  cued
//
//  Created by Tyler Zhang on 2020-03-07.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import "OnboardingViewController.h"

@interface OnboardingViewController ()
{
    BOOL isLastPage;
}

@end

@implementation OnboardingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    isLastPage = false;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeButtonText:) name:@"switchPage" object:nil];
    
    self.onboardingPageViewController = [[OnboardingPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    [self addChildViewController:self.onboardingPageViewController];
    self.onboardingPageViewController.view.frame = self.pageView.frame;
    [self.pageView addSubview:self.onboardingPageViewController.view];
    [self.onboardingPageViewController didMoveToParentViewController:self];
}

-(void)changeButtonText:(NSNotification *)notification{
    NSNumber *remainingPage = notification.userInfo[@"remainingPage"];
    if (([remainingPage integerValue] == 0) != isLastPage) {
        isLastPage = ([remainingPage integerValue] == 0);
        [UIView setAnimationsEnabled:NO];
        [self.skipButton setTitle:isLastPage ? @"Let's add a new habit!" : @"Skip intro" forState:UIControlStateNormal];
        [self.skipButton layoutIfNeeded];
        [UIView setAnimationsEnabled:YES];
    }
}

- (IBAction)skipClicked:(id)sender {
    ChooseHabitViewController * vc = [[ChooseHabitViewController alloc]initWithNibName:@"ChooseHabitViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
