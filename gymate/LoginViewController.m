#import "LoginViewController.h"

@implementation LoginViewController

@synthesize email;
@synthesize passsword;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (IBAction)login:(id)sender {
    NSLog(@"login prssed");
    NSLog(@"%@", email.text);
    NSLog(@"%@", passsword.text);
}

- (void)dealloc {
    [email release];
    [passsword release];
    [super dealloc];
}
@end
