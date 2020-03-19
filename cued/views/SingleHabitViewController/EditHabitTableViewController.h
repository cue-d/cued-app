//
//  EditHabitTableViewController.h
//  cued
//
//  Created by Justin Pezzack on 2/20/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Habit+CoreDataProperties.h"
#import "SingleHabitViewController.h"
NS_ASSUME_NONNULL_BEGIN


@interface EditHabitTableViewController : UITableViewController
@property (weak, nonatomic) Habit * habit;
@property (strong, nonatomic) NSArray * reminders;
@property (weak, nonatomic) SingleHabitViewController * parent;
@end

NS_ASSUME_NONNULL_END
