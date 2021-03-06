//
//  CuedUser+CoreDataClass.h
//  cued
//
//  Created by Tyler Zhang on 2020-02-19.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface CuedUser : NSManagedObject

+ (CuedUser *) createOrGetUserFromDictionary:(NSDictionary *)userInfo;

@end

NS_ASSUME_NONNULL_END

#import "CuedUser+CoreDataProperties.h"
