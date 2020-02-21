//
//  Habit+CoreDataClass.h
//  cued
//
//  Created by Tyler Zhang on 2020-02-19.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Habit : NSManagedObject
+ (NSArray *) getAllHabits;
+ (Habit *) createHabitFromDictionary:(NSDictionary *) habitInfo;

extern NSString * const ROUTINE_PREVIOUS;
extern NSString * const CUE;
extern NSString * const REWARD;
extern NSString * const ROUTINE;

@end

NS_ASSUME_NONNULL_END

#import "Habit+CoreDataProperties.h"
