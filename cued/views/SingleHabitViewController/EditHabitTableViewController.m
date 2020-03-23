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
#import "AppDelegate.h"

@interface EditHabitTableViewController ()
@end

@implementation EditHabitTableViewController

- (id) init {
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.reminders = [[NSMutableArray alloc]initWithCapacity:16];
    self.clearsSelectionOnViewWillAppear = YES;
    [self.tableView setDelegate:self];
    self.tableView.alwaysBounceVertical = YES;
    self.tableView.scrollEnabled = YES;
}

-(void) viewWillAppear:(BOOL)animated {
    self.reminders = [Reminder getAllReminders];
    [self.tableView reloadData];
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

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1 && indexPath.row != [self.reminders count]) {
        return UITableViewCellEditingStyleDelete;
    }
    return UITableViewCellEditingStyleNone;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1 && indexPath.row != [self.reminders count]) {
        Reminder * r = [self.reminders objectAtIndex: indexPath.row];
        NSMutableArray * localCopy = (NSMutableArray *)[self.reminders mutableCopy];
        [localCopy removeObjectAtIndex:indexPath.row];
        self.reminders = localCopy;
        [r deleteFromCoreData];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView reloadData];
    }
}

-(void) incrementStreak {
    self.habit.completeCount += 1;
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate saveContext];
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EditHabitTableViewCell *cell = [[EditHabitTableViewCell alloc]init];
    if (indexPath.section == 0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        switch (indexPath.row) {
               case 0: {
                   cell.textLabel.text = [@"Cue - " stringByAppendingString:self.habit.cue];
                   cell.subLabel.text = self.habit.cue;
                   break;
               }
               case 1: {
                   cell.textLabel.text = [@"Reward - " stringByAppendingString:self.habit.reward];
                   cell.subLabel.text = self.habit.reward;
                   break;
               }
               case 2: {
                   cell.textLabel.text = [@"Streak - " stringByAppendingString:[NSString stringWithFormat:@"%d", self.habit.completeCount]];
                   cell.subLabel.text = [NSString stringWithFormat:@"%d", self.habit.completeCount];
                   UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
                   [button addTarget:self action:@selector(incrementStreak) forControlEvents:UIControlEventTouchUpInside];
                   cell.accessoryView  = button;
                   break;
               }
                default:
                   break;
           }
    } else if (indexPath.section == 1) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (indexPath.row == [self.reminders count]) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
            [button addTarget:self action:@selector(transitionToNewReminder) forControlEvents:UIControlEventTouchUpInside];
            cell.accessoryView  = button;
            [cell.mainLabel setHidden:YES];
        } else {
            Reminder * r = [self.reminders objectAtIndex:indexPath.row];
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"HH:mm"];
            cell.textLabel.text = [formatter stringFromDate:r.dateTime];
        }
        [cell.subLabel setHidden:YES];
    }
   
    return cell;
}
- (void)transitionToNewReminder {
    ReminderTableViewController * st = [[ReminderTableViewController alloc]initWithNibName:@"ReminderTableViewController" bundle:nil];
    st.habit = self.habit;
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
