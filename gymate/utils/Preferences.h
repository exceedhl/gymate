#import <Foundation/Foundation.h>

@interface Preferences : NSObject

extern NSString * const PREFS_USER;

+(void) setPreferences:(NSDictionary *)prefs;
+(BOOL) preferencesExist:(NSArray *)keys;

@end
