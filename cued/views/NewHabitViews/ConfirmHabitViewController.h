//
//  ConfirmHabitViewController.h
//  cued
//
//  Created by Justin Pezzack on 2/1/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Habit+CoreDataProperties.h"
#import "HomeHabitViewController.h"
#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface ConfirmHabitViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *cueTextfield;
@property (weak, nonatomic) IBOutlet UILabel *routineTextfield;
@property (weak, nonatomic) IBOutlet UILabel *previousRoutineTextfield;
@property (weak, nonatomic) IBOutlet UILabel *rewardTextfield;
@property (strong, nonatomic) NSMutableDictionary *habitInfo;

@end

NS_ASSUME_NONNULL_END
