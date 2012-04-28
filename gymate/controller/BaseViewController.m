#import "BaseViewController.h"

@implementation BaseViewController

- (IBAction)hideKeyboard:(id)sender {
    [self.view endEditing:YES];
}

@end
