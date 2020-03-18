//
//  ManageRemindersTableViewController.m
//  cued
//
//  Created by Justin Pezzack on 3/7/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//
#import "Reminder+CoreDataClass.h"
#import "ManageRemindersTableViewController.h"

@interface ManageRemindersTableViewController ()

@end

@implementation ManageRemindersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.reminders = [Reminder getAllReminders];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.reminders count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.reminders objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
