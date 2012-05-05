#import "Plan.h"
#import "User.h"

@implementation Plan
@synthesize user;

+ (Plan *)planWithUser:(User *)user {
    Plan *plan = [[[Plan alloc] init] autorelease];
    plan.user = user;
    return plan;
}

- (NSArray *)workouts
{
    return nil;
}

- (void)dealloc {
    [user release];
    [super dealloc];
}
@end
