#import "LoginViewController.h"
#import <Parse/Parse.h>

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
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    [testObject setObject:@"bar" forKey:@"foo"];
    [testObject save];
}

- (void)dealloc {
    [email release];
    [passsword release];
    [super dealloc];
}
@end
