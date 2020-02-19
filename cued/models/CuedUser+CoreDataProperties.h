//
//  CuedUser+CoreDataProperties.h
//  cued
//
//  Created by Tyler Zhang on 2020-02-19.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//
//

#import "CuedUser+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface CuedUser (CoreDataProperties)

+ (NSFetchRequest<CuedUser *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *id;
@property (nullable, nonatomic, copy) NSString *email;
@property (nullable, nonatomic, copy) NSString *givenName;
@property (nullable, nonatomic, copy) NSString *familyName;

@end

NS_ASSUME_NONNULL_END
