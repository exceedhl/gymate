#import "SignupViewController.h"
#import "User.h"

@implementation SignupViewController

@synthesize firstName, lastName, gender, email, password;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)signup:(id)sender {
    User *user = [User user];
    user.firstName = firstName.text;
    user.lastName = lastName.text;
    user.gender = [NSNumber numberWithInt:gender.selectedSegmentIndex];
    user.email = email.text;
    user.password = password.text;
    [user signUp];
    [self backToLoginView:nil];
}

- (IBAction)backToLoginView:(id)sender 
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)backgroundTouch:(id)sender {
    [email resignFirstResponder];
    [password resignFirstResponder];
    [firstName resignFirstResponder];
    [lastName resignFirstResponder];
}

@end
