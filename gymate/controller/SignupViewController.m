#import "SignupViewController.h"
#import "User.h"
#import "MBProgressHUD.h"
#import "ConciseKit.h"

#define PORTRAIT_KEYBOARD_HEIGHT 216
#define MIN_GAP_BETWEEN_KEYBOARD_AND_TEXT_FIELD 5

@interface SignupViewController ()

-(void)moveViewUp:(CGFloat)deltaY;
- (void)keyboardWillHide:(NSNotification *)notif;

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

- (void)handleReturnKeyOfTextFields:(NSArray *)textFields withAction:(void (^)(void))action
{
    for (int i = 0; i < [textFields count]; i++) {
        if ([[textFields objectAtIndex:i] isFirstResponder]) {
            if (i + 1 < [textFields count]) {
                [[textFields objectAtIndex:(i + 1)] becomeFirstResponder];
            }
            else {
                action();
            }
            break;
        }
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSArray *textFields = $arr(email, password, firstName, lastName, height, weight);
    [self handleReturnKeyOfTextFields:textFields withAction:^(void) {
        [self signup:nil];
    }];
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
    } else {
        [self moveViewUp:0];
    }
}

- (void)keyboardWillHide:(NSNotification *)notif
{
    [self moveViewUp:0];   
}

- (void)viewWillAppear:(BOOL)animated
{
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) 
                                                 name:UIKeyboardWillHideNotification object:self.view.window]; 
}

- (void)viewWillDisappear:(BOOL)animated
{
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil]; 
}

@end
