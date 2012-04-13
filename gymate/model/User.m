#import <objc/runtime.h>
#import <Parse/Parse.h>
#import "User.h"


@implementation User

+ (id)user
{
    return [[User alloc] init];
}

+ (id)logInWithEmail:(NSString *)email password:(NSString *)password
{
    PFUser *user = [PFUser logInWithUsername:email password:password];
    object_setClass(user, [User class]);
    return user;
}

- (NSString *)firstName
{
    return [self objectForKey:@"firstName"];
}

- (void)setFirstName:(NSString *)firstName
{
    [self setObject:firstName forKey:@"firstName"];
}

- (NSString *)lastName
{
    return [self objectForKey:@"lastName"];
}

- (void)setLastName:(NSString *)lastName
{
    [self setObject:lastName forKey:@"lastName"];
}

- (NSNumber *)gender
{
    return [self objectForKey:@"gender"];
}

- (void)setGender:(NSNumber *)gender
{
    [self setObject:gender forKey:@"gender"];
}

- (BOOL)signUp
{
    self.username = self.email;
    return [super signUp];
}

@end
