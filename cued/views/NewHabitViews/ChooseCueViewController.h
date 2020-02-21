//
//  ChooseCueViewController.h
//  cued
//
//  Created by Justin Pezzack on 2/1/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeHabitViewController.h"
#import "ChooseRewardViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChooseCueViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) NSMutableDictionary *habitInfo;

@end

NS_ASSUME_NONNULL_END
