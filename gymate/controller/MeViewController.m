#import "MeViewController.h"
#import "User.h"
#import "Profile.h"

@interface MeViewController ()

@end

@implementation MeViewController

@synthesize name, weight, height;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    User *user = [User loggedInUser];
    if (user) {
        Profile *profile = user.profile;
        name.text = $str(@"%@ %@", profile.firstName, profile.lastName);
        weight.text = $str(@"%@kg", profile.weight);
        height.text = $str(@"%@cm", profile.height);
    }
}

- (void)dealloc {
    [name release];
    [weight release];
    [height release];
    [super dealloc];
}

@end
