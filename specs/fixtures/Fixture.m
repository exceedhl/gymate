#import "Fixture.h"

@implementation Fixture

- (id)init {
    if (self = [super init]) {
        [Parse setApplicationId:@"vHejG6VviEbZmluhw9H8Z3BwdOL3IfDrxmRF70eb"
                      clientKey:@"NP1GdDSDXSN1oi7YyBTL7BDVpczqLbAEuJqww56N"];
    }
    return self;
}

- (Fixture *)fixture {
    return [[[Fixture alloc] init] autorelease];
}

- (void)createUsers {
    adam = [User user];
    adam.email = @"adam@smith.com";
    adam.password = @"letmein";
    adam.firstName = @"Adam";
    adam.lastName = @"Smith";
    adam.height = @"180";
    adam.weight = @"78";
    adam.gender = [NSNumber numberWithInt:0];
    [adam signUp];
}

- (void)destroyUsers {
    [[User logInWithEmail:@"adam@smith.com" password:@"letmein"] delete];
}

- (void)createWorkouts {

}

- (void)destroyWorkouts {

}

- (void)createPlans {
    planOfAdam = [[Plan planWithUser:adam] save];
}

- (void)destroyPlans {

}

- (void)createData {
    [self createUsers];
    [self createWorkouts];
    [self createPlans];
}

- (void)destroyAllData {
    [self destroyPlans];
    [self destroyWorkouts];
    [self destroyUsers];
}


@end
