//
//  EditHabitTableViewController.h
//  cued
//
//  Created by Justin Pezzack on 2/20/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Habit+CoreDataProperties.h"
NS_ASSUME_NONNULL_BEGIN


@interface EditHabitTableViewController : UITableViewController
@property (weak, nonatomic) Habit * habit;
@end

NS_ASSUME_NONNULL_END
