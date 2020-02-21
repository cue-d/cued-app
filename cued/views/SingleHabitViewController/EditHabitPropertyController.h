//
//  EditHabitPropertyController.h
//  cued
//
//  Created by Justin Pezzack on 2/21/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Habit+CoreDataProperties.h"

NS_ASSUME_NONNULL_BEGIN

@interface EditHabitPropertyController : UIAlertController
@property (strong, nonatomic) Habit * habit;
@property (strong, nonatomic) NSString * key;
@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) UITableViewController *parent;
@end

NS_ASSUME_NONNULL_END
