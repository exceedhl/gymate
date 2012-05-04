#import "UserPreferenceHelper.h"

SPEC_BEGIN(UserPreferenceHelperSpec)

describe(@"UserPreferenceHelper", ^{
    
    beforeEach(^{
        [NSUserDefaults resetStandardUserDefaults];
    });
    
    it(@"should set user preferences", ^{
        [UserPreferenceHelper setPreferences:$dict(@"adam@smith.com", @"username", @"letmein", @"password")];
        
        NSNumber *result  = [NSNumber numberWithBool:[UserPreferenceHelper preferencesExist:$arr(@"username", @"password")]];
        
        [[result should] beTrue];        
    });
});

SPEC_END