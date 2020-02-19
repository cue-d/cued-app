//
//  HabitTableViewCell.h
//  cued
//
//  Created by Justin Pezzack on 2/2/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HabitTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *routineLabel;
@property (weak, nonatomic) IBOutlet UILabel *cueLabel;
@property (weak, nonatomic) IBOutlet UILabel *rewardLabel;


@end

NS_ASSUME_NONNULL_END
