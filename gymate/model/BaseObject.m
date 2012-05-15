#import <objc/runtime.h>
#import "BaseObject.h"


@implementation BaseObject

+ (NSString *)tableName {
    return [NSString stringWithCString:class_getName([self class]) encoding:NSUTF8StringEncoding];
}

- (void)setObject:(id)object forKey:(NSString *)key {
    if (!object) {
        [super setObject:[NSNull null] forKey:key];
    }
    else {
        [super setObject:object forKey:key];
    }

}

//+ (id)fromPFObject:(PFObject *)pfObject toObject:(Class)class {
//    object_setClass(pfObject, class);
//    unsigned int outCount, i;
//    objc_property_t *properties = class_copyPropertyList(class, &outCount);
//    for (i = 0; i < outCount; i++) {
//        objc_property_t property = properties[i];
//        const char *propName = property_getName(property);
//        if (propName) {
//            NSString *propertyName = [NSString stringWithCString:propName encoding:NSUTF8StringEncoding];
//            NSObject *obj = [pfObject objectForKey:propertyName];
//            if ([obj respondsToSelector:@selector(className)]) {
//                object_setClass(obj, [PFObject class]);
//                [pfObject performSelector:NSSelectorFromString($str(@"set%@:", [propertyName capitalizedString])) withObject:[BaseObject fromPFObject:(PFObject *)obj toObject:[Profile class]]];
//            } else {
//                [pfObject performSelector:NSSelectorFromString($str(@"set%@:", [propertyName capitalizedString])) withObject:obj];
//            }
//        }
//    }
//    free(properties);
//    return pfObject;
//}


//- (BOOL)save {
//    unsigned int outCount, i;
//    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
//    for (i = 0; i < outCount; i++) {
//        objc_property_t property = properties[i];
//        const char *propName = property_getName(property);
//        if (propName) {
//            NSString *propertyName = [NSString stringWithCString:propName encoding:NSUTF8StringEncoding];
//            [self setObject:[self valueForKey:propertyName] forKey:propertyName];
//        }
//    }
//    free(properties);
//    [super save];
//}


@end