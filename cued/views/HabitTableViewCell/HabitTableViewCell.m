//
//  HabitTableViewCell.m
//  cued
//
//  Created by Justin Pezzack on 2/2/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import "HabitTableViewCell.h"

@implementation HabitTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundView.layer.cornerRadius = 8;
    self.backgroundView.layer.masksToBounds = YES;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
