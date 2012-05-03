#import "BaseViewController.h"
#import "UITextField+Gymate.h"

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"BG"]];
        self.view.backgroundColor = background;
        [background release];
 
        if ([self respondsToSelector:@selector(createCustomViews)]) {
            [self performSelector:@selector(createCustomViews)];
        }
    }
    return self;
}

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
