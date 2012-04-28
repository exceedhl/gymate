#import "UIViewController+Extensions.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIViewController (Extensions)
- (void)setTransitionAnimation:(UIView *)view withType:(NSString * const)type 
{
    CATransition *transition = [CATransition animation];
    transition.duration = 0.7;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = type;
    transition.delegate = self;
    [view.layer addAnimation:transition forKey:nil];
}

- (void)handleReturnKeyOfTextFields:(NSArray *)textFields withAction:(void (^)(void))action
{
    for (int i = 0; i < [textFields count]; i++) {
        if ([[textFields objectAtIndex:i] isFirstResponder]) {
            if (i + 1 < [textFields count]) {
                [[textFields objectAtIndex:(i + 1)] becomeFirstResponder];
            }
            else {
                action();
            }
            break;
        }
    }
}

- (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message
{
    UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil, nil] autorelease];
    [alert show];
}
@end
