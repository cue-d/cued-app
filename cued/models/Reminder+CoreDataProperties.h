//
//  Reminder+CoreDataProperties.h
//  cued
//
//  Created by Justin Pezzack on 3/1/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//
//

#import "Reminder+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Reminder (CoreDataProperties)

+ (NSFetchRequest<Reminder *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *dateTime;
@property (nullable, nonatomic, copy) NSString *text;
@property (nullable, nonatomic, retain) Habit *reminderToHabit;

@end

NS_ASSUME_NONNULL_END
