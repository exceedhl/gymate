#import <objc/runtime.h>
#import "Plan.h"
#import "User.h"

@implementation Plan

+ (Plan *)planWithUser:(User *)user andWorkout:(Workout *)workout {
    Plan *plan = (Plan *) [Plan objectWithClassName:[self tableName]];
    object_setClass(plan, [self class]);
    plan.user = user;
    [plan addWorkout:workout];
    return plan;
}

+ (Plan *)findPlanForUser:(User *)user {
    PFQuery *query = [PFQuery queryWithClassName:[Plan tableName]];
    [query whereKey:FIELD_USER equalTo:user];
    Plan *plan = (Plan *)[query getFirstObject];
    if (plan) {
        object_setClass(plan, [Plan class]);
        return plan;
    }
    return nil;
}

- (void)addWorkout:(Workout *)workout {
    if ([self workouts]) {
        [[self workouts] addObject:workout];
    } else {
        [self setWorkouts:$marr(workout)];
    }
    [self save];
}

#pragma mark getter / setter

- (User *)user {
    return [self objectForKey:FIELD_USER];
}

- (void)setUser:(User *)user {
    [self setObject:user forKey:FIELD_USER];
}

- (NSArray *)workouts {
    return [self objectForKey:FIELD_WORKOUTS];
}

- (void)setWorkouts:(NSArray *)workouts {
    [self setObject:workouts forKey:FIELD_WORKOUTS];
}

@end
