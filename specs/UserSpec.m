#import "User.h"
#import "Fixture.h"

SPEC_BEGIN(UserSpec)

describe(@"User", ^{
        
    __block Fixture *f = nil;
    
    beforeAll(^{
        f = [Fixture fixture];
    });
    
    it(@"should signup successfully", ^{
        User *user = [User user];
        user.firstName = @"Tom";
        user.lastName = @"Jerry";
        user.gender = [NSNumber numberWithInt:0];
        user.email = @"tom@jerry.com";
        user.password = @"letmein";
        NSNumber * result = [NSNumber numberWithBool:[user signUp]];
        [[result should] beTrue];
        [user delete];
    });
    
    it(@"", ^{
        NSLog(@"%@", f.users); 
    });
});

SPEC_END
