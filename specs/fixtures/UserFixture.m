#import "UserFixture.h"
#import "User.h"

@implementation UserFixture
@synthesize user;

+ (void)deleteAll
{
    PFQuery *q = [PFQuery queryForUser];
    NSArray *users = [q findObjects];
    for (PFUser *user in users) {
        [PFUser logInWithUsername:user.username password:user.password];
        [user delete];
    }
}

+ (id)fixture
{
    [self deleteAll];
    UserFixture *uf = [[[UserFixture alloc] init] autorelease];
    User *user = [User user];
    user.firstName = @"Adam";
    user.lastName = @"Smith";
    user.gender = [NSNumber numberWithInt:0];
    user.email = @"adam@smith.com";
    user.password = @"letmein";
    [user signUp];
    uf.user = user;
    return uf;
}

- (void)dealloc
{
    [self.user release];
    [super dealloc];
}
@end
