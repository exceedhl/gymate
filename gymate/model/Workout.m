#import "Workout.h"

@implementation Workout

+ (Workout *)workoutWithName:(NSString *)name {
    Workout *workout = [super basicPFObject];
    workout.name = name;
    return workout;
}

- (NSString *)name {
    return [self objectForKey:FIELD_NAME];
}

- (void)setName:(NSString *)name {
    [self setObject:name forKey:FIELD_NAME];
}

@end
