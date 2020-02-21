//
//  EditHabitTableViewCell.h
//  cued
//
//  Created by Justin Pezzack on 2/20/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EditHabitTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;
@property (weak, nonatomic) IBOutlet UILabel *subLabel;

@end

NS_ASSUME_NONNULL_END
