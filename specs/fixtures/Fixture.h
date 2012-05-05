#import "User.h"
#import "Plan.h"

@interface Fixture : NSObject
{
    User *adam;
    Plan *planOfAdam;
}

- (Fixture *)fixture;

- (void)createData;
- (void)destroyAllData;

- (void)createUsers;
- (void)destroyUsers;

@end
