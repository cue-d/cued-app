//
//  CuedUser+CoreDataClass.m
//  cued
//
//  Created by Tyler Zhang on 2020-02-19.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//
//

#import "CuedUser+CoreDataProperties.h"

@implementation CuedUser

+ (CuedUser *)createOrGetUserFromDictionary:(NSDictionary *)userInfo {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate getContext];
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"CuedUser"];
    NSString *user = [userInfo valueForKey:@"id"];
    [request setPredicate:[NSPredicate predicateWithFormat:@"id == %@", user]];

    NSError *error;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    CuedUser *userEntity = nil;
    
    if (error) {
        NSLog(@"Error getting user with id %@, error message: %@", user, error.localizedDescription);
    }else if ([matches count]) {
        //Returns the existing object
        userEntity = [matches firstObject];
    } else {
        //Create a new Object
        userEntity = [NSEntityDescription insertNewObjectForEntityForName:@"CuedUser" inManagedObjectContext:context];
        userEntity.id = user;
        userEntity.givenName = [userInfo valueForKey:@"givenName"];
        userEntity.familyName = [userInfo valueForKey:@"familyName"];
        userEntity.email = [userInfo valueForKey:@"email"];
        //Save user to core data
        [appDelegate saveContext];
    }
    appDelegate.currentUserID = user;
    return userEntity;
}

@end
