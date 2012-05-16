#import <objc/runtime.h>
#import "User.h"
#import "Profile.h"
#import "Preferences.h"
#import "NSString+Gymate.h"
#import "Plan.h"

@interface User ()

- (void)validate;

- (void)validateMandatoryFields;

- (void)validateEmail;

@end

#define FIELD_EMAIL @"email"
#define FIELD_PASSWORD @"password"
#define FIELD_PROFILE @"profile"
#define FIELD_PLAN @"plan"

#define LOGIN_FAILED_EXCEPTION @"Login failed"
#define ERROR_MSG_INCORRECT_USERNAME_AND_PASSWORD @"Incorrect username or password"

#define ERROR_MSG_DUPLICATE_EMAIL @"Email %@ is already taken"
#define ERROR_MSG_INVALID_REQUEST @"Validation request failed"

@implementation User

+ (User *)userWithEmail:(NSString *)email password:(NSString *)password andProfile:(Profile *)profile {
    User *user = [super basicPFObject];
    user.email = email;
    user.password = password;
    user.profile = profile;
    user.plan = nil;
    return user;
}

+ (User *)loggedInUser {
    NSString *userId = [Preferences getPreference:PREF_LOGGED_IN_USER_ID];
    if (userId) {
        return [self findById:userId];
    }
    return nil;
}

+ (User *)loginWithEmail:(NSString *)email andPassword:(NSString *)password {
    User *user = [self findByAttributes:$dict(email, FIELD_EMAIL, password, FIELD_PASSWORD)];
    if (user) {
        [Preferences setPreferences:$dict(user.objectId, PREF_LOGGED_IN_USER_ID)];
    } else {
        @throw [NSException exceptionWithName:LOGIN_FAILED_EXCEPTION reason:ERROR_MSG_INCORRECT_USERNAME_AND_PASSWORD userInfo:nil];
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
    return [self fetchPropertyIfNeeded:[Profile class] forKey:FIELD_PROFILE];
}

- (void)setProfile:(Profile *)profile {
    [self setObject:profile forKey:FIELD_PROFILE];
}

- (Plan *)plan {
    return [self fetchPropertyIfNeeded:[Plan class] forKey:FIELD_PLAN];
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
            @throw [NSException exceptionWithName:SIGNUP_FAILED_EXCEPTION reason:$str(ERROR_MSG_EMPTY_FIELD, [key lowercaseString]) userInfo:nil];
        }
    }];
    [self.profile validateMandatoryFields];
}

- (void)validateEmail {
    PFQuery *query = [PFQuery queryWithClassName:[User tableName]];
    [query whereKey:FIELD_EMAIL equalTo:self.email];
    NSError *error = nil;
    int count = [query countObjects:&error];
    if (!error) {
        if (count > 0) {
            @throw [NSException exceptionWithName:SIGNUP_FAILED_EXCEPTION reason:$str(ERROR_MSG_DUPLICATE_EMAIL, self.email) userInfo:nil];
        }
    } else {
        @throw [NSException exceptionWithName:SIGNUP_FAILED_EXCEPTION reason:ERROR_MSG_INVALID_REQUEST userInfo:error.userInfo];
    }
}


@end