#import <objc/runtime.h>
#import <Parse/Parse.h>
#import "User.h"
#import "NSString+Gymate.h"

@implementation User

+ (id)user
{
    PFUser *user = [super user];
    object_setClass(user, [User class]);
    return user;
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

- (void)validate
{
    [$arr(@"firstName", @"lastName", @"email") $each:^(id key) {
        NSString *value = [self objectForKey:key];
        if (!value || [value isEmpty]) {
            @throw [NSException exceptionWithName:@"Signup failed" reason:[NSString stringWithFormat:@"%@ should not be empty", [key lowercaseString]] userInfo:nil];
        }
    }];
}

- (void)signUp
{
    self.username = self.email;
    [self validate];
    NSError *error = nil;
    if (![super signUp:&error]) {
        @throw [NSException exceptionWithName:@"Signup failed" reason:[error.userInfo objectForKey:@"error"] userInfo:nil];
    }
}

@end
