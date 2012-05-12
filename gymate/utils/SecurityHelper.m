#import <Parse/Parse.h>
#import <objc/runtime.h>
#import "SecurityHelper.h"
#import "User.h"
#import "Profile.h"
#import "Preferences.h"
#import "NSString+Gymate.h"

@interface SecurityHelper()

+ (void)validate:(User *)user;
+ (void)validateMandatoryFields:(User *)user;
+ (void)validateEmail:(NSString *)email;

@end

@implementation SecurityHelper

+ (User *)loginWithEmail:(NSString *)email andPassword:(NSString *)password {
    PFQuery *query = [PFQuery queryWithClassName:[User tableName]];
    [query whereKey:FIELD_EMAIL equalTo:email];
    [query whereKey:FIELD_PASSWORD equalTo:password];
    User *user = (User *)[query getFirstObject];
    object_setClass(user, [User class]);
    if (user) {
        [Preferences setPreferences:$dict(user.objectId, PREF_LOGGED_IN_USER_ID)];
    } else {
        @throw [NSException exceptionWithName:@"Login failed" reason:@"Incorrect username or password" userInfo:nil];
    }
    return user;
}

+ (void)signUp:(User *)user {
    [self validate:user];
    [user.profile save];
    [user save];
    [Preferences setPreferences:$dict(user.objectId, PREF_LOGGED_IN_USER_ID)];
}

+ (BOOL)isUserLoggedIn {
    return [Preferences preferencesExist:$arr(PREF_LOGGED_IN_USER_ID)];
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

+ (void)validate:(User *)user {
    [self validateMandatoryFields:user];
    [self validateEmail:user.email];
}

+ (void)validateMandatoryFields:(User *)user {
    [$arr(FIELD_EMAIL, FIELD_PASSWORD) $each:^(id key) {
        NSString *value = [user performSelector:NSSelectorFromString(key)];
        if (!value || [value isEmpty]) {
            @throw [NSException exceptionWithName:@"Signup failed" reason:[NSString stringWithFormat:@"%@ should not be empty", [key lowercaseString]] userInfo:nil];
        }
    }];
    [$arr(FIELD_FIRST_NAME, FIELD_LAST_NAME, FIELD_HEIGHT, FIELD_WEIGHT) $each:^(id key) {
        NSString *value = [user.profile performSelector:NSSelectorFromString(key)];
        if (!value || [value isEmpty]) {
            @throw [NSException exceptionWithName:@"Signup failed" reason:[NSString stringWithFormat:@"%@ should not be empty", [key lowercaseString]] userInfo:nil];
        }
    }];
}

+ (void)validateEmail:(NSString *)email {
    PFQuery *query = [PFQuery queryWithClassName:[User tableName]];
    [query whereKey:FIELD_EMAIL equalTo:email];
    NSError *error = nil;
    int count = [query countObjects:&error];
    if (!error) {
        if (count > 0) {
            @throw [NSException exceptionWithName:@"Signup failed" reason:$str(@"Email %@ is already taken", email) userInfo:nil];
        }
    } else {
        @throw [NSException exceptionWithName:@"Signup failed" reason:@"Validation request failed" userInfo:error.userInfo];
    }
}
@end