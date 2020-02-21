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
