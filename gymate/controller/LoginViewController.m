#import "LoginViewController.h"
#import "SignupViewController.h"
#import "User.h"
#import "MBProgressHUD.h"
#import "UIViewController+Extensions.h"

@implementation LoginViewController

@synthesize email, password;

- (IBAction)login:(id)sender 
{
    [self hideKeyboard:nil];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Logging in...";
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        User *user = [User logInWithEmail:self.email.text password:self.password.text];
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:NO];
            if (user) {
                NSLog(@"User: %@", user);
                NSLog(@"session token: %@", user.sessionToken);
                NSLog(@"new user?: %d", user.isNew);
                NSLog(@"Current User: %@", [User currentUser]);
            } else {
                NSString *title = @"Login Failed";
                NSString *message = @"Wrong Username/Email and password combination. \nPlease try again.";
                [self showAlertWithTitle:title andMessage:message];
            }
             
        });
    });

}

- (IBAction)signUp:(id)sender 
{
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

@end
