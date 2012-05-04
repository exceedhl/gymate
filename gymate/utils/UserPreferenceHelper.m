#import "UserPreferenceHelper.h"

@implementation UserPreferenceHelper

NSString * const PREFS_SESSION_TOKEN = @"sessionToken";

+(void) setPreferences:(NSDictionary *)prefs
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
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

@end
