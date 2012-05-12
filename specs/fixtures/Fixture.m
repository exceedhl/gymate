#import "Fixture.h"
#import "Workout.h"
#import "User.h"
#import "Plan.h"

@implementation Fixture
@synthesize adam, planOfAdam, workoutShoulderPress, workoutPushup, workoutTreadmill;

- (id)init {
    self = [super init];
    if (self) {
        [Parse setApplicationId:@"vHejG6VviEbZmluhw9H8Z3BwdOL3IfDrxmRF70eb"
                      clientKey:@"NP1GdDSDXSN1oi7YyBTL7BDVpczqLbAEuJqww56N"];
    }
    return self;
}

+ (Fixture *)fixture {
    return [[[Fixture alloc] init] autorelease];
}

- (void)createWorkouts {
    [[Workout withName:@"Push up"] save];
    [[Workout withName:@"Shoulder Press"] save];
    [[Workout withName:@"Treadmill"] save];
}

- (void)destroyObjects:(NSString *)className {
    PFQuery *q = [PFQuery queryWithClassName:className];
    [[q findObjects] $each:^(id plan) {
        [plan delete];
    }];
}

- (void)createPlans {
    planOfAdam = [Plan planWithUser:adam];
    [planOfAdam.workouts addObject:workoutShoulderPress];
    [planOfAdam.workouts addObject:workoutPushup];
    [planOfAdam.workouts addObject:workoutTreadmill];
    [planOfAdam save];
}

- (void)createData {
    [self createUsers];
    [self createWorkouts];
    [self createPlans];
}

- (void)destroyAllData {
    [self destroyObjects:[Plan tableName]];
    [self destroyObjects:[Workout tableName]];
//    [self destroyUsers];
}

- (void)dealloc {
    [workoutShoulderPress release];
    [workoutPushup release];
    [workoutTreadmill release];
    [adam release];
    [planOfAdam release];
    [super dealloc];
}

@end
