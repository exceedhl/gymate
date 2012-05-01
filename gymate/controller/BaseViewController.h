#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

- (IBAction)hideKeyboard:(id)sender;
- (void)setLeftPadding:(int)padding forTextFields:(NSArray *)textFields;

@end
