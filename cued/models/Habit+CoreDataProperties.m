//
//  Habit+CoreDataProperties.m
//  cued
//
//  Created by Justin Pezzack on 2/2/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//
//

#import "Habit+CoreDataProperties.h"

@implementation Habit (CoreDataProperties)

+ (NSFetchRequest<Habit *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Habit"];
}

@dynamic cue;
@dynamic reward;
@dynamic routine_alt;
@dynamic routine_base;

@end
