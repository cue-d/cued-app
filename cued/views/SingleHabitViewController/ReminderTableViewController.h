//
//  ReminderTableViewController.h
//  cued
//
//  Created by Justin Pezzack on 3/18/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reminder+CoreDataClass.h"
#import "Habit+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface ReminderTableViewController : UITableViewController
@property (strong, nonatomic) UIDatePicker *datePicker;
@property (nonatomic) bool showPicker;
@property (nonatomic) Habit * habit;
@end

NS_ASSUME_NONNULL_END
