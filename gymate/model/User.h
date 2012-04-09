#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface User : PFUser
{
    NSString *firstName;
    NSString *lastName;
    NSNumber *gender;
}
@property (nonatomic, retain) NSString *firstName;
@property (nonatomic, retain) NSString *lastName;
@property (nonatomic, retain) NSNumber *gender;

+ (id)user;
+ (id)userWithPFUser:(PFUser *)pfUser;
+ (User *)logInWithEmail:(NSString *)username password:(NSString *)password;
@end
