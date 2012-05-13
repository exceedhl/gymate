#import "LoginViewController.h"
#import "SignupViewController.h"
#import "User.h"
#import "MBProgressHUD.h"
#import "UIViewController+Gymate.h"

@implementation LoginViewController

@synthesize email, password;

- (void)viewDidLoad {
    [self setLeftPadding:8 forTextFields:$arr(email, password)];
}

- (IBAction)login:(id)sender {
    [self hideKeyboard:nil];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Logging in...";
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        User *user = [User loginWithEmail:self.email.text andPassword:self.password.text];
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:NO];
            if (user) {
                [self.presentingViewController.view setHidden:NO];
                [self dismissViewControllerAnimated:YES completion:nil];
            } else {
                NSString *title = @"Login Failed";
                NSString *message = @"Wrong Username/Email and password combination. \nPlease try again.";
                [self showAlertWithTitle:title andMessage:message];
            }

        });
    });

}

- (IBAction)signUp:(id)sender {
    SignupViewController *controller = [[[SignupViewController alloc] initWithNibName:@"signupView" bundle:nil] autorelease];
    [self setTransitionAnimation:self.navigationController.view withType:kCATransitionFromBottom];
    [self.navigationController pushViewController:controller animated:NO];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self handleReturnKeyOfTextFields:$arr(email, password) withAction:^{
        [self login:nil];
    }];
    return NO;
}

- (void)dealloc {
    [email release];
    [password release];
    [super dealloc];
}

@end
