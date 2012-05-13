#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "BaseObject.h"

@class Plan;

@interface Workout : BaseObject

#define FIELD_NAME @"name"

+ (Workout *)workoutWithName:(NSString *)name;

- (NSString *)name;
- (void)setName:(NSString *)name;
@end
