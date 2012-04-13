#import "Fixture.h"

#import <Parse/Parse.h>

@implementation Fixture

- (id)init 
{
    if (self = [super init]) {
        [Parse setApplicationId:@"vHejG6VviEbZmluhw9H8Z3BwdOL3IfDrxmRF70eb" 
                      clientKey:@"NP1GdDSDXSN1oi7YyBTL7BDVpczqLbAEuJqww56N"];        
    }
    return self;
}


@end
