#import "UserFixture.h"
#import "User.h"

@implementation UserFixture

- (User *)user
{
    User *u = [User user];
    u.email = @"adam@smith.com";
    u.password = @"letmein";
    u.firstName = @"Adam";
    u.lastName = @"Smith";
    u.gender = [NSNumber numberWithInt:0];
    return u;
}

+ (id)fixture
{
    UserFixture *uf = [[[UserFixture alloc] init] autorelease];
    return uf;
}

- (void)dealloc
{
    [self.user release];
    [super dealloc];
}
@end
