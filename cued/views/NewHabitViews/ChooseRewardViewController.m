//
//  ChooseCueViewController.m
//  cued
//
//  Created by Justin Pezzack on 2/1/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import "ChooseRewardViewController.h"
#import "CueRoutineRewardViewController.h"

@interface ChooseRewardViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ChooseRewardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.textField setDelegate:self];
    [self.textField becomeFirstResponder];
    // Do any additional setup after loading the view from its nib.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
//    self.habit.reward = textField.text;
    [textField resignFirstResponder];
    CueRoutineRewardViewController * fc = [[CueRoutineRewardViewController alloc]initWithNibName:@"CueRoutineRewardViewController" bundle:nil];
    [self.navigationController pushViewController:fc animated:YES];
    return NO;
}

@end
