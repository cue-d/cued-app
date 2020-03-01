//
//  CuedUser+CoreDataProperties.m
//  cued
//
//  Created by Justin Pezzack on 3/1/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//
//

#import "CuedUser+CoreDataProperties.h"

@implementation CuedUser (CoreDataProperties)

+ (NSFetchRequest<CuedUser *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"CuedUser"];
}

@dynamic email;
@dynamic familyName;
@dynamic givenName;
@dynamic id;

@end
