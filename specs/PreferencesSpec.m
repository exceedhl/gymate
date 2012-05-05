#import "Preferences.h"

SPEC_BEGIN(PreferencesSpec)

describe(@"Preferences", ^{
    
    beforeEach(^{
        [NSUserDefaults resetStandardUserDefaults];
    });
    
    it(@"should set user preferences", ^{
        [Preferences setPreferences:$dict(@"adam@smith.com", @"username", @"letmein", @"password")];
        
        NSNumber *result  = [NSNumber numberWithBool:[Preferences preferencesExist:$arr(@"username", @"password")]];
        
        [[result should] beTrue];        
    });
});

SPEC_END