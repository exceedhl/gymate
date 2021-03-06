#import <objc/runtime.h>
#import "Plan.h"
#import "Workout.h"
#import "CKMacros.h"
#import "CKAdditions.h"

@implementation Plan

+ (Plan *)plan {
    Plan *plan = [super basicPFObject];
    return plan;
}

- (void)addWorkout:(Workout *)workout {
    if ([self workouts]) {
        [[self workouts] addObject:workout];
    } else {
        [self setWorkouts:$marr(workout)];
    }
    [self save];
}

- (NSMutableArray *)workouts {
    NSMutableArray *workouts = [self objectForKey:FIELD_WORKOUTS];
    [workouts $each:^(Workout *workout) {
        [workout fetchIfNeeded];
        object_setClass(workout, [Workout class]);
    }];
    return workouts;
}

- (void)setWorkouts:(NSArray *)workouts {
    [self setObject:workouts forKey:FIELD_WORKOUTS];
}

@end
