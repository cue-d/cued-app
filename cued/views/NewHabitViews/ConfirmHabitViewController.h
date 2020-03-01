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
@property (strong, nonatomic) NSMutableDictionary *habitInfo;
@property (weak, nonatomic) IBOutlet UILabel *habitLabel;

@end

NS_ASSUME_NONNULL_END
