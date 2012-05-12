#import <Parse/Parse.h>
#import "BaseFixture.h"


@implementation BaseFixture

+ (void)initialize {
    [Parse setApplicationId:@"RnbpEr08FdfSvrU3fSgAdxmeZVYwb564Be7zgqtX"
                  clientKey:@"5oJ1BnjClfxsuKiu7XZrMybe52Tuv2As9Fmx7SgO"];
    [super initialize];

}

+ (void)destroyAll:(NSArray *)tables {
    [tables $each:^(id table){
        PFQuery *q = [PFQuery queryWithClassName:table];
        [[q findObjects] $each:^(id object) {
            [object delete];
        }];
    }];
}

@end