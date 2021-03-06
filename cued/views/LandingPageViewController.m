//
//  LandingPageViewController.m
//  cued
//
//  Created by Tyler Zhang on 2020-02-19.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import "LandingPageViewController.h"
#import "HomeHabitViewController.h"
#import "ViewController.h"

@interface LandingPageViewController ()

@end

@implementation LandingPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController setNavigationBarHidden:YES];
    
}

- (void) viewWillAppear:(BOOL)animated {
    NSString *user = [[NSUserDefaults standardUserDefaults] stringForKey:@"setCurrentIdentifier"];
    if (user != nil && ![user isEqualToString:@""]) {
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        appDelegate.currentUserID = user;
        HomeHabitViewController * tvc = [[HomeHabitViewController alloc]initWithNibName:@"HomeHabitViewController" bundle:nil];
        [self.navigationController pushViewController:tvc animated:NO];
    } else {
        ViewController * vc = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:NO];
    }
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
