#import "UserFixture.h"
#import "User.h"
#import "Profile.h"
#import "ProfileFixture.h"

@implementation UserFixture

+ (User *)user {
    Profile *profile = [ProfileFixture profile];
    User *user = [User userWithEmail:@"adam@smith.com" password:@"abc123" andProfile:profile];
    user.profile = profile;
    return user;
}
@end
