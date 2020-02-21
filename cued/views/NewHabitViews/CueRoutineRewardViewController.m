//
//  CueRoutineRewardViewController.m
//  cued
//
//  Created by Justin Pezzack on 2/1/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import "CueRoutineRewardViewController.h"

@interface CueRoutineRewardViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation CueRoutineRewardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.textField setDelegate:self];
    [self.textField becomeFirstResponder];
        // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    if (self.habitInfo != nil) {
        self.textField.text = [self.habitInfo valueForKey:ROUTINE];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    ConfirmHabitViewController * fc = [[ConfirmHabitViewController alloc]initWithNibName:@"ConfirmHabitViewController" bundle:nil];
    [self.habitInfo setValue:textField.text forKey:ROUTINE];
    fc.habitInfo = self.habitInfo;
    [self.navigationController pushViewController:fc animated:YES];
    return NO;
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
