//
//  EditHabitPropertyController.m
//  cued
//
//  Created by Justin Pezzack on 2/21/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import "EditHabitPropertyController.h"
#import "AppDelegate.h"

@interface EditHabitPropertyController ()
@end

@implementation EditHabitPropertyController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self.key isEqualToString:@"cue"]) {
        self.title = @"Edit Cue";
    } else if ([self.key isEqualToString:@"reward"]) {
        self.title = @"Edit Reward";
    }
    self.message = nil;
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
                                      handler:^(UIAlertAction * action) {
    }];
    
    UIAlertAction* saveAction = [UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * action)  {
        [self.habit setValue:self.textField.text forKey:self.key];
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [appDelegate saveContext];
        [self.parent.tableView reloadData];
    }];
    
    [self addAction:cancelAction];
    [self addAction:saveAction];
    
    [self addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        self.textField = textField;
        self.textField.text = [self.habit valueForKey:self.key];
    }];
    
    // Do any additional setup after loading the view from its nib.
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
