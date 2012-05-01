#import "LoginViewController.h"
#import "SignupViewController.h"
#import "User.h"
#import "MBProgressHUD.h"
#import "UIViewController+Extensions.h"

@implementation LoginViewController

@synthesize email, password;

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle
{
    if (self = [super initWithNibName:nibName bundle:nibBundle]) {
        UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"LoginBG"]];
        self.view.backgroundColor = background;
        [background release];

    }
    return self;
}

- (void)viewDidLoad
{
    UIView *paddingView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, 20)] autorelease];
    email.leftView = paddingView;
    email.leftViewMode = UITextFieldViewModeAlways;
    paddingView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, 20)] autorelease];
    password.leftView = paddingView;
    password.leftViewMode = UITextFieldViewModeAlways;
}

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
