#import "NSString+Gymate.h"

@implementation NSString (Gymate)

-(BOOL) isEmpty {
    return [[self stringByTrimmingCharactersInSet:
             [NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0;
}

@end
