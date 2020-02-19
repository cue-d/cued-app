//
//  CuedUser+CoreDataProperties.m
//  cued
//
//  Created by Tyler Zhang on 2020-02-19.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//
//

#import "CuedUser+CoreDataProperties.h"

@implementation CuedUser (CoreDataProperties)

+ (NSFetchRequest<CuedUser *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"CuedUser"];
}

@dynamic id;
@dynamic email;
@dynamic givenName;
@dynamic familyName;

@end
