//
//  OnboardingContentViewController.m
//  cued
//
//  Created by Tyler Zhang on 2020-03-07.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import "OnboardingContentViewController.h"

@interface OnboardingContentViewController ()

@end

@implementation OnboardingContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *dot =[[UIImageView alloc] initWithFrame:CGRectMake(0,
    0,
    self.view.bounds.size.width,
    self.view.bounds.size.height)];
    dot.image=[UIImage imageNamed:self.strImage];
    [self.view addSubview:dot];
}

- (void)viewDidAppear:(BOOL)animated {
    NSUInteger remainingPage = 2 - self.pageIndex;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"switchPage" object:nil userInfo:@{@"remainingPage": @(remainingPage)}];
//    [self.imageView setImage:[UIImage imageNamed:self.strImage]];
//    [self.view setBackgroundColor:[UIColor redColor]];
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
