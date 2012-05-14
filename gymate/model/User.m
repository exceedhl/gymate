#import <objc/runtime.h>
#import "User.h"
#import "Profile.h"
#import "Preferences.h"
#import "NSString+Gymate.h"
#import "Plan.h"

@interface User()

- (void)validate;
- (void)validateMandatoryFields;
- (void)validateEmail;

@end

#define FIELD_EMAIL @"email"
#define FIELD_PASSWORD @"password"
#define FIELD_PROFILE @"profile"
#define FIELD_PLAN @"plan"

#define LOGIN_FAILED_EXCEPTION @"Login failed"
#define LOGIN_FAILED_INCORRECT_USERNAME_AND_PASSWORD @"Incorrect username or password"
#define SIGNUP_FAILED_EXCEPTION @"Signup failed"
#define SIGNUP_FAILED_EMPTY_FIELD @"%@ should not be empty"
#define SIGNUP_FAILED_DUPLICATE_EMAIL @"Email %@ is already taken"
#define SIGNUP_FAILED_INVALID_REQUEST @"Validation request failed"

@implementation User

+ (User *)userWithEmail:(NSString *)email password:(NSString *)password andProfile:(Profile *)profile {
    User *user = [[[User alloc] initWithClassName:[self tableName]] autorelease];
    user.email = email;
    user.password = password;
    user.profile = profile;
    return user;
}

+ (User *)loggedInUser {
    NSString *userId = [Preferences getPreference:PREF_LOGGED_IN_USER_ID];
    if (userId) {
        PFQuery *query = [PFQuery queryWithClassName:[User tableName]];
        [query whereKey:FIELD_OBJECT_ID equalTo:userId];
        User *user = (User *)[query getFirstObject];
        object_setClass(user, [User class]);
        return user;
    }
    return nil;
}

+ (User *)loginWithEmail:(NSString *)email andPassword:(NSString *)password {
    PFQuery *query = [PFQuery queryWithClassName:[User tableName]];
    [query whereKey:FIELD_EMAIL equalTo:email];
    [query whereKey:FIELD_PASSWORD equalTo:password];
    User *user = (User *)[query getFirstObject];
    object_setClass(user, [User class]);
    if (user) {
        [Preferences setPreferences:$dict(user.objectId, PREF_LOGGED_IN_USER_ID)];
    } else {
        @throw [NSException exceptionWithName:LOGIN_FAILED_EXCEPTION reason:LOGIN_FAILED_INCORRECT_USERNAME_AND_PASSWORD userInfo:nil];
    }
    return user;
}

- (void)signUp {
    [self validate];
    [self.profile save];
    [self save];
    [Preferences setPreferences:$dict(self.objectId, PREF_LOGGED_IN_USER_ID)];
}

#pragma getters / setters

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
    Profile *profile = (Profile *)[self objectForKey:FIELD_PROFILE];
    if ([profile isEqual:[NSNull null]]) {
        return nil;
    }
    [profile fetchIfNeeded];
    object_setClass(profile, [Profile class]);
    return profile;
}

- (void)setProfile:(Profile *)profile {
    [self setObject:profile forKey:FIELD_PROFILE];
}

- (Plan *)plan {
    Plan *plan = (Plan *)[self objectForKey:FIELD_PLAN];
    if ([plan isEqual:[NSNull null]]) {
        return nil;
    }
    [plan fetchIfNeeded];
    object_setClass(plan, [Plan class]);
    return plan;
}

- (void)setPlan:(Plan *)plan {
    [self setObject:plan forKey:FIELD_PLAN];
}

#pragma private methods

- (void)validate {
    [self validateMandatoryFields];
    [self validateEmail];
}

- (void)validateMandatoryFields {
    [$arr(FIELD_EMAIL, FIELD_PASSWORD) $each:^(id key) {
        NSString *value = [self performSelector:NSSelectorFromString(key)];
        if (!value || [value isEmpty]) {
            @throw [NSException exceptionWithName:SIGNUP_FAILED_EXCEPTION reason:$str(SIGNUP_FAILED_EMPTY_FIELD, [key lowercaseString]) userInfo:nil];
        }
    }];
    [$arr(FIELD_FIRST_NAME, FIELD_LAST_NAME, FIELD_HEIGHT, FIELD_WEIGHT) $each:^(id key) {
        NSString *value = [self.profile performSelector:NSSelectorFromString(key)];
        if (!value || [value isEmpty]) {
            @throw [NSException exceptionWithName:SIGNUP_FAILED_EXCEPTION reason:$str(SIGNUP_FAILED_EMPTY_FIELD, [key lowercaseString]) userInfo:nil];
        }
    }];
}

- (void)validateEmail {
    PFQuery *query = [PFQuery queryWithClassName:[User tableName]];
    [query whereKey:FIELD_EMAIL equalTo:self.email];
    NSError *error = nil;
    int count = [query countObjects:&error];
    if (!error) {
        if (count > 0) {
            @throw [NSException exceptionWithName:SIGNUP_FAILED_EXCEPTION reason:$str(SIGNUP_FAILED_DUPLICATE_EMAIL, self.email) userInfo:nil];
        }
    } else {
        @throw [NSException exceptionWithName:SIGNUP_FAILED_EXCEPTION reason:SIGNUP_FAILED_INVALID_REQUEST userInfo:error.userInfo];
    }
}



@end