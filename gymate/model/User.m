#import <Parse/Parse.h>
#import "User.h"

@implementation User
@synthesize firstName, lastName, gender;

+ (id)user
{
    return [[[User alloc] init] autorelease];
}

+ (id)userWithPFUser:(PFUser *)pfUser
{
    User *user = (User *)pfUser;
    user.firstName = [pfUser objectForKey:@"firstName"];
    user.lastName = [pfUser objectForKey:@"lastName"];
    user.email = [pfUser objectForKey:@"email"];
    return user;
}

+ (User *)logInWithEmail:(NSString *)email password:(NSString *)password
{
    PFUser *user = [PFUser logInWithUsername:email password:password];
    return [User userWithPFUser:user];
}

- (BOOL)signUp
{
    self.username = self.email;
    [self setObject:self.firstName forKey:@"firstName"];
    [self setObject:self.lastName forKey:@"lastName"];
    [self setObject:self.gender forKey:@"gender"];
    return [super signUp];
}

- (void)dealloc
{
    [firstName release];
    [lastName release];
    [gender release];
    [super dealloc];
}

@end
