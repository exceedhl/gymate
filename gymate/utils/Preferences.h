#import <Foundation/Foundation.h>

@interface Preferences : NSObject

#define PREF_LOGGED_IN_USER_ID @"LOG_IN_USER"

+ (void)setPreferences:(NSDictionary *)prefs;

+ (BOOL)preferencesExist:(NSArray *)keys;

+ (id)getPreference:(NSString *)key;

@end
