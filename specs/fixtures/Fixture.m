#import "Fixture.h"
#import "UserFixture.h"

#import <Parse/Parse.h>

@implementation Fixture

@synthesize users;

+ (id)fixture
{
    [Parse setApplicationId:@"vHejG6VviEbZmluhw9H8Z3BwdOL3IfDrxmRF70eb" 
                  clientKey:@"NP1GdDSDXSN1oi7YyBTL7BDVpczqLbAEuJqww56N"];

    Fixture *f = [[[Fixture alloc] init] autorelease];
    f.users = [UserFixture fixture];
    return f;
}

- (void)dealloc
{
    [self.users release];
    [super dealloc];
}

@end
