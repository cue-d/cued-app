//
//  Habit+CoreDataProperties.m
//  cued
//
//  Created by Justin Pezzack on 3/1/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//
//

#import "Habit+CoreDataProperties.h"

@implementation Habit (CoreDataProperties)

+ (NSFetchRequest<Habit *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Habit"];
}

@dynamic active;
@dynamic completeCount;
@dynamic cue;
@dynamic id;
@dynamic reward;
@dynamic routine;
@dynamic routine_previous;
@dynamic habitToReminder;

@end
