#import <Foundation/Foundation.h>

@class User;


@interface SecurityHelper : NSObject

+ (id)loginWithEmail:(NSString *)email andPassword:(NSString *)password;
+ (void)signUp:(User *)user;
+ (BOOL)isUserLoggedIn;
+ (User *)loggedInUser;

@end