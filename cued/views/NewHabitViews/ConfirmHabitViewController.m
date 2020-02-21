//
//  ConfirmHabitViewController.m
//  cued
//
//  Created by Justin Pezzack on 2/1/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import "ConfirmHabitViewController.h"
#import "HomeHabitViewController.h"

@interface ConfirmHabitViewController ()

@end

@implementation ConfirmHabitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    if (self.habitEntity != nil) {
        self.cueTextfield.text = [NSString stringWithFormat:@"Cue: %@",self.habitEntity.cue];
        self.routineTextfield.text = [NSString stringWithFormat:@"New Routine: %@",self.habitEntity.routine];
        self.previousRoutineTextfield.text = [NSString stringWithFormat:@"Old Routine: %@",self.habitEntity.routine_previous];
        self.rewardTextfield.text = [NSString stringWithFormat:@"Reward: %@",self.habitEntity.reward];
    }
}

- (IBAction)saveHabit:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate saveContext];
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
