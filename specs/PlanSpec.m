#import "Fixture.h"
#import "BaseFixture.h"
#import "User.h"
#import "Profile.h"
#import "Plan.h"
#import "Workout.h"
#import "UserFixture.h"
#import "PlanFixture.h"

SPEC_BEGIN(PlanSpec)

describe(@"Plan", ^{

    beforeAll(^{
        [BaseFixture destroyAll:$arr([User tableName], [Profile tableName], [Plan tableName], [Workout tableName])];
        [[UserFixture user] signUp];
    });

    it(@"should be able to create plan for user", ^{
        [[PlanFixture planWithoutWorkouts] save];
    });

    it(@"should return nil if user has no plan", ^{
        [[Plan findPlanForUser:[User loggedInUser]] shouldBeNil];
    });

    it(@"should find plan for user", ^{
        [[PlanFixture planWithoutWorkouts] save];
        [[Plan findPlanForUser:[User loggedInUser]] shouldNotBeNil];
    });

    it(@"should be able to add workout", ^{
        Workout *treadmill = [Workout workoutWithName:@"Treadmill"];
        [treadmill save];
        Plan *plan = [Plan planWithUser:[User loggedInUser] andWorkout:treadmill];

        Workout *pushup = [Workout workoutWithName:@"Pushup"];
        [pushup save];
        [plan addWorkout:pushup];

        __block NSArray *existingWorkouts = $arr(treadmill.objectId, pushup.objectId);
        [[[Plan findPlanForUser:[User loggedInUser]] workouts] $each:^(Workout *workout){
            [[existingWorkouts should] contain:workout.objectId];
        }];
    });
});

SPEC_END