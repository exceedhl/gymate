#import <objc/runtime.h>
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
    object_setClass(pfUser, [User class]);  
    [pfUser setFirstName:[pfUser objectForKey:@"firstName"]];
    [pfUser setLastName:[pfUser objectForKey:@"lastName"]];
    [pfUser setGender:[pfUser objectForKey:@"gender"]];
    return pfUser;
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
