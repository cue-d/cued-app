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
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

-(void)dismissKeyboard
{
    [self.textField resignFirstResponder];
}

- (void)viewWillAppear:(BOOL)animated {
    if (self.habitInfo != nil) {
        self.textField.text = [self.habitInfo valueForKey:REWARD];
    }
}

- (void)nextScreen {
    [self dismissKeyboard];
    CueRoutineRewardViewController * fc = [[CueRoutineRewardViewController alloc]initWithNibName:@"CueRoutineRewardViewController" bundle:nil];
    [self.habitInfo setValue:self.textField.text forKey:REWARD];
    fc.habitInfo = self.habitInfo;
    [self.navigationController pushViewController:fc animated:YES];
}

- (IBAction)continueButtonPressed:(id)sender {
    [self nextScreen];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self nextScreen];
    return NO;
}

@end
