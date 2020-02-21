//
//  ChooseCueViewController.m
//  cued
//
//  Created by Justin Pezzack on 2/1/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import "ChooseCueViewController.h"

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
    
    if (self.habitInfo != nil) {
        self.textField.text = [self.habitInfo valueForKey:CUE];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    ChooseRewardViewController * fc = [[ChooseRewardViewController alloc]initWithNibName:@"ChooseRewardViewController" bundle:nil];
    [self.habitInfo setValue:textField.text forKey:CUE];
    fc.habitInfo = self.habitInfo;
    [self.navigationController pushViewController:fc animated:YES];
    return NO;
}

@end
