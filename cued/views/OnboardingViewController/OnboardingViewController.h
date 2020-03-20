//
//  OnboardingViewController.h
//  cued
//
//  Created by Tyler Zhang on 2020-03-07.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OnboardingPageViewController.h"
#import "ChooseHabitViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface OnboardingViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *pageView;
@property (weak, nonatomic) IBOutlet UIButton *skipButton;
@property (strong, nonatomic) OnboardingPageViewController *onboardingPageViewController;
@end

NS_ASSUME_NONNULL_END
