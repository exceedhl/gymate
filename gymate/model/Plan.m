#import "Plan.h"

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

- (NSArray *)workouts {
    return [self objectForKey:FIELD_WORKOUTS];
}

- (void)setWorkouts:(NSArray *)workouts {
    [self setObject:workouts forKey:FIELD_WORKOUTS];
}

@end
