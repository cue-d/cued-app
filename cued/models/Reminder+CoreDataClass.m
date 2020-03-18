//
//  Reminder+CoreDataClass.m
//  cued
//
//  Created by Justin Pezzack on 3/1/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//
//

#import "Reminder+CoreDataClass.h"
#import "AppDelegate.h"
@implementation Reminder

+ (NSArray *) getAllReminders {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *moc = [appDelegate getContext];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Reminder"];
     
    NSError *error = nil;
    NSArray * reminders = [moc executeFetchRequest:request error:&error];
    if (!reminders) {
        NSLog(@"Error fetching Habit objects: %@\n%@", [error localizedDescription], [error userInfo]);
    }
    return reminders;
}

+ (Reminder *) createReminderFromDictionary:(NSDictionary *) reminderInfo {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate getContext];
    Reminder *reminderEntity = [NSEntityDescription insertNewObjectForEntityForName:@"Reminder" inManagedObjectContext:context];
    reminderEntity.dateTime = [reminderInfo valueForKey:@"dateTime"];
    reminderEntity.reminderToHabit = [reminderInfo valueForKey:@"habit"];
    reminderEntity.text = [reminderInfo valueForKey:@"text"];
    [reminderEntity registerWithNotificationCenter];
    [appDelegate saveContext];
    return reminderEntity;
}

- (void) registerWithNotificationCenter {
    UNUserNotificationCenter* center = [UNUserNotificationCenter currentNotificationCenter];
    [center requestAuthorizationWithOptions:
            (UNAuthorizationOptionAlert +
             UNAuthorizationOptionSound)
      completionHandler:^(BOOL granted, NSError * _Nullable error) {
         // Enable or disable features based on authorization.
       
    }];
    
    UNMutableNotificationContent* content = [[UNMutableNotificationContent alloc] init];
    content.title = [NSString localizedUserNotificationStringForKey:self.text arguments:nil];
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:(NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:self.dateTime];

    UNCalendarNotificationTrigger* trigger = [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:components repeats:YES];
                                                
    UNNotificationRequest* request = [UNNotificationRequest
          requestWithIdentifier:[[NSUUID UUID] UUIDString] content:content trigger:trigger];

    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
       if (error != nil) {
          NSLog(@"%@", error.localizedDescription);
       }
    }];
    self.identifier = request.identifier;
}

- (NSSet<__kindof NSManagedObject *> *)deleteFromCoreData {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate getContext];
    [context deleteObject:self];
    [appDelegate saveContext];
    return [context deletedObjects];
}

@end
