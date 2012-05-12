#import <objc/runtime.h>
#import "User.h"
#import "Profile.h"

@implementation User

+ (User *)userWithEmail:(NSString *)email password:(NSString *)password andProfile:(Profile *)profile {
    User *user = [[[User alloc] initWithClassName:[self tableName]] autorelease];
    user.email = email;
    user.password = password;
    user.profile = profile;
    return user;
}

- (NSString *)email {
    return [self objectForKey:FIELD_EMAIL];
}

- (void)setEmail:(NSString *)email {
    [self setObject:email forKey:FIELD_EMAIL];
}

- (NSString *)password {
    return [self objectForKey:FIELD_PASSWORD];
}

- (void)setPassword:(NSString *)password {
    [self setObject:password forKey:FIELD_PASSWORD];
}

- (Profile *)profile {
    Profile *profile = (Profile *)[[self objectForKey:FIELD_PROFILE] fetchIfNeeded];
    object_setClass(profile, [Profile class]);
    return profile;
}

- (void)setProfile:(Profile *)profile {
    [self setObject:profile forKey:FIELD_PROFILE];
}

@end