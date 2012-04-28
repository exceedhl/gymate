#import "NSString+Gymate.h"

SPEC_BEGIN(NSStringGymateSpec)

describe(@"NSString", ^{
    it(@"should not be empty with words", ^{
        NSString *s = @"asdf";
        NSNumber *result = [NSNumber numberWithBool:[s isEmpty]];
        [[result should] beFalse];        
    });
    
    it(@"should be empty with no character", ^{
        NSString *s = @"";
        NSNumber *result = [NSNumber numberWithBool:[s isEmpty]];
        [[result should] beTrue];
    });
    
    it(@"should be empty with only whitespaces", ^{
        NSString *s = @"\t\n \r ";
        NSNumber *result = [NSNumber numberWithBool:[s isEmpty]];
        [[result should] beTrue];
    });
});

SPEC_END
