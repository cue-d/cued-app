//
//  AppDelegate.h
//  cued
//
//  Created by Justin Pezzack on 1/17/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentCloudKitContainer *persistentContainer;

- (void)saveContext;

- (NSManagedObjectContext *)getContext;

@end

