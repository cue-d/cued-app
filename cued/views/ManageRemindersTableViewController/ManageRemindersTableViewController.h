//
//  ManageRemindersTableViewController.h
//  cued
//
//  Created by Justin Pezzack on 3/7/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import "Habit+CoreDataProperties.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ManageRemindersTableViewController : UITableViewController
@property (weak, nonatomic) Habit * habit;
@property (strong, nonatomic) NSArray * reminders;

@end

NS_ASSUME_NONNULL_END
