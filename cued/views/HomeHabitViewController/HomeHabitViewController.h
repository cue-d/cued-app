//
//  HomeHabitViewController.h
//  cued
//
//  Created by Katherine Lu on 2020-02-18.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HabitTableViewController.h"
#import "Habit+CoreDataProperties.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeHabitViewController : UIViewController<UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UITableView *habitTableView;
@property (strong, nonatomic) HabitTableViewController *habitTableViewController;
@property (weak, nonatomic) IBOutlet UIButton *AddHabitButton;
@property (weak, nonatomic) IBOutlet UISearchBar *habitSearchBar;
@property (weak, nonatomic) IBOutlet UIButton *userProfileButton;
@property (strong, nonatomic) NSArray * habitsFromDatabase;

@end;

NS_ASSUME_NONNULL_END
