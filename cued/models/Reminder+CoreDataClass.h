//
//  Reminder+CoreDataClass.h
//  cued
//
//  Created by Justin Pezzack on 3/1/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Habit;

NS_ASSUME_NONNULL_BEGIN

@interface Reminder : NSManagedObject
+ (NSArray *) getAllReminders;
- (NSSet<__kindof NSManagedObject *> *)deleteFromCoreData;
+ (Reminder *) createReminderFromDictionary:(NSDictionary *) reminderInfo;
- (void) registerWithNotificationCenter;
@end

NS_ASSUME_NONNULL_END

#import "Reminder+CoreDataProperties.h"
