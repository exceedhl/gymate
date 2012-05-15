#import "Fixture.h"
#import "User.h"
#import "Plan.h"
#import "Workout.h"

SPEC_BEGIN(PlanSpec)

describe(@"Plan", ^{

    __block Fixture *f;

    beforeAll(^{
        f = [Fixture fixture];
        [[f destroyAllData] createData];
    });

    it(@"should be able to create plan for user", ^{
        User *user = [User userWithEmail:@"user@whatever.com" password:@"whatever" andProfile:nil];
        [user save];
        [[user plan] shouldBeNil];
        Plan *plan = [Plan plan];
        [user setPlan:plan];
        [user save];
        [user fetch];
        [[user plan] shouldNotBeNil];
    });

    it(@"should return nil if user has no plan", ^{
        [[f.userWithoutPlan plan] shouldBeNil];
    });

    it(@"should find plan for user", ^{
        Plan *plan = [f.adam plan];
        [plan shouldNotBeNil];
        [[[plan should] have:3] workouts];
    });

    it(@"should be able to add workout", ^{
        Workout *running = [Workout workoutWithName:@"Running"];
        [running save];
        [[f.adam plan] addWorkout:running];
        [[[[f.adam plan] should] have:4] workouts];
    });
});

SPEC_END