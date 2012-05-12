#import "ProfileFixture.h"
#import "Profile.h"


@implementation ProfileFixture

+ (Profile *)profile {
    return [Profile profileWithFirstName:@"Adam" lastName:@"Smith" height:@"180" weight:@"78" andGender:[NSNumber numberWithInt:0]];
}
@end