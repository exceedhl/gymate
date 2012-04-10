#import "UserTest.h"

@implementation UserTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testUser
{
    assertThat(@"1", equalTo(@"1"));
}

@end
