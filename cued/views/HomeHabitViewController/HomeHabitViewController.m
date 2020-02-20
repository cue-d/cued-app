//
//  HomeHabitViewController.m
//  cued
//
//  Created by Katherine Lu on 2020-02-18.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import "HomeHabitViewController.h"
#import "UserInfoViewController.h"
#import "AppDelegate.h"

@interface HomeHabitViewController ()

@end

@implementation HomeHabitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.habitTableViewController = [[HabitTableViewController alloc]init];
    self.habitTableViewController.tableView = self.habitTableView;
    [self.habitTableViewController.tableView registerNib:[UINib nibWithNibName:@"HabitTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.habitTableViewController.tableView setShowsHorizontalScrollIndicator:NO];
    [self.habitTableViewController.tableView setShowsVerticalScrollIndicator:NO];
    [self.habitSearchBar setDelegate:self];
    self.habitTableViewController.parent = self;
}
- (void)addHabit {
    
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
        self.habitTableView.hidden = YES;
    } else {
        self.habitTableView.hidden = NO;
    }
    [self.habitTableViewController.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [self queryForHabits];
}
- (IBAction)addHabitButtonPressed:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate getContext];
    Habit *habitEntity = nil;
    habitEntity = [NSEntityDescription insertNewObjectForEntityForName:@"Habit" inManagedObjectContext:context];
    habitEntity.cue = @"TEST CUE";
    habitEntity.reward = @"TEST REWARD";
    habitEntity.routine_previous = @"TEST ROUTINE PREVIOUS";
    habitEntity.routine = @"TEST ROUTINE";
    [appDelegate saveContext];
    NSLog(@"FAKE DATA ADDED");
    [self queryForHabits];
}

- (IBAction)userImageButtonWasPressed:(id)sender {
     UserInfoViewController * vc = [[UserInfoViewController alloc]initWithNibName:@"UserInfoViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if ([searchText isEqualToString:@""]) {
        self.habitTableViewController.displayedItems = self.habitsFromDatabase;
        self.habitTableView.hidden = NO;
    } else {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@", searchText];
        self.habitTableViewController.displayedItems = [self.habitsFromDatabase filteredArrayUsingPredicate:predicate];
        if (self.habitTableViewController.displayedItems.count == 0) {
            self.habitTableView.hidden = YES;
        } else {
            self.habitTableView.hidden = NO;
        }
    }
    [self.habitTableViewController.tableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

@end
