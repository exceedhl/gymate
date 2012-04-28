#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface SignupViewController : BaseViewController <UITextFieldDelegate> 

@property (nonatomic, retain) IBOutlet UITextField *firstName;
@property (nonatomic, retain) IBOutlet UITextField *lastName;
@property (nonatomic, retain) IBOutlet UISegmentedControl *gender;
@property (nonatomic, retain) IBOutlet UITextField *email;
@property (nonatomic, retain) IBOutlet UITextField *password;
@property (nonatomic, retain) IBOutlet UITextField *height;
@property (nonatomic, retain) IBOutlet UITextField *weight;

- (IBAction)signup:(id)sender;
- (IBAction)backToLoginView:(id)sender;

@end
