//
//  UserInfoViewController.m
//  cued
//
//  Created by Justin Pezzack on 2/19/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import "UserInfoViewController.h"
#import "AppDelegate.h"
#import "CuedUser+CoreDataProperties.h"

@interface UserInfoViewController ()

@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar setHidden:NO];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate getContext];
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"CuedUser"];

    NSError *error;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    CuedUser *userEntity = nil;
    if ([matches count]) {
       //Returns the existing object
        userEntity = [matches firstObject];
    }
    if (![userEntity.familyName isEqualToString:@""]) {
        self.familyNameLabel.text = userEntity.familyName;
    }
}

- (void) viewWillDisappear:(BOOL)animated {
    [self.navigationController.navigationBar setHidden:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
