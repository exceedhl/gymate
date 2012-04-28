#import "SignupViewController.h"
#import "User.h"
#import "MBProgressHUD.h"

@implementation SignupViewController

@synthesize firstName, lastName, gender, email, password, customNavigationItem;

- (void)viewDidLoad
{
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(backToLoginView:)];
    [self.customNavigationItem setRightBarButtonItem:backButton];
    [backButton release];
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
    [self addPullUpAnimation];
    [self.navigationController popViewControllerAnimated:NO];
}

- (IBAction)backgroundTouch:(id)sender {
    [email resignFirstResponder];
    [password resignFirstResponder];
    [firstName resignFirstResponder];
    [lastName resignFirstResponder];
}


- (void)addPullUpAnimation {
    CATransition *transition = [CATransition animation];
    transition.duration = 0.7;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromTop;
    transition.delegate = self;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
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
