//
//  Habit+CoreDataProperties.h
//  cued
//
//  Created by Justin Pezzack on 3/1/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//
//

#import "Habit+CoreDataClass.h"
#import "Reminder+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface Habit (CoreDataProperties)

+ (NSFetchRequest<Habit *> *)fetchRequest;

@property (nonatomic) BOOL active;
@property (nonatomic) int16_t completeCount;
@property (nullable, nonatomic, copy) NSString *cue;
@property (nullable, nonatomic, copy) NSString *id;
@property (nullable, nonatomic, copy) NSString *reward;
@property (nullable, nonatomic, copy) NSString *routine;
@property (nullable, nonatomic, copy) NSString *routine_previous;
@property (nullable, nonatomic, retain) NSSet<Reminder *> *habitToReminder;

@end

@interface Habit (CoreDataGeneratedAccessors)
- (void)addHabitToReminderObject:(Reminder *)value;
- (void)removeHabitToReminderObject:(Reminder *)value;
- (void)addHabitToReminder:(NSSet<Reminder *> *)values;
- (void)removeHabitToReminder:(NSSet<Reminder *> *)values;

@end

NS_ASSUME_NONNULL_END
