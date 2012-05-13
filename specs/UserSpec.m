#import "User.h"
#import "UserFixture.h"
#import "Profile.h"

SPEC_BEGIN(UserSpec)

#define EMPTY_STRING @"  "

describe(@"User", ^{

    beforeEach(^{
        [BaseFixture destroyAll:$arr([User tableName], [Profile tableName])];
    });

    context(@"when signup", ^{

        it(@"should succeed", ^{
            User *user = [UserFixture user];
            [user signUp];
            [[[User loggedInUser] should] beNonNil];
        });

        it(@"should throw exception on duplicate email", ^{
            [[UserFixture user] signUp];
            User *user = [UserFixture user];
            [[theBlock(^{
                [user signUp];
            }) should] raiseWithName:@"Signup failed" reason:@"Email adam@smith.com is already taken"];
        });

        it(@"should throw exception if email is empty", ^{
            User *user = [UserFixture user];
            user.email = EMPTY_STRING;
            [[theBlock(^{
                [user signUp];
            }) should] raiseWithName:@"Signup failed" reason:@"email should not be empty"];
        });

        it(@"should throw exception if password is empty", ^{
            User *user = [UserFixture user];
            user.password = EMPTY_STRING;
            [[theBlock(^{
                [user signUp];
            }) should] raiseWithName:@"Signup failed" reason:@"password should not be empty"];
        });

        it(@"should throw exception if firstname is empty", ^{
            User *user = [UserFixture user];
            user.profile.firstName = EMPTY_STRING;
            [[theBlock(^{
                [user signUp];
            }) should] raiseWithName:@"Signup failed" reason:@"firstname should not be empty"];
        });

        it(@"should throw exception if lastname is empty", ^{
            User *user = [UserFixture user];
            user.profile.lastName = EMPTY_STRING;
            [[theBlock(^{
                [user signUp];
            }) should] raiseWithName:@"Signup failed" reason:@"lastname should not be empty"];
        });

        it(@"should throw exception if weight is empty", ^{
            User *user = [UserFixture user];
            user.profile.weight = EMPTY_STRING;
            [[theBlock(^{
                [user signUp];
            }) should] raiseWithName:@"Signup failed" reason:@"weight should not be empty"];
        });

        it(@"should throw exception if height is empty", ^{
            User *user = [UserFixture user];
            user.profile.height = EMPTY_STRING;
            [[theBlock(^{
                [user signUp];
            }) should] raiseWithName:@"Signup failed" reason:@"height should not be empty"];
        });
    });

    context(@"when login", ^{
        it(@"should succeed", ^{
            User *user = [UserFixture user];
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
            User *user = [UserFixture user];
            [user signUp];
            [[[[User loggedInUser] objectId] should] equal:user.objectId];
        });
    });

});

SPEC_END
