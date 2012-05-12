#import <Foundation/Foundation.h>
#import "BaseObject.h"

@class Profile;

@interface User : BaseObject

#define FIELD_EMAIL @"email"
#define FIELD_PASSWORD @"password"
#define FIELD_PROFILE @"profile"

-(NSString *)email;
-(void)setEmail:(NSString *)email;
-(NSString *)password;
-(void)setPassword:(NSString *)password;
-(Profile *)profile;
-(void)setProfile:(Profile *)profile;

+ (User *)userWithEmail:(NSString *)username password:(NSString *)password andProfile:(Profile *)profile;

@end