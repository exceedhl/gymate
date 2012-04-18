#import <UIKit/UIKit.h>
#import <Parse/PF_FBConnect.h>

@interface LoginViewController : UIViewController 
<UITextFieldDelegate, 
PF_FBDialogDelegate> {
    UITextField *email;
    UITextField *password;
}

@property (nonatomic, retain) IBOutlet UITextField *email;
@property (nonatomic, retain) IBOutlet UITextField *password;

- (IBAction)login:(id)sender;
- (IBAction)signUp:(id)sender;
- (IBAction)signUpWithFacebook:(id)sender;
- (IBAction)backgroundTouch:(id)sender;
@end
