#import <objc/runtime.h>
#import "PlanWorkout.h"
#import "Workout.h"
#import "Plan.h"


@implementation PlanWorkout
@synthesize plan, workout;

+ (PlanWorkout *)planWorkoutWithPlan:(Plan *)aPlan andWorkout:(Workout *)aWorkout {
    PlanWorkout *pw = (PlanWorkout *) [PFObject objectWithClassName:[self tableName]];
    object_setClass(pw, [self class]);
    pw.plan = aPlan;
    pw.workout = aWorkout;
    return pw;
}

- (void)dealloc {
    [plan release];
    [workout release];
    [super dealloc];
}
@end