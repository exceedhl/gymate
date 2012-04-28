#import <UIKit/UIKit.h>

@interface SignupViewController : UIViewController <UITextFieldDelegate> {

}

@property (nonatomic, retain) IBOutlet UITextField *firstName;
@property (nonatomic, retain) IBOutlet UITextField *lastName;
@property (nonatomic, retain) IBOutlet UISegmentedControl *gender;
@property (nonatomic, retain) IBOutlet UITextField *email;
@property (nonatomic, retain) IBOutlet UITextField *password;
@property (nonatomic, retain) IBOutlet UITextField *height;
@property (nonatomic, retain) IBOutlet UITextField *weight;

- (IBAction)signup:(id)sender;
- (IBAction)backToLoginView:(id)sender;
- (IBAction)backgroundTouch:(id)sender;
@end
