#import "SignupViewController.h"
#import "User.h"
#import "MBProgressHUD.h"
#import "UIViewController+Gymate.h"
#import "UITextField+Gymate.h"
#import "SVSegmentedControl.h"

#define PORTRAIT_KEYBOARD_HEIGHT 216
#define MIN_GAP_BETWEEN_KEYBOARD_AND_TEXT_FIELD 5
#define MAX_HEIGHT_WEIGHT_LENGTH 3

#define GYMATE_TINT_COLOR_RED 255
#define GYMATE_TINT_COLOR_GREEN 156
#define GYMATE_TINT_COLOR_BLUE 52

@interface SignupViewController ()

- (void)moveViewUp:(CGFloat)deltaY;
- (void)keyboardWillHide:(NSNotification *)notif;
- (void)createCustomViews;

@end

@implementation SignupViewController

@synthesize firstName, lastName, gender, email, password, height, weight;

- (void)createCustomViews
{
    gender = [[SVSegmentedControl alloc] initWithSectionTitles:$arr(@"Male", @"Female")];
    gender.crossFadeLabelsOnDrag = YES;
    gender.thumb.tintColor = [UIColor colorWithRed:GYMATE_TINT_COLOR_RED/255.0 green:GYMATE_TINT_COLOR_GREEN/255.0 blue:GYMATE_TINT_COLOR_BLUE/255.0 alpha:1];
    gender.height = firstName.frame.size.height;
    [self.view addSubview:gender];
    gender.center = CGPointMake(212, 255);
}

- (void)dealloc
{
    [gender release];
    [super dealloc];
}

- (void)viewDidLoad {    
    [height setRightLabel:@"cm"];
    [weight setRightLabel:@"kg"];
    [self setLeftPadding:8 forTextFields:$arr(email, password, firstName, lastName, height, weight)];
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

- (IBAction)signup:(id)sender {
    [self hideKeyboard:nil];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Signing up...";
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{        
        User *user = [User user];
        user.firstName = firstName.text;
        user.lastName = lastName.text;
        user.gender = [NSNumber numberWithInt:gender.selectedIndex];
        user.email = email.text;
        user.passwd = password.text;
        //TODO: Should we make height and weight NSNumber? - Yuan
        user.height = height.text;
        user.weight = weight.text;
        @try {
            [user signUp];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        @catch (NSException *exception) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self showAlertWithTitle:[exception name] andMessage:[exception reason]];
            });
            return;
        }
        @finally {
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUDForView:self.view animated:YES];
            });            
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self backToLoginView:nil]; 
        });
    });
    
}

- (IBAction)backToLoginView:(id)sender 
{
    [self setTransitionAnimation:self.navigationController.view withType:kCATransitionFromTop];
    [self.navigationController popViewControllerAnimated:NO];
}

#pragma UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSArray *textFields = $arr(email, password, firstName, lastName, height, weight);
    [self handleReturnKeyOfTextFields:textFields withAction:^{
        [self signup:nil];
    }];
    return NO;
}


- (void)textFieldDidBeginEditing:(UITextField *)sender
{
    CGFloat bottomYOfTextField = sender.frame.size.height + sender.frame.origin.y;
    CGFloat deltaY = PORTRAIT_KEYBOARD_HEIGHT - (self.view.frame.size.height - bottomYOfTextField);
    if ( deltaY > 0) {
        [self moveViewUp:(deltaY + MIN_GAP_BETWEEN_KEYBOARD_AND_TEXT_FIELD)];
    } else {
        [self moveViewUp:0];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == height && height.text.length >= 3) {
        return NO;
    }
    if (textField == weight && weight.text.length >= 3) {
        return NO;
    }
    return YES;
}

#pragma Private methods

-(void)moveViewUp:(CGFloat)deltaY
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    
    CGRect rect = self.view.frame;
    rect.origin.y = -deltaY;
    self.view.frame = rect;
    
    [UIView commitAnimations];
}

- (void)keyboardWillHide:(NSNotification *)notif
{
    [self moveViewUp:0];   
}



@end
