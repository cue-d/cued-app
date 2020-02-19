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
@property (strong, nonatomic) NSMutableArray *dummyItems;
@property (strong, nonatomic) NSArray *displayedItems;
@end

NS_ASSUME_NONNULL_END
