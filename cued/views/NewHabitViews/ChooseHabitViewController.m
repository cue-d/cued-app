//
//  firstViewController.m
//  cued
//
//  Created by Justin Pezzack on 2/1/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import "ChooseHabitViewController.h"

@interface ChooseHabitViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ChooseHabitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.textField setDelegate:self];
    [self.textField becomeFirstResponder];
    self.habitInfo = [NSMutableDictionary new];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
    if (self.habitInfo != nil) {
        self.textField.text = [self.habitInfo valueForKey:ROUTINE_PREVIOUS];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    ChooseCueViewController * fc = [[ChooseCueViewController alloc]initWithNibName:@"ChooseCueViewController" bundle:nil];
    [self.habitInfo setValue:textField.text forKey:ROUTINE_PREVIOUS];
    fc.habitInfo = self.habitInfo;
    [self.navigationController pushViewController:fc animated:YES];
    return NO;
}
- (IBAction)skipButtonPressed:(id)sender {
    HomeHabitViewController * fc = [[HomeHabitViewController alloc]initWithNibName:@"HomeHabitViewController" bundle:nil];
    [self.navigationController pushViewController:fc animated:NO];
}

@end
