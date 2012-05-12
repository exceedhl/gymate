#import <Foundation/Foundation.h>
#import <Parse/Parse.h>


@interface BaseObject : PFObject

#define FIELD_OBJECT_ID @"objectId"

+ (NSString *)tableName;
//+ (id)fromPFObject:(PFObject *)pfObject toObject:(Class)class;

//- (BOOL)save;

@end