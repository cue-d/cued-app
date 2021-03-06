//
//  UserInfoViewController.h
//  cued
//
//  Created by Justin Pezzack on 2/19/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "CuedUser+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserInfoViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) CuedUser *currentUser;
@property (weak, nonatomic) IBOutlet UILabel *familyNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;

@end

NS_ASSUME_NONNULL_END
