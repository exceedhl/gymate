#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "BaseObject.h"

@class Plan;

@interface Workout : BaseObject

@property (nonatomic, retain) NSString *name;

+ (Workout *)withName:(NSString *)string;
@end
