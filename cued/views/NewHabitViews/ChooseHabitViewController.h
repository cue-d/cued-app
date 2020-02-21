//
//  firstViewController.h
//  cued
//
//  Created by Justin Pezzack on 2/1/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChooseCueViewController.h"
#import "HomeHabitViewController.h"
#import "Habit+CoreDataProperties.h"
#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChooseHabitViewController : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) Habit *habitEntity;

@end

NS_ASSUME_NONNULL_END
