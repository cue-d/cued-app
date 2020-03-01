//
//  CuedUser+CoreDataProperties.h
//  cued
//
//  Created by Justin Pezzack on 3/1/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//
//

#import "CuedUser+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface CuedUser (CoreDataProperties)

+ (NSFetchRequest<CuedUser *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *email;
@property (nullable, nonatomic, copy) NSString *familyName;
@property (nullable, nonatomic, copy) NSString *givenName;
@property (nullable, nonatomic, copy) NSString *id;

@end

NS_ASSUME_NONNULL_END
