#import <Foundation/Foundation.h>
#import "BaseObject.h"

@class Profile;

@interface User : BaseObject

#define FIELD_EMAIL @"email"
#define FIELD_PASSWORD @"password"
#define FIELD_PROFILE @"profile"

+ (User *)userWithEmail:(NSString *)username password:(NSString *)password andProfile:(Profile *)profile;
+ (User *)loggedInUser;
+ (id)loginWithEmail:(NSString *)email andPassword:(NSString *)password;

-(NSString *)email;
-(void)setEmail:(NSString *)email;
-(NSString *)password;
-(void)setPassword:(NSString *)password;
-(Profile *)profile;
-(void)setProfile:(Profile *)profile;
- (void)signUp;

@end