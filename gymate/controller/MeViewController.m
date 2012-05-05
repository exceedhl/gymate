#import "MeViewController.h"
#import "User.h"

@interface MeViewController ()

@end

@implementation MeViewController

@synthesize name, weight, height;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    User *user = [User currentUser];
    if (user) {
        name.text = $str(@"%@ %@", user.firstName, user.lastName);
        weight.text = $str(@"%@kg", user.weight);
        height.text = $str(@"%@cm", user.height);
    }
}

- (void)dealloc {
    [name release];
    [weight release];
    [height release];
    [super dealloc];
}

@end
