#import "UITextField+Gymate.h"

@implementation UITextField (Gymate)

- (void)setLeftPadding:(int)padding
{
    int h = self.frame.size.height;
    UIView *paddingView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, padding, h)] autorelease];
    self.leftView = paddingView;
    self.leftViewMode = UITextFieldViewModeAlways;
    paddingView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, padding, h)] autorelease];
}

- (void)setRightLabel:(NSString *)labelText
{
    UILabel *label = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.height, 40)] autorelease];
    label.text = labelText;
    label.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    label.alpha = 0.3;
    label.font = [UIFont systemFontOfSize:14];
    self.rightViewMode = UITextFieldViewModeAlways;
    self.rightView = label;
}

@end
