#import <objc/runtime.h>
#import "BaseObject.h"


@implementation BaseObject

+ (NSString *)tableName
{
    return [NSString stringWithCString:class_getName([self class]) encoding:NSUTF8StringEncoding];
}

- (id)save {
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        const char *propName = property_getName(property);
        if (propName) {
            NSString *propertyName = [NSString stringWithCString:propName encoding:NSUTF8StringEncoding];
            [self setObject:[self valueForKey:propertyName] forKey:propertyName];
        }
    }
    free(properties);
    [super save];
    return self;
}

@end