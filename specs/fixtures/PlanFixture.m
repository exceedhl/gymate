#import "PlanFixture.h"
#import "Plan.h"
#import "User.h"


@implementation PlanFixture

+ (Plan *)planWithoutWorkouts {
    return [Plan planWithUser:[User loggedInUser] andWorkout:[NSNull null]];
}

@end