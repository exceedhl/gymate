#import <objc/runtime.h>
#import "Workout.h"

@implementation Workout

+ (Workout *)workoutWithName:(NSString *)name {
    Workout *workout = (Workout *) [PFObject objectWithClassName:[self tableName]];
    object_setClass(workout, [self class]);
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
