#import "Workout.h"

@implementation Workout

+ (Workout *)workoutWithName:(NSString *)name andType:(NSString *)type andBodyPart:(NSString *)bodyPart andWeight:(NSUInteger)weight andSet:(NSUInteger)set andRepeat:(NSUInteger)repeat {
    Workout *workout = [super basicPFObject];
    workout.name = name;
    workout.bodyPart = bodyPart;
    workout.type = type;
    workout.weight = weight;
    workout.set = set;
    workout.repeat = repeat;
    return workout;
}

- (NSString *)name {
    return [self objectForKey:FIELD_NAME];
}

- (void)setName:(NSString *)name {
    [self setObject:name forKey:FIELD_NAME];
}

- (NSString *)bodyPart {
    return [self objectForKey:FIELD_BODY_PART];
}

- (void)setBodyPart:(NSString *)bodyPart {
    [self setObject:bodyPart forKey:FIELD_BODY_PART];
}

- (NSString *)type {
    return [self objectForKey:FIELD_TYPE];
}

- (void)setType:(NSString *)type {
    [self setObject:type forKey:FIELD_TYPE];
}

- (NSUInteger)weight {
    return [[self objectForKey:FIELD_WEIGHT] unsignedIntegerValue];
}

- (void)setWeight:(NSUInteger)weight {
    [self setObject:[NSNumber numberWithUnsignedInteger:weight] forKey:FIELD_WEIGHT];
}

- (NSUInteger)set {
    return [[self objectForKey:FIELD_SET] unsignedIntegerValue];
}

- (void)setSet:(NSUInteger)set {
    [self setObject:[NSNumber numberWithUnsignedInteger:set] forKey:FIELD_SET];
}

- (NSUInteger)repeat {
    return [[self objectForKey:FIELD_REPEAT] unsignedIntegerValue];
}

- (void)setRepeat:(NSUInteger)repeat {
    [self setObject:[NSNumber numberWithUnsignedInteger:repeat] forKey:FIELD_REPEAT];
}


@end
