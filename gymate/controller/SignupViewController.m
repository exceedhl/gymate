#import "SignupViewController.h"
#import "User.h"
#import "MBProgressHUD.h"

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
    [self backgroundTouch:nil];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Signing up...";
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{        
        User *user = [User user];
        user.firstName = firstName.text;
        user.lastName = lastName.text;
        user.gender = [NSNumber numberWithInt:gender.selectedSegmentIndex];
        user.email = email.text;
        user.password = password.text;
        [user signUp];       
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [self backToLoginView:nil]; 
        });
    });
    
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([firstName isFirstResponder]) {
        [lastName becomeFirstResponder];
    } else if ([lastName isFirstResponder]) {
        [lastName resignFirstResponder];
    } else if ([email isFirstResponder]) {
        [password becomeFirstResponder];
    } else if ([password becomeFirstResponder]) {
        // Enable Join only if all mandatory fields are filled
        [self signup:nil];
    }
    return NO;
}

@end
