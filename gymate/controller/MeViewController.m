#import "MeViewController.h"
#import "User.h"
#import "Profile.h"
#import "MyPlanController.h"

@interface MeViewController ()

@end

@implementation MeViewController


@synthesize name, weight, height, myPlan;


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

- (IBAction)myPlan:(id)sender {
    MyPlanController *controller = [[[MyPlanController alloc] initWithNibName:@"myPlanView" bundle:nil] autorelease];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)dealloc {
    [name release];
    [weight release];
    [height release];
    [myPlan release];
    [super dealloc];
}

@end
