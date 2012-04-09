#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController {
    UITextField *email;
    UITextField *password;
}

@property (nonatomic, retain) IBOutlet UITextField *email;
@property (nonatomic, retain) IBOutlet UITextField *passsword;

- (IBAction)login:(id)sender;
@end
