//
//  HomeHabitViewController.m
//  cued
//
//  Created by Katherine Lu on 2020-02-18.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import "HomeHabitViewController.h"
#import "UserInfoViewController.h"

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
    // pass habitTableView a reference to self
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)userImageButtonWasPressed:(id)sender {
     UserInfoViewController * vc = [[UserInfoViewController alloc]initWithNibName:@"UserInfoViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if ([searchText isEqualToString:@""]) {
        self.habitTableViewController.displayedItems = self.habitTableViewController.dummyItems;
        self.habitTableView.hidden = NO;
    } else {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@", searchText];
        self.habitTableViewController.displayedItems = [self.habitTableViewController.dummyItems filteredArrayUsingPredicate:predicate];    
        if (self.habitTableViewController.displayedItems.count == 0) {
            self.habitTableView.hidden = YES;
        } else {
            self.habitTableView.hidden = NO;
        }
    }
    [self.habitTableViewController.tableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
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
