#import "LoginViewController.h"
#import "SignupViewController.h"
#import "User.h"

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
    User *user = [User logInWithEmail:self.email.text password:self.password.text];
    if (user) {
        NSLog(@"User: %@", user);
        NSLog(@"session token: %@", user.sessionToken);
        NSLog(@"new user?: %d", user.isNew);
        NSLog(@"Current User: %@", [User currentUser]);
    }

}

- (IBAction)signUp:(id)sender 
{
    SignupViewController *controller = [[[SignupViewController alloc] initWithNibName:@"signupView" bundle:nil] autorelease];    
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)dealloc 
{
    [email release];
    [password release];
    [super dealloc];
}
@end
