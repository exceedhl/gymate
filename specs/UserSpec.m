#import "User.h"
#import "UserFixture.h"

SPEC_BEGIN(UserSpec)

describe(@"User", ^{
        
    __block UserFixture *users = nil;
    
    
    beforeAll(^{
        users = [UserFixture fixture];
    });
    
    context(@"when signup", ^{
        it(@"should succeed", ^{
            User *user = [User user];
            user.firstName = @"Tom";
            user.lastName = @"Jerry";
            user.gender = [NSNumber numberWithInt:0];
            user.email = @"tom@jerry.com";
            user.passwd = @"letmein";
            user.height = @"180";
            user.weight = @"78";
            [user signUp];
            [user delete];
        });
        
        it(@"should throw exception on duplicate username/email", ^{
            User *user = [User user];
            user.firstName = @"whatever";
            user.lastName = @"whatever";
            user.gender = [NSNumber numberWithInt:0];
            user.height = @"180";
            user.weight = @"78";
            user.email = @"adam@smith.com";
            user.passwd = @"password";
            [[theBlock(^{[user signUp];}) should] raiseWithName:@"Signup failed" reason:@"username adam@smith.com already taken"];            
        });
        
        it(@"should throw exception if firstName or lastName or email or height or weight is empty", ^{
            NSArray *keys = $arr(@"firstName", @"lastName", @"email", @"height", @"weight", @"passwd");
            [keys $each:^(id key) {
                User *user = [User user];
                user.firstName = @"foo";
                user.lastName = @"bar";
                user.gender = [NSNumber numberWithInt:0];
                user.email = @"foo@bar.com";
                user.passwd = @"password";
                user.height = @"180";
                user.weight = @"78";
                [user setObject:@"     \t  \n" forKey:key];
                [[theBlock(^{[user signUp];}) should] raiseWithName:@"Signup failed" reason:[NSString stringWithFormat:@"%@ should not be empty", [key lowercaseString]]];                                   
             }];
        });
        
    });

    context(@"when login", ^{
        it(@"should succeed", ^{
            User *user = [users adam];
            User *loggedInUser = [User logInWithEmail:user.email password:user.password];
            [[loggedInUser.email should] equal:user.email];
            [[loggedInUser.firstName should] equal:user.firstName];
            [[loggedInUser.lastName should] equal:user.lastName];
            [[loggedInUser.gender should] equal:user.gender];
            [[loggedInUser.sessionToken should] beNonNil];
            [[[NSNumber numberWithBool:loggedInUser.isAuthenticated] should] beTrue];
            [[[[User currentUser] email] should] equal:user.email];
        });
        
        it(@"should return nil user if login failed", ^{
            
        });
    });
    
    
});

SPEC_END
