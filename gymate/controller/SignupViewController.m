#import "SignupViewController.h"
#import "User.h"
#import "MBProgressHUD.h"

#define PORTRAIT_KEYBOARD_HEIGHT 216
#define MIN_GAP_BETWEEN_KEYBOARD_AND_TEXT_FIELD 5

@interface SignupViewController ()

-(void)moveViewUp:(CGFloat)deltaY;

@end

@implementation SignupViewController

@synthesize firstName, lastName, gender, email, password, height, weight;

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
    [self.view endEditing:YES];
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
    if ([email isFirstResponder]) {
        [password becomeFirstResponder];
    } else if ([password isFirstResponder]) {
        [firstName becomeFirstResponder];
    } else if ([firstName isFirstResponder]) {
        [lastName becomeFirstResponder];
    } else if ([lastName isFirstResponder]) {
        [height becomeFirstResponder];
    } else if ([height isFirstResponder]) {
        [weight becomeFirstResponder];
    } else if ([weight isFirstResponder]) {
        [self signup:nil];
    }
    return NO;
}

-(void)moveViewUp:(CGFloat)deltaY
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    
    CGRect rect = self.view.frame;
    rect.origin.y = -(deltaY + MIN_GAP_BETWEEN_KEYBOARD_AND_TEXT_FIELD);
    self.view.frame = rect;
    
    [UIView commitAnimations];
}


- (void)textFieldDidBeginEditing:(UITextField *)sender
{
    CGFloat bottomYOfTextField = sender.frame.size.height + sender.frame.origin.y;
    CGFloat deltaY = PORTRAIT_KEYBOARD_HEIGHT - (self.view.frame.size.height - bottomYOfTextField);
    if ( deltaY > 0) {
        [self moveViewUp:deltaY];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)sender
{
    [self moveViewUp:0];   
}

@end
