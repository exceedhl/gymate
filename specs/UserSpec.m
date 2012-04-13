#import "User.h"
#import "UserFixture.h"

SPEC_BEGIN(UserSpec)

describe(@"User", ^{
        
    __block UserFixture *users = nil;
    
    beforeAll(^{
        users = [UserFixture fixture];
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
    
    it(@"should login successfully", ^{
        User *user = [users user];
        User *loggedInUser = [User logInWithEmail:user.email password:user.password];
        [[loggedInUser.email should] equal:user.email];
        [[loggedInUser.firstName should] equal:user.firstName];
        [[loggedInUser.lastName should] equal:user.lastName];
        [[loggedInUser.gender should] equal:user.gender];
        [[loggedInUser.sessionToken should] beNonNil];
        [[[NSNumber numberWithBool:loggedInUser.isAuthenticated] should] beTrue];
        [[[[User currentUser] email] should] equal:user.email];
    });
});

SPEC_END
