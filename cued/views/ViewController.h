//
//  ViewController.h
//  ObjectiveC_Check
//
//  Created by Karthikeyan A. on 02/10/19.
//  Copyright © 2019 Karthikeyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AuthenticationServices/AuthenticationServices.h>
#import "AppDelegate.h"
#import "CuedUser+CoreDataClass.h"
#import "Habit+CoreDataClass.h"
#import "ChooseHabitViewController.h"
#import "HabitTableViewController.h"
#import "OnboardingViewController.h"
#import "HomeHabitViewController.h"


@interface ViewController : UIViewController<ASAuthorizationControllerDelegate,ASAuthorizationControllerPresentationContextProviding>


@property (nonatomic, strong) UITextView *appleIDLoginInfoTextView;
@property (weak, nonatomic) IBOutlet UIButton *testButton;


@end

