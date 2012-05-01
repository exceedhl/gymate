#import "BaseViewController.h"
#import "UITextField+Gymate.h"

@implementation BaseViewController

- (IBAction)hideKeyboard:(id)sender {
    [self.view endEditing:YES];
}

- (void)setLeftPadding:(int)padding forTextFields:(NSArray *)textFields
{
    [textFields $each:^(id tf) {
        [tf setLeftPadding:padding];
    }];
}

@end
