#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

#define FIELD_OBJECT_ID @"objectId"
#define ERROR_MSG_EMPTY_FIELD @"%@ should not be empty"

@interface BaseObject : PFObject

+ (NSString *)tableName;
//+ (id)fromPFObject:(PFObject *)pfObject toObject:(Class)class;

//- (BOOL)save;

@end