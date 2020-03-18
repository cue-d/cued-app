//
//  SingleHabitViewController.m
//  cued
//
//  Created by Katherine Lu on 2020-02-19.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import "SingleHabitViewController.h"
#import "EditHabitTableViewController.h"

@interface SingleHabitViewController ()

@end

@implementation SingleHabitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.routineLabel.text = self.routine;
    self.editHabitTableViewController = [[EditHabitTableViewController alloc]init];
    self.editHabitTableViewController.tableView = self.singleHabitInfoView;
    [self.editHabitTableViewController.tableView registerNib:[UINib nibWithNibName:@"EditHabitTableViewCell" bundle:nil] forCellReuseIdentifier:@"editHabitViewCell"];
    self.editHabitTableViewController.habit = self.habit;
    self.editHabitTableViewController.parent = self;
}
- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                         forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Delete" style:UIBarButtonItemStylePlain target:self action:@selector(deleteObject:)];
    self.navigationItem.rightBarButtonItem = anotherButton;
    
}

- (void)deleteObject:(UIButton *)sender {
    UIAlertController * alert = [[UIAlertController alloc]init];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
                                      handler:^(UIAlertAction * action) {
    }];
    
    UIAlertAction* saveAction = [UIAlertAction actionWithTitle:@"Confirm" style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * action)  {
        [self.habit deleteFromCoreData];
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [alert addAction:saveAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}
- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
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
