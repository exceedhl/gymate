#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "BaseObject.h"

@class User, Workout;

@interface Plan : BaseObject

@property(nonatomic, retain) User *user;
@property(nonatomic, retain) NSMutableArray *workouts;

+ (Plan *)planWithUser:(User *)user;

@end
