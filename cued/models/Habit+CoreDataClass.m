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
@end
