//
//  HabitTableViewController.h
//  cued
//
//  Created by Justin Pezzack on 2/2/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HabitTableViewController : UITableViewController
@property (strong, nonatomic) NSArray *displayedItems;
@property (strong, nonatomic) UIViewController *parent;
@end

NS_ASSUME_NONNULL_END
