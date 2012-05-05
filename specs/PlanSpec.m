#import "User.h"
#import "Plan.h"
#import "Workout.h"
#import "UserFixture.h"

SPEC_BEGIN(PlanSpec)

describe(@"Plan", ^{
    
    __block UserFixture *users = nil;
    
    
    beforeAll(^{
        users = [UserFixture fixture];
    });
    
    it(@"should find the plan for a user", ^{
        Plan *p = [users.adam plan];
        NSArray *workouts = [p workouts];
        [[workouts should] haveCountOf:2];
        [[[[workouts objectAtIndex:0] name] should] equal:@"Shoulder Press"];
        [[[[workouts objectAtIndex:1] name] should] equal:@"Pushup"];
    });
});

SPEC_END