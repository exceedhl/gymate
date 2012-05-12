#import "Preferences.h"

SPEC_BEGIN(PreferencesSpec)

describe(@"Preferences", ^{
    
    beforeEach(^{
        [NSUserDefaults resetStandardUserDefaults];
    });
    
    it(@"should set user preferences", ^{
        [Preferences setPreferences:$dict(@"yfan", @"username")];
        NSNumber *result  = [NSNumber numberWithBool:[Preferences preferencesExist:$arr(@"username")]];
        [[result should] beTrue];        
    });

    it(@"should return preference value", ^{
        [Preferences setPreferences:$dict(@"yfan", @"username")];
        [[[Preferences getPreference:@"username"] should] equal:@"yfan"];
    });
});

SPEC_END