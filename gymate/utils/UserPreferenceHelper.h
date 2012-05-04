#import <Foundation/Foundation.h>

@interface UserPreferenceHelper : NSObject

extern NSString * const PREFS_SESSION_TOKEN;

+(void) setPreferences:(NSDictionary *)prefs;
+(BOOL) preferencesExist:(NSArray *)keys;

@end
