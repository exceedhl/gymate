#import <SenTestingKit/SenTestingKit.h>
#import <Parse/Parse.h>

#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>

#import "User.h"

#define EMAIL_ADDRESS @"tom@cruise.com"
#define PASSWORD @"letmein"

@interface UserTest : SenTestCase
{
    @private
    User *user;
}

@end
