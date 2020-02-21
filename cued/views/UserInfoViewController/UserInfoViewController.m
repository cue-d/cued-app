//
//  UserInfoViewController.m
//  cued
//
//  Created by Justin Pezzack on 2/19/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import "UserInfoViewController.h"
#import "UserTableCellController.h"

@interface UserInfoViewController ()

@end

@implementation UserInfoViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UserTableCellController *cell = [tableView dequeueReusableCellWithIdentifier:@"userCell"];
    if (!cell) {
        cell = [[UserTableCellController alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"userCell"];
    }
    switch (indexPath.section) {
        case 0: {
            cell.textLabel.text = @"Email";
            cell.detailTextLabel.text = @"katherine@me.com";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        }
        case 1: {
            cell.textLabel.text = @"Reminders";
            UISwitch *reminderSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
            cell.accessoryView = reminderSwitch;
            [reminderSwitch setOn:NO];
            break;
        }
        default: {
            break;
        }
    }
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.profileImage setImage:[UIImage imageNamed:@"IMG_2226.jpg"]];
    self.profileImage.layer.cornerRadius = (self.profileImage.frame.size.width / 2);
    self.profileImage.clipsToBounds = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
}

-(void)onTapBack:(UIBarButtonItem*)item{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                         forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;

    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.currentUser = [CuedUser createOrGetUserFromDictionary:@{@"id": appDelegate.currentUserID}];
    self.familyNameLabel.text = [NSString stringWithFormat:@"%@ %@", self.currentUser.givenName, self.currentUser.familyName];
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
