#import <UIKit/UIKit.h>

@interface UIViewController (Extensions)

- (void)setTransitionAnimation:(UIView *)view withType:(NSString * const)type;
- (void)handleReturnKeyOfTextFields:(NSArray *)textFields withAction:(void (^)(void))action;
- (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message;
    
@end