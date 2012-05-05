#import "UserFixture.h"
#import "User.h"

@implementation UserFixture

- (User *)adam
{
    User *u = [User user];
    u.email = @"adam@smith.com";
    u.password = @"letmein";
    u.firstName = @"Adam";
    u.lastName = @"Smith";
    u.height = @"180";
    u.weight = @"78";
    u.gender = [NSNumber numberWithInt:0];
    return u;
}

+ (id)fixture
{
    UserFixture *uf = [[[UserFixture alloc] init] autorelease];
    return uf;
}

@end
