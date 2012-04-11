#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController {
    UITextField *email;
    UITextField *password;
}

@property (nonatomic, retain) IBOutlet UITextField *email;
@property (nonatomic, retain) IBOutlet UITextField *password;

- (IBAction)login:(id)sender;
- (IBAction)signUp:(id)sender;
- (IBAction)backgroundTouch:(id)sender;
@end
