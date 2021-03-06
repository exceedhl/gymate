#import "BaseViewController.h"
#import "UITextField+Gymate.h"

@implementation BaseViewController

- (void)setBackground {
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"BG"]];
    self.view.backgroundColor = background;
    [background release];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)awakeFromNib {
    NSLog(@"awak from nib %@", [self class]);
    [super awakeFromNib];
    [self setBackground];
    if ([self respondsToSelector:@selector(createCustomViews)]) {
        [self performSelector:@selector(createCustomViews)];
    }
}

- (IBAction)hideKeyboard:(id)sender {
    [self.view endEditing:YES];
}

- (void)setLeftPadding:(int)padding forTextFields:(NSArray *)textFields {
    [textFields $each:^(id tf) {
        [tf setLeftPadding:padding];
    }];
}

@end
