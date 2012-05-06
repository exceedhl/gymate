#import <objc/runtime.h>
#import "Plan.h"
#import "User.h"
#import "Workout.h"
#import "PlanWorkout.h"

@implementation Plan
@synthesize user, workouts;

+ (Plan *)planWithUser:(User *)user {
    Plan *plan = (Plan *) [Plan objectWithClassName:[self tableName]];
    object_setClass(plan, [self class]);
    plan.user = user;
    return plan;
}

- (void)dealloc {
    [user release];
    [workouts release];
    [super dealloc];
}

@end
