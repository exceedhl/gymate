#import "Fixture.h"

SPEC_BEGIN(FakeSpec)

describe(@"Fake", ^{

    __block Fixture *f;

    beforeAll(^{
        f = [Fixture fixture];
        [[f destroyAllData] createData];
    });

    it(@"should be able to create plan for user", ^{
    });

});

SPEC_END