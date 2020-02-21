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

@interface EditHabitTableViewController ()
@end

@implementation EditHabitTableViewController

- (id) init {
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.clearsSelectionOnViewWillAppear = YES;
    [self.tableView setDelegate:self];
    self.tableView.alwaysBounceVertical = NO;
    self.tableView.scrollEnabled = NO;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 18)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, tableView.frame.size.width, 18)];
    [label setFont:[UIFont boldSystemFontOfSize:12]];
    [view setBackgroundColor:[UIColor clearColor]];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EditHabitTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"editHabitViewCell" forIndexPath:indexPath];
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
        case 3: {
            cell.mainLabel.text = @"Reminder";
            break;
        }
        case 4: {
            cell.mainLabel.text = @"Integration";
            break;
        }
        default:
            break;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 88;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    EditHabitPropertyController* alert = [EditHabitPropertyController alertControllerWithTitle:@"My Alert"
                                message:@"This is an alert."
                                preferredStyle:UIAlertControllerStyleAlert];
    alert.parent = self;
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
           case 3: {
               break;
           }
           case 4: {
               break;
           }
           default:
               break;
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
