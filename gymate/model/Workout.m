#import <objc/runtime.h>
#import "Workout.h"
#import "Plan.h"

@implementation Workout

@synthesize name;

+ (Workout *)withName:(NSString *)string {
    Workout *workout = (Workout *) [PFObject objectWithClassName:[self tableName]];
    object_setClass(workout, [self class]);
    workout.name = string;
    return workout;
}

- (void)dealloc {
    [name release];
    [super dealloc];
}
@end
