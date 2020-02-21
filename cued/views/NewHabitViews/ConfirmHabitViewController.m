//
//  ConfirmHabitViewController.m
//  cued
//
//  Created by Justin Pezzack on 2/1/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import "ConfirmHabitViewController.h"

@interface ConfirmHabitViewController ()

@end

@implementation ConfirmHabitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    if (self.habitInfo != nil) {
        self.cueTextfield.text = [NSString stringWithFormat:@"Cue: %@",[self.habitInfo valueForKey:CUE]];
        self.routineTextfield.text = [NSString stringWithFormat:@"New Routine: %@",[self.habitInfo valueForKey:ROUTINE]];
        self.previousRoutineTextfield.text = [NSString stringWithFormat:@"Old Routine: %@",[self.habitInfo valueForKey:ROUTINE_PREVIOUS]];
        self.rewardTextfield.text = [NSString stringWithFormat:@"Reward: %@",[self.habitInfo valueForKey:REWARD]];
    }
}

- (IBAction)saveHabit:(id)sender {
    [Habit createHabitFromDictionary:@{CUE: [self.habitInfo valueForKey:CUE], ROUTINE: [self.habitInfo valueForKey:ROUTINE], ROUTINE_PREVIOUS: [self.habitInfo valueForKey:ROUTINE_PREVIOUS], REWARD: [self.habitInfo valueForKey:REWARD]}];
    NSLog(@"REAL DATA ADDED");
    self.navigationController.navigationBarHidden = YES;
    [self.navigationController popToRootViewControllerAnimated:YES];
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
