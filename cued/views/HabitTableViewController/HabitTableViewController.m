//
//  HabitTableViewController.m
//  cued
//
//  Created by Justin Pezzack on 2/2/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import "HabitTableViewController.h"
#import "HabitTableViewCell.h"
#import "singleHabitViewController.h"
#import "AppDelegate.h"
#import "Habit+CoreDataProperties.h"

@interface HabitTableViewController ()
@end

@implementation HabitTableViewController

- (id) init {
    [self queryForHabits];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.clearsSelectionOnViewWillAppear = YES;
    [self.tableView setDelegate:self];
}

- (void)queryForHabits {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *moc = [appDelegate getContext];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Habit"];
     
    NSError *error = nil;
    self.habitsFromDatabase = [moc executeFetchRequest:request error:&error];
    if (!self.habitsFromDatabase) {
        NSLog(@"Error fetching Habit objects: %@\n%@", [error localizedDescription], [error userInfo]);
    }
    
    if (self.habitsFromDatabase.count == 0) {
        self.tableView.hidden = YES;
    } else {
        self.tableView.hidden = NO;
    }
    self.displayedItems = [[NSArray alloc]initWithArray:self.habitsFromDatabase];
    [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [self queryForHabits];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.displayedItems.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 18)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, tableView.frame.size.width, 18)];
    [label setFont:[UIFont boldSystemFontOfSize:12]];
    [view setBackgroundColor:[UIColor clearColor]];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HabitTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Habit *currentHabit = (Habit *)[self.displayedItems objectAtIndex:indexPath.section];
    cell.routineLabel.text = currentHabit.routine;
    cell.cueLabel.text = currentHabit.cue;
    cell.rewardLabel.text = currentHabit.reward;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HabitTableViewCell * cell = [self.tableView cellForRowAtIndexPath:indexPath];
    SingleHabitViewController * shv = [[SingleHabitViewController alloc]initWithNibName:@"SingleHabitViewController" bundle:nil];
    shv.routine = cell.routineLabel.text;
    shv.habit = [self.displayedItems objectAtIndex:indexPath.section];
    [self.parent.navigationController pushViewController:shv animated:YES];
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

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
