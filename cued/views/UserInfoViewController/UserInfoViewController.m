//
//  UserInfoViewController.m
//  cued
//
//  Created by Justin Pezzack on 2/19/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import "UserInfoViewController.h"

@interface UserInfoViewController ()

@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationBar* navbar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, 50)];

    UINavigationItem* navItem = [[UINavigationItem alloc] initWithTitle:@"Profile"];
    navItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(onTapBack:)];
    
    [navbar setItems:@[navItem]];
    [self.view addSubview:navbar];
    
    [self.profileImage setImage:[UIImage imageNamed:@"IMG_2227.jpg"]];
//    self.profileImage.layer.masksToBounds = true;
    self.profileImage.layer.cornerRadius = (self.profileImage.frame.size.width / 2);
    self.profileImage.clipsToBounds = YES;
    
}

-(void)onTapBack:(UIBarButtonItem*)item{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar setHidden:NO];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.currentUser = [CuedUser createOrGetUserFromDictionary:@{@"id": appDelegate.currentUserID}];
    self.familyNameLabel.text = [NSString stringWithFormat:@"%@ %@", self.currentUser.givenName, self.currentUser.familyName];
}

- (void) viewWillDisappear:(BOOL)animated {
    [self.navigationController.navigationBar setHidden:YES];
}

- (IBAction)logoutClicked:(id)sender {
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.currentUserID = @"";
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:setCurrentIdentifier];
    NSString *domainName = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:domainName];

    [self.navigationController popToRootViewControllerAnimated:YES];
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
