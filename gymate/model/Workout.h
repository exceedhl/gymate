#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "BaseObject.h"

@class Plan;

@interface Workout : BaseObject

#define FIELD_NAME @"name"
#define FIELD_BODY_PART @"bodyPart"
#define FIELD_TYPE @"type"
#define FIELD_WEIGHT @"weight"
#define FIELD_SET @"set"
#define FIELD_REPEAT @"repeat"

+ (Workout *)workoutWithName:(NSString *)name andType:(NSString *)type andBodyPart:(NSString *)bodyPart andWeight:(NSUInteger)weight andSet:(NSUInteger)set andRepeat:(NSUInteger)repeat;

- (NSString *)name;
- (void)setName:(NSString *)name;
- (NSString *)bodyPart;
- (void)setBodyPart:(NSString *)bodyPart;
- (NSString *)type;
- (void)setType:(NSString *)type;
- (NSUInteger)weight;
- (void)setWeight:(NSUInteger)weight;
- (NSUInteger)set;
- (void)setSet:(NSUInteger)set;
- (NSUInteger)repeat;
- (void)setRepeat:(NSUInteger)repeat;

@end
