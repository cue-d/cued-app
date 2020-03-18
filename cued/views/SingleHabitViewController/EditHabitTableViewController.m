//
//  HabitTableViewController.m
//  cued
//
//  Created by Justin Pezzack on 2/2/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import "EditHabitTableViewController.h"
#import "EditHabitTableViewCell.h"
#import "EditHabitPropertyController.h"
#import "Reminder+CoreDataClass.h"
#import "ReminderTableViewController.h"

@interface EditHabitTableViewController ()
@end

@implementation EditHabitTableViewController

- (id) init {
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.reminders = [Reminder getAllReminders];
    self.clearsSelectionOnViewWillAppear = YES;
    [self.tableView setDelegate:self];
    self.tableView.alwaysBounceVertical = YES;
    self.tableView.scrollEnabled = YES;
}

#pragma mark - Table view dwata source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0)
        return 3;
    return [self.reminders count] + 1;
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 18)];
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, tableView.frame.size.width, 18)];
//    [label setFont:[UIFont boldSystemFontOfSize:12]];
//    [view setBackgroundColor:[UIColor clearColor]];
//    return view;
//}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, tableView.frame.size.width, 18)];
    [label setFont:[UIFont boldSystemFontOfSize:14]];
    if (section == 0) {
        label.text = @"Habit Information";
    } else {
        label.text = @"Reminders";
    }
    
    [headerView addSubview:label];
    [headerView setBackgroundColor:[UIColor systemFillColor]];
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EditHabitTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"editHabitViewCell" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        switch (indexPath.row) {
               case 0: {
                   cell.mainLabel.text = @"Cue";
                   cell.subLabel.text = self.habit.cue;
                   break;
               }
               case 1: {
                   cell.mainLabel.text = @"Reward";
                   cell.subLabel.text = self.habit.reward;
                   break;
               }
               case 2: {
                   cell.mainLabel.text = @"Streak";
                   cell.subLabel.text = [NSString stringWithFormat:@"%d", self.habit.completeCount];
                   break;
               }
                default:
                   break;
           }
    } else if (indexPath.section == 1) {
        if (indexPath.row == [self.reminders count]) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
            [button addTarget:self action:@selector(transitionToNewReminder) forControlEvents:UIControlEventTouchUpInside];
            cell.accessoryView  = button;
            [cell.mainLabel setHidden:YES];
        }
        [cell.subLabel setHidden:YES];
    }
   
    return cell;
}
- (void)transitionToNewReminder {
    NSLog(@"BLESSED");
    ReminderTableViewController * st = [[ReminderTableViewController alloc]initWithNibName:@"ReminderTableViewController" bundle:nil];
    [self.parent.navigationController pushViewController:st animated:YES];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return @"Reminders";
    }
    return @"";
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    EditHabitPropertyController* alert = [EditHabitPropertyController alertControllerWithTitle:@"My Alert"
                                message:@"This is an alert."
                                preferredStyle:UIAlertControllerStyleAlert];
    alert.parent = self;
    if (indexPath.section == 0) {
        switch (indexPath.row) {
              case 0: {
                  alert.key = @"cue";
                  alert.habit = self.habit;
                  [self presentViewController:alert animated:YES completion:nil];
                  break;
              }
              case 1: {
                  alert.key = @"reward";
                  alert.habit = self.habit;
                  [self presentViewController:alert animated:YES completion:nil];
                  break;
              }
              case 2: {
                  break;
              }
              default:
                  break;
          }
    }

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
