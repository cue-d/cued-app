//
//  OnboardingPageViewController.m
//  cued
//
//  Created by Tyler Zhang on 2020-03-07.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import "OnboardingPageViewController.h"

@interface OnboardingPageViewController ()
{
    NSArray *screens;
}
@end

@implementation OnboardingPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    screens = @[@"onboarding1.jpg", @"onboarding2.png", @"onboarding3.png", @"onboarding4.png", @"onboarding5.png", @"onboarding6.png", @"onboarding7.png", @"onboarding8.png", @"onboarding9.png", @"onboarding10.png", @"onboarding11.png", @"onboarding12.png"];
    self.dataSource = self;
    OnboardingContentViewController *initialVC = (OnboardingContentViewController *)[self viewControllerAtIndex:0];
    NSArray *vcs = [NSArray arrayWithObject:initialVC];
    [self setViewControllers:vcs direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    UIPageControl* pageControl;
    UIScrollView*  scrollView;

    for (id subview in self.view.subviews) {

        if ([subview isKindOfClass:[UIPageControl class]]) {
            pageControl = subview;
        } else if ([subview isKindOfClass:[UIScrollView class]]) {
            scrollView = subview;
        }
    }

    if (scrollView!= nil && pageControl !=nil) {
        CGRect frame = scrollView.frame;
        frame.size.height = frame.size.height + pageControl.frame.size.height;
        scrollView.frame = frame;
        [self.view bringSubviewToFront:pageControl];
    }
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return screens.count;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

- (UIViewController *) viewControllerAtIndex: (NSUInteger) index {
    OnboardingContentViewController *vc = [[OnboardingContentViewController alloc]initWithNibName:@"OnboardingContentViewController" bundle:nil];
    vc.strImage = screens[index];
    vc.pageIndex = index;
    return vc;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = ((OnboardingContentViewController *) viewController).pageIndex;
    if (index == 0 || index == NSNotFound) {
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index];
};

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = ((OnboardingContentViewController *) viewController).pageIndex;
    if (index == screens.count - 1 || index == NSNotFound) {
        return nil;
    }
    index++;
    return [self viewControllerAtIndex:index];
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
