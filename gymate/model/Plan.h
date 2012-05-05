#import <Foundation/Foundation.h>

@class User;

@interface Plan : NSObject

@property(nonatomic, retain) User *user;

+ (Plan *)planWithUser:(User *)user;

- (NSArray *)workouts;

@end
