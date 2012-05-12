#import "Preferences.h"

@implementation Preferences

+(void) setPreferences:(NSDictionary *)prefs
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    [userDefaults removeObjectForKey:PREF_LOGGED_IN_USER_ID];
//    [userDefaults synchronize];
    [prefs enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [userDefaults setValue:obj forKey:key];
    }];
    [userDefaults synchronize];
}

+(BOOL) preferencesExist:(NSArray *)keys
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    __block BOOL keysExist = YES;
    [keys $each:^(id key) {
        if ([userDefaults objectForKey:key] == nil) {
            keysExist = NO;
        }
    }];
    return keysExist;
}

+ (id)getPreference:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:key];
}

@end
