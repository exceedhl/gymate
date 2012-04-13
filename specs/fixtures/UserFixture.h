@class User;

@interface UserFixture : NSObject

@property (nonatomic, retain) User *user;

+ (id)fixture;
+ (void)deleteAll;
@end
