#import "LoginViewController.h"
#import "SignupViewController.h"
#import "User.h"
#import "MBProgressHUD.h"

@implementation LoginViewController

@synthesize email, password;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (IBAction)login:(id)sender 
{
    [self backgroundTouch:nil];
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
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login Failed" message:@"Please try again." delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil, nil];
                [alert show];
            }
             
        });
    });

}

- (IBAction)signUp:(id)sender 
{
    SignupViewController *controller = [[[SignupViewController alloc] initWithNibName:@"signupView" bundle:nil] autorelease];    
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)backgroundTouch:(id)sender {
    [email resignFirstResponder];
    [password resignFirstResponder];
}

- (void)dealloc 
{
    [email release];
    [password release];
    [super dealloc];
}
@end
