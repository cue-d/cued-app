//
//  Habit+CoreDataProperties.m
//  cued
//
//  Created by Tyler Zhang on 2020-02-19.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//
//

#import "Habit+CoreDataProperties.h"

@implementation Habit (CoreDataProperties)

+ (NSFetchRequest<Habit *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Habit"];
}
@dynamic cue;
@dynamic routine;
@dynamic routine_previous;
@dynamic reward;
@dynamic completeCount;
@dynamic active;

@end
