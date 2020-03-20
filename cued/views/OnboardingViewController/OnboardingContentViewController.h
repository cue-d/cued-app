//
//  OnboardingContentViewController.h
//  cued
//
//  Created by Tyler Zhang on 2020-03-07.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OnboardingContentViewController : UIPageViewController
@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property NSString *strImage;
@property NSInteger pageIndex;

@end

NS_ASSUME_NONNULL_END
