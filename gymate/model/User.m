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

+ (User *)currentUser {
    PFUser *user = [super currentUser];
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

- (NSString *)height
{
    return [self objectForKey:@"height"];
}

- (void)setHeight:(NSString *)height
{
    [self setObject:height forKey:@"height"];
}

- (NSString *)weight
{
    return [self objectForKey:@"weight"];
}

- (void)setWeight:(NSString *)weight
{
    [self setObject:weight forKey:@"weight"];
}

- (NSString *)email
{
    return [self objectForKey:@"email"];
}

- (void)setEmail:(NSString *)anEmail
{
    [self setObject:anEmail forKey:@"email"];
}

- (NSString *)passwd
{
    return [self objectForKey:@"passwd"];
}

- (void)setPasswd:(NSString *)aPassword
{
    [self setObject:aPassword forKey:@"passwd"];
    super.password = aPassword;
}

- (void)validate
{
    [$arr(@"email", @"passwd", @"firstName", @"lastName", @"height", @"weight") $each:^(id key) {
        NSString *value = [self objectForKey:key];
        if (!value || [(NSString *)value isEmpty]) {
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

- (Plan *)plan
{
    return nil;
}

@end
