//
//  AppDelegate.h
//  cued
//
//  Created by Justin Pezzack on 1/17/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "CuedUser+CoreDataClass.h"

extern NSString* const setCurrentIdentifier;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentCloudKitContainer *persistentContainer;
@property (strong, nonatomic) CuedUser *currentUser;

- (void)saveContext;

- (NSManagedObjectContext *)getContext;

@end

