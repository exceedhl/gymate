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
    NSLog(@"password: %@", self.password.text);
    User *user = [User logInWithEmail:self.email.text password:self.password.text];
    if (user) {
        NSLog(@"first: %@", user.firstName);
        NSLog(@"%@", [user objectForKey:@"firstName"]);
        NSLog(@"last: %@", user.lastName);
        NSLog(@"email: %@", user.email);
        NSLog(@"password: %@", user.password);
        NSLog(@"username: %@", user.username);
        NSLog(@"gender: %@", user.gender);
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
