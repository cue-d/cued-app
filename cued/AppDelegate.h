//
//  AppDelegate.h
//  cued
//
//  Created by Justin Pezzack on 1/17/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <UserNotifications/UserNotifications.h>

extern NSString* const setCurrentIdentifier;

@interface AppDelegate : UIResponder <UIApplicationDelegate, UNUserNotificationCenterDelegate>

@property (readonly, strong) NSPersistentCloudKitContainer *persistentContainer;
@property (strong, nonatomic) NSString *currentUserID;

- (void)saveContext;

- (NSManagedObjectContext *)getContext;

@end

