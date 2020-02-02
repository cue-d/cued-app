//
//  firstViewController.m
//  cued
//
//  Created by Justin Pezzack on 2/1/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import "ChooseHabitViewController.h"
#import "ChooseCueViewController.h"

@interface ChooseHabitViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ChooseHabitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.textField setDelegate:self];
    [self.textField becomeFirstResponder];
    // Do any additional setup after loading the view from its nib.
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    ChooseCueViewController * fc = [[ChooseCueViewController alloc]initWithNibName:@"ChooseCueViewController" bundle:nil];
    [self.navigationController pushViewController:fc animated:YES];
    return NO;
}

@end
