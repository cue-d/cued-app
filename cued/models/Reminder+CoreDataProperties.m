//
//  Reminder+CoreDataProperties.m
//  cued
//
//  Created by Justin Pezzack on 3/1/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//
//

#import "Reminder+CoreDataProperties.h"

@implementation Reminder (CoreDataProperties)

+ (NSFetchRequest<Reminder *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Reminder"];
}

@dynamic dateTime;
@dynamic text;
@dynamic reminderToHabit;

@end
