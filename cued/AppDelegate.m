//
//  AppDelegate.m
//  cued
//
//  Created by Justin Pezzack on 1/17/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import "AppDelegate.h"
#import "Reminder+CoreDataClass.h"

NSString* const setCurrentIdentifier = @"setCurrentIdentifier";

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UNUserNotificationCenter* center = [UNUserNotificationCenter currentNotificationCenter];
    [center requestAuthorizationWithOptions:
             (UNAuthorizationOptionAlert +
              UNAuthorizationOptionSound)
       completionHandler:^(BOOL granted, NSError * _Nullable error) {
          // Enable or disable features based on authorization.
    }];
    
    /* On app launch check to make sure all reminders in data base are registered */
    NSArray * myReminders = [Reminder getAllReminders];
    [[UNUserNotificationCenter currentNotificationCenter] getPendingNotificationRequestsWithCompletionHandler:^(NSArray<UNNotificationRequest *> *requests) {
            for (id reminder in myReminders) {
                Reminder * thisReminder = (Reminder*) reminder;
                bool isRegistered = NO;
                for (id r in requests) {
                    UNNotificationRequest * request = (UNNotificationRequest *) r;
                    if (request.identifier == thisReminder.notifId) {
                        isRegistered = YES;
                        break;
                    }
                }
                if (isRegistered == NO) {
                    [reminder registerWithNotificationCenter];
                }
            }
    }];
    
    return YES;
}

#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentCloudKitContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentCloudKitContainer alloc] initWithName:@"cued"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (NSManagedObjectContext *)getContext {
    NSLog(@"Get Context: %@", self.persistentContainer.debugDescription);
    return self.persistentContainer.viewContext;
}

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
    NSLog(@"Saved Something");
}

@end
