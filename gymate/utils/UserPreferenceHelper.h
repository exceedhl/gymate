#import <Foundation/Foundation.h>

@interface UserPreferenceHelper : NSObject

extern NSString * const PREFS_EMAIL;
extern NSString * const PREFS_PASSWORD;

+(void) setPreferences:(NSDictionary *)prefs;
+(BOOL) preferencesExist:(NSArray *)keys;

@end
