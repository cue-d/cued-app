//
//  SingleHabitViewController.h
//  cued
//
//  Created by Katherine Lu on 2020-02-19.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditHabitTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SingleHabitViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *routineLabel;
@property (weak, nonatomic) NSString *routine;
@property (strong, nonatomic) EditHabitTableViewController *editHabitTableViewController;
@property (weak, nonatomic) IBOutlet UITableView *singleHabitInfoView;



@end

NS_ASSUME_NONNULL_END
