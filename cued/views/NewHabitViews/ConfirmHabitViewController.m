//
//  ConfirmHabitViewController.m
//  cued
//
//  Created by Justin Pezzack on 2/1/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import "ConfirmHabitViewController.h"
#import "HabitTableViewController.h"

@interface ConfirmHabitViewController ()

@end

@implementation ConfirmHabitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)saveHabit:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:NO];
    HabitTableViewController * tvc = [[HabitTableViewController alloc] initWithNibName:@"HabitTableViewController" bundle:nil];
    [self.navigationController pushViewController:tvc animated:YES];
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
