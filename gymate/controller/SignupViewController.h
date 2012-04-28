#import <UIKit/UIKit.h>

@interface SignupViewController : UIViewController <UITextFieldDelegate> {
    UITextField *firstName;
    UITextField *lastName;
    UISegmentedControl *gender;
    UITextField *email;
    UITextField *password;
}

@property (nonatomic, retain) IBOutlet UITextField *firstName;
@property (nonatomic, retain) IBOutlet UITextField *lastName;
@property (nonatomic, retain) IBOutlet UISegmentedControl *gender;
@property (nonatomic, retain) IBOutlet UITextField *email;
@property (nonatomic, retain) IBOutlet UITextField *password;
@property (nonatomic, retain) IBOutlet UINavigationItem *customNavigationItem;

- (IBAction)signup:(id)sender;
- (IBAction)backToLoginView:(id)sender;
- (IBAction)backgroundTouch:(id)sender;
@end
