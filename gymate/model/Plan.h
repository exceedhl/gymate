#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "BaseObject.h"

@class User, Workout;

@interface Plan : BaseObject

#define FIELD_WORKOUTS @"workouts"

+ (Plan *)plan;

- (NSMutableArray *)workouts;
- (void)setWorkouts:(NSMutableArray *)workouts;

- (void)addWorkout:(Workout *)workout;
@end
