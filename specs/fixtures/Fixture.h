@class UserFixture;

@interface Fixture : NSObject

@property (nonatomic, retain) UserFixture *users;

+ (id)fixture;

@end
