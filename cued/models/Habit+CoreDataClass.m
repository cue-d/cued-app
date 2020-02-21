//
//  Habit+CoreDataClass.m
//  cued
//
//  Created by Tyler Zhang on 2020-02-19.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//
//

#import "Habit+CoreDataClass.h"
#import "AppDelegate.h"

@implementation Habit

NSString * const ROUTINE_PREVIOUS = @"routine_previous";
NSString * const CUE = @"cue";
NSString * const REWARD = @"reward";
NSString * const ROUTINE = @"routine";

+ (NSArray *) getAllHabits {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *moc = [appDelegate getContext];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Habit"];
     
    NSError *error = nil;
    NSArray * habits = [moc executeFetchRequest:request error:&error];
    if (!habits) {
        NSLog(@"Error fetching Habit objects: %@\n%@", [error localizedDescription], [error userInfo]);
    }
    return habits;
}

+ (Habit *) createHabitFromDictionary:(NSDictionary *) habitInfo {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate getContext];
    Habit *habitEntity = [NSEntityDescription insertNewObjectForEntityForName:@"Habit" inManagedObjectContext:context];
    habitEntity.cue = [habitInfo valueForKey:CUE];
    habitEntity.reward = [habitInfo valueForKey:REWARD];
    habitEntity.routine_previous = [habitInfo valueForKey:ROUTINE_PREVIOUS];
    habitEntity.routine = [habitInfo valueForKey:ROUTINE];
    [appDelegate saveContext];
    return habitEntity;
}

@end
