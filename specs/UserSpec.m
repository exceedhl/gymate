#import "User.h"
#import "Fixture.h"
#import "Profile.h"

SPEC_BEGIN(UserSpec)

#define EMPTY_STRING @"  "

describe(@"User", ^{

    __block Fixture *f;
    __block User *user;

    beforeAll(^{
        f = [Fixture fixture];
    });

    beforeEach(^{
        Profile *profile = [Profile profileWithFirstName:@"new" lastName:@"user" height:@"188" weight:@"55" andGender:[NSNumber numberWithInt:0]];
        user = [User userWithEmail:@"new@user.com" password:@"password" andProfile:profile];
        user.plan = (Plan *) [NSNull null];
    });

    afterEach(^{
        [f destroyObjects:[User tableName]];
        [f destroyObjects:[Profile tableName]];
    });

    context(@"when signup", ^{

        it(@"should succeed", ^{
            [user signUp];
            [[[User loggedInUser] should] beNonNil];
        });

        it(@"should throw exception on duplicate email", ^{
            [user signUp];
            [[theBlock(^{
                [user signUp];
            }) should] raiseWithName:@"Signup failed" reason:@"Email new@user.com is already taken"];
        });

        it(@"should throw exception if email is empty", ^{
            user.email = EMPTY_STRING;
            [[theBlock(^{
                [user signUp];
            }) should] raiseWithName:@"Signup failed" reason:@"email should not be empty"];
        });

        it(@"should throw exception if password is empty", ^{
            user.password = EMPTY_STRING;
            [[theBlock(^{
                [user signUp];
            }) should] raiseWithName:@"Signup failed" reason:@"password should not be empty"];
        });

        it(@"should throw exception if firstname is empty", ^{
            user.profile.firstName = EMPTY_STRING;
            [[theBlock(^{
                [user signUp];
            }) should] raiseWithName:@"Signup failed" reason:@"firstname should not be empty"];
        });

        it(@"should throw exception if lastname is empty", ^{
            user.profile.lastName = EMPTY_STRING;
            [[theBlock(^{
                [user signUp];
            }) should] raiseWithName:@"Signup failed" reason:@"lastname should not be empty"];
        });

        it(@"should throw exception if weight is empty", ^{
            user.profile.weight = EMPTY_STRING;
            [[theBlock(^{
                [user signUp];
            }) should] raiseWithName:@"Signup failed" reason:@"weight should not be empty"];
        });

        it(@"should throw exception if height is empty", ^{
            user.profile.height = EMPTY_STRING;
            [[theBlock(^{
                [user signUp];
            }) should] raiseWithName:@"Signup failed" reason:@"height should not be empty"];
        });
    });

    context(@"when login", ^{
        it(@"should succeed", ^{
            [user.profile save];
            [user save];
            [User loginWithEmail:user.email andPassword:user.password];
            [[[User loggedInUser] should] beNonNil];
        });

        it(@"should fail if no matching email and password", ^{
            [[theBlock(^{
                [User loginWithEmail:@"not@exist.com" andPassword:@"void"];
            }) should] raiseWithName:@"Login failed" reason:[NSString stringWithFormat:@"Incorrect username or password"]];

        });
    });

    context(@"when logged in", ^{
        it(@"should return logged in user", ^{
            [user signUp];
            [[[[User loggedInUser] objectId] should] equal:user.objectId];
        });
    });

});

SPEC_END
