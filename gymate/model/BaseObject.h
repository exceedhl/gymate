#import <Foundation/Foundation.h>
#import <Parse/Parse.h>


@interface BaseObject : PFObject

+ (NSString *)tableName;

- (id)save;

@end