#import "Fixture.h"
#import "Workout.h"
#import "User.h"
#import "Plan.h"
#import "Profile.h"

@implementation Fixture
@synthesize adam, planOfAdam, workoutShoulderPress, workoutPushup, workoutTreadmill;
@synthesize userWithoutPlan;


- (id)init {
    self = [super init];
    if (self) {
        [Parse setApplicationId:@"RnbpEr08FdfSvrU3fSgAdxmeZVYwb564Be7zgqtX"
                      clientKey:@"5oJ1BnjClfxsuKiu7XZrMybe52Tuv2As9Fmx7SgO"];
    }
    return self;
}

+ (Fixture *)fixture {
    return [[[Fixture alloc] init] autorelease];
}

- (Fixture *)createUsers {
    Profile *profile = [Profile profileWithFirstName:@"Adam" lastName:@"Smith" height:@"180" weight:@"78" andGender:[NSNumber numberWithInt:0]];
    adam = [User userWithEmail:@"adam@smith.com" password:@"abc123" andProfile:profile];
    adam.profile = profile;
    [adam signUp];
    [adam setPlan:planOfAdam];
    [adam save];

    userWithoutPlan = [User userWithEmail:@"some@one.com" password:@"whatever" andProfile:nil];
    [userWithoutPlan save];

    return self;
}

- (Fixture *)createWorkouts {
    workoutPushup = [Workout workoutWithName:@"Push up"];
    [workoutPushup save];
    workoutShoulderPress = [Workout workoutWithName:@"Shoulder Press"];
    [workoutShoulderPress save];
    workoutTreadmill = [Workout workoutWithName:@"Treadmill"];
    [workoutTreadmill save];
    return self;
}

- (Fixture *)createPlans {
    planOfAdam = [Plan plan];
    [planOfAdam addWorkout:workoutPushup];
    [planOfAdam addWorkout:workoutShoulderPress];
    [planOfAdam addWorkout:workoutTreadmill];
    [planOfAdam save];
    return self;
}

- (Fixture *)createData {
    [self createWorkouts];
    [self createPlans];
    [self createUsers];
    return self;
}

- (Fixture *)destroyObjects:(NSString *)className {
    PFQuery *q = [PFQuery queryWithClassName:className];
    [[q findObjects] $each:^(id plan) {
        [plan delete];
    }];
    return self;
}

- (Fixture *)destroyAllData {
    [self destroyObjects:[Profile tableName]];
    [self destroyObjects:[User tableName]];
    [self destroyObjects:[Plan tableName]];
    [self destroyObjects:[Workout tableName]];
    return self;
}

@end
