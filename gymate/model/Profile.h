#import <Foundation/Foundation.h>
#import "BaseObject.h"


@interface Profile : BaseObject

#define FIELD_WEIGHT @"weight"
#define FIELD_HEIGHT @"height"
#define FIELD_FIRST_NAME @"firstName"
#define FIELD_LAST_NAME @"lastName"
#define FIELD_GENDER @"gender"

-(NSString *)weight;
-(void)setWeight:(NSString *)weight;
-(NSString *)height;
-(void)setHeight:(NSString *)height;
-(NSString *)firstName;
-(void)setFirstName:(NSString *)firstName;
-(NSString *)lastName;
-(void)setLastName:(NSString *)lastName;
-(NSNumber *)gender;
-(void)setGender:(NSNumber *)gender;

+ (Profile *)profileWithFirstName:(NSString *)firstName lastName:(NSString *)lastName height:(NSString *)height weight:(NSString *)weight andGender:(NSNumber *)gender;
@end