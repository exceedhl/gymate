#import "LoginViewController.h"
#import "SignupViewController.h"
#import "User.h"
#import "MBProgressHUD.h"
#import "UIViewController+Gymate.h"
#import "TodayWorkoutViewController.h"

@implementation LoginViewController

@synthesize email, password;

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle
{
    if (self = [super initWithNibName:nibName bundle:nibBundle]) {
        UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"BG"]];
        self.view.backgroundColor = background;
        [background release];

    }
    return self;
}

- (void)viewDidLoad
{
    [self setLeftPadding:8 forTextFields:$arr(email, password)];
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
                TodayWorkoutViewController *controller = [[[TodayWorkoutViewController alloc] initWithNibName:@"TodayWorkoutView" bundle:nil] autorelease];
                [self.navigationController pushViewController:controller animated:YES];
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
