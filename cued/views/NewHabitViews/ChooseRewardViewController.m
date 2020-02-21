//
//  ChooseCueViewController.m
//  cued
//
//  Created by Justin Pezzack on 2/1/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import "ChooseRewardViewController.h"

@interface ChooseRewardViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ChooseRewardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.textField setDelegate:self];
    [self.textField becomeFirstResponder];
}

- (void)viewWillAppear:(BOOL)animated {
    if (self.habitInfo != nil) {
        self.textField.text = [self.habitInfo valueForKey:REWARD];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    CueRoutineRewardViewController * fc = [[CueRoutineRewardViewController alloc]initWithNibName:@"CueRoutineRewardViewController" bundle:nil];
    [self.habitInfo setValue:textField.text forKey:REWARD];
    fc.habitInfo = self.habitInfo;
    [self.navigationController pushViewController:fc animated:YES];
    return NO;
}

@end
