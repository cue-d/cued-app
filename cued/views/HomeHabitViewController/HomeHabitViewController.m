//
//  HomeHabitViewController.m
//  cued
//
//  Created by Katherine Lu on 2020-02-18.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import "HomeHabitViewController.h"
#import "UserInfoViewController.h"
#import "ChooseHabitViewController.h"
#import "AppDelegate.h"

@interface HomeHabitViewController ()

@end

@implementation HomeHabitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.habitTableViewController = [[HabitTableViewController alloc]init];
    self.habitTableViewController.tableView = self.habitTableView;
    [self.habitTableView registerNib:[UINib nibWithNibName:@"HabitTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.habitTableViewController.tableView setShowsHorizontalScrollIndicator:NO];
    [self.habitTableViewController.tableView setShowsVerticalScrollIndicator:NO];
    [self.habitSearchBar setDelegate:self];
    self.habitTableViewController.parent = self;
}

- (void)addHabit {
    
}

- (IBAction)addHabitButtonPressed:(id)sender {
//    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    NSManagedObjectContext *context = [appDelegate getContext];
//    Habit *habitEntity = nil;
//    habitEntity = [NSEntityDescription insertNewObjectForEntityForName:@"Habit" inManagedObjectContext:context];
//    habitEntity.cue = @"TEST CUE";
//    habitEntity.reward = @"TEST REWARD";
//    habitEntity.routine_previous = @"TEST ROUTINE PREVIOUS";
//    habitEntity.routine = @"TEST ROUTINE";
//    [appDelegate saveContext];
//    NSLog(@"FAKE DATA ADDED");
//    [self.habitTableViewController queryForHabits];
//    [self filterTable:self.habitSearchBar.text];
    ChooseHabitViewController * vc = [[ChooseHabitViewController alloc]initWithNibName:@"ChooseHabitViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)userImageButtonWasPressed:(id)sender {
     UserInfoViewController * vc = [[UserInfoViewController alloc]initWithNibName:@"UserInfoViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)filterTable:(NSString *)searchText {
    if ([searchText isEqualToString:@""]) {
        self.habitTableView.hidden = NO;
        self.habitTableViewController.displayedItems = self.habitTableViewController.habitsFromDatabase;
    } else {
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.routine contains[c] %@", searchText];
        self.habitTableViewController.displayedItems = [self.habitTableViewController.
                                                        habitsFromDatabase filteredArrayUsingPredicate:predicate];
        if (self.habitTableViewController.displayedItems.count == 0) {
            self.habitTableView.hidden = YES;
        } else {
            self.habitTableView.hidden = NO;
        }
    }
     [self.habitTableViewController.tableView reloadData];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self filterTable:searchText];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

@end
