#import "Profile.h"
#import "NSString+Gymate.h"
#import "User.h"


@implementation Profile

+ (Profile *)profileWithFirstName:(NSString *)firstName lastName:(NSString *)lastName height:(NSString *)height weight:(NSString *)weight andGender:(NSNumber *)gender {
    Profile *profile = [super basicPFObject];
    profile.firstName = firstName;
    profile.lastName = lastName;
    profile.height = height;
    profile.weight = weight;
    profile.gender = gender;
    return profile;
}

- (NSString *)weight {
    return [self objectForKey:FIELD_WEIGHT];
}

- (void)setWeight:(NSString *)weight {
    [self setObject:weight forKey:FIELD_WEIGHT];
}

- (NSString *)height {
    return [self objectForKey:FIELD_HEIGHT];
}

- (void)setHeight:(NSString *)height {
    [self setObject:height forKey:FIELD_HEIGHT];
}

- (NSString *)firstName {
    return [self objectForKey:FIELD_FIRST_NAME];
}

- (void)setFirstName:(NSString *)firstName {
    [self setObject:firstName forKey:FIELD_FIRST_NAME];
}

- (NSString *)lastName {
    return [self objectForKey:FIELD_LAST_NAME];
}

- (void)setLastName:(NSString *)lastName {
    [self setObject:lastName forKey:FIELD_LAST_NAME];
}

- (NSNumber *)gender {
    return [self objectForKey:FIELD_GENDER];
}

- (void)setGender:(NSNumber *)gender {
    [self setObject:gender forKey:FIELD_GENDER];
}

- (void)validateMandatoryFields {
    [$arr(FIELD_FIRST_NAME, FIELD_LAST_NAME, FIELD_HEIGHT, FIELD_WEIGHT) $each:^(id key) {
        NSString *value = [self performSelector:NSSelectorFromString(key)];
        if (!value || [value isEmpty]) {
            @throw [NSException exceptionWithName:SIGNUP_FAILED_EXCEPTION reason:$str(ERROR_MSG_EMPTY_FIELD, [key lowercaseString]) userInfo:nil];
        }
    }];
}
@end