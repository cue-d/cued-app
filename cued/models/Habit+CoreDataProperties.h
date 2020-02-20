//
//  Habit+CoreDataProperties.h
//  cued
//
//  Created by Tyler Zhang on 2020-02-19.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//
//

#import "Habit+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Habit (CoreDataProperties)

+ (NSFetchRequest<Habit *> *)fetchRequest;
@property (nullable, nonatomic, copy) NSString *cue;
@property (nullable, nonatomic, copy) NSString *routine;
@property (nullable, nonatomic, copy) NSString *routine_previous;
@property (nullable, nonatomic, copy) NSString *reward;
@property (nonatomic) int16_t completeCount;
@property (nonatomic) BOOL active;

@end

NS_ASSUME_NONNULL_END
