#import "UserPreferenceHelper.h"

@implementation UserPreferenceHelper

NSString * const PREFS_EMAIL = @"username";
NSString * const PREFS_PASSWORD = @"password";

+(void) setPreferences:(NSDictionary *)prefs
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [prefs enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [userDefaults setValue:obj forKey:key];
    }];
    [userDefaults synchronize];
}

@end
