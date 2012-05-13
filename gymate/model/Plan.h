#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "BaseObject.h"

@class User, Workout;

@interface Plan : BaseObject

#define FIELD_USER @"user"
#define FIELD_WORKOUTS @"workouts"

+ (Plan *)planWithUser:(User *)user andWorkout:(Workout *)workout;
+ (Plan *)findPlanForUser:(User *)user;

- (User *)user;
- (void)setUser:(User *)user;
- (NSMutableArray *)workouts;
- (void)setWorkouts:(NSMutableArray *)workouts;

- (void)addWorkout:(Workout *)workout;
@end
