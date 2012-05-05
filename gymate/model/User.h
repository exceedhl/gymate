#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "Plan.h"

@interface User : PFUser

+ (id)user;
+ (id)logInWithEmail:(NSString *)username password:(NSString *)password;

- (void)signUp;

- (NSString *)firstName;
- (void)setFirstName:(NSString *)firstName;
- (NSString *)lastName;
- (void)setLastName:(NSString *)lastName;
- (NSNumber *)gender;
- (void)setGender:(NSNumber *)gender;
- (NSString *)height;
- (void)setHeight:(NSString *)height;
- (NSString *)weight;
- (void)setWeight:(NSString *)wight;
- (NSString *)passwd;
- (void)setPasswd:(NSString *)aPassword;

- (Plan *)plan;

@end
