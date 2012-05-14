#import <Foundation/Foundation.h>
#import "BaseObject.h"

@class Profile, Plan;

@interface User : BaseObject

+ (User *)userWithEmail:(NSString *)username password:(NSString *)password andProfile:(Profile *)profile;
+ (User *)loggedInUser;
+ (id)loginWithEmail:(NSString *)email andPassword:(NSString *)password;

-(NSString *)email;
-(void)setEmail:(NSString *)email;
-(NSString *)password;
-(void)setPassword:(NSString *)password;
-(Profile *)profile;
-(void)setProfile:(Profile *)profile;
- (Plan *)plan;
-(void)setPlan:(Plan *)plan;
- (void)signUp;


@end