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

//    self.editHabitTableViewController = [[EditHabitTableViewController alloc]init];
//    self.editHabitTableViewController.tableView = self.singleHabitInfoView;
//    [self.editHabitTableViewController.tableView registerNib:[UINib nibWithNibName:@"EditHabitTableViewController" bundle:nil] forCellReuseIdentifier:@"cell"];
//    [self.editHabitTableViewController.tableView setShowsHorizontalScrollIndicator:NO];
//    [self.editHabitTableViewController.tableView setShowsVerticalScrollIndicator:NO];
//    self.editHabitTableViewController.parent = self;
    
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
