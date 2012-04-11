#import "UserTest.h"

@implementation UserTest

-(void)setUp
{
    [Parse setApplicationId:@"LgeuExxvIpU5ZLyXeSwCk4AKj4aD1a5ViPtcef2m" 
                  clientKey:@"HrEukR6VwxpXOkiwt2XQRiDR92knGg9MguD2MESS"];
}

-(void)testLoginWithUserNameAndPassword
{
    User *loggedInUser = [User logInWithEmail:EMAIL_ADDRESS password:PASSWORD];
    assertThat(loggedInUser, is(notNilValue()));
}

@end
