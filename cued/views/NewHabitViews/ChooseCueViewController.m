//
//  ChooseCueViewController.m
//  cued
//
//  Created by Justin Pezzack on 2/1/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import "ChooseCueViewController.h"
#import "ChooseRewardViewController.h"

@interface ChooseCueViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ChooseCueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.textField setDelegate:self];
    [self.textField becomeFirstResponder];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                         forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    if (self.habitEntity != nil) {
        self.textField.text = self.habitEntity.cue;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    ChooseRewardViewController * fc = [[ChooseRewardViewController alloc]initWithNibName:@"ChooseRewardViewController" bundle:nil];
    self.habitEntity.cue = textField.text;
    fc.habitEntity = self.habitEntity;
    [self.navigationController pushViewController:fc animated:YES];
    return NO;
}

@end
