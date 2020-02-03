//
//  Habit+CoreDataProperties.h
//  cued
//
//  Created by Justin Pezzack on 2/2/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//
//

#import "Habit+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Habit (CoreDataProperties)

+ (NSFetchRequest<Habit *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *cue;
@property (nullable, nonatomic, copy) NSString *reward;
@property (nullable, nonatomic, copy) NSString *routine_alt;
@property (nullable, nonatomic, copy) NSString *routine_base;

@end

NS_ASSUME_NONNULL_END
