#import "TodayWorkoutViewController.h"
#import "GymateTableViewCell.h"
#import "User.h"
#import "Plan.h"
#import "Workout.h"

@interface TodayWorkoutViewController ()
- (void) createCustomViews;
@end

@implementation TodayWorkoutViewController

@synthesize workouts, dateTag, navBar;
@synthesize plan;

- (void)viewWillAppear:(BOOL)animated {
    [super viewDidLoad];
    User *user = [User loggedInUser];
    self.plan = user.plan;
}

- (void)viewDidLoad
{
    NSLog(@"view did load in today");
    tableViewCellLoader = [UINib nibWithNibName:@"GymateTableViewCell" bundle:[NSBundle mainBundle]];
    [workouts registerNib:tableViewCellLoader forCellReuseIdentifier:@"GymateTableViewCell"];
}

- (void) createCustomViews
{
    [self.view addSubview:dateTag];
    dateTag.center = CGPointMake(self.view.frame.size.width - dateTag.frame.size.width / 2, self.navBar.center.y);
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"d MMM "];
    dateTag.text = [dateFormatter stringFromDate:[NSDate date]];
    [dateFormatter release];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [plan.workouts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Workout *workout = [plan.workouts objectAtIndex:(NSUInteger) indexPath.row];
    GymateTableViewCell *cell = (GymateTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"GymateTableViewCell"];
    cell.name.text = workout.name;
    cell.bodyPart.text = workout.bodyPart;
    cell.type.text = workout.type;
    cell.weight.text = [NSString stringWithFormat:@"%dkg", workout.weight];
    cell.set.text = [NSString stringWithFormat:@"%d", workout.set];
    cell.repeat.text = [NSString stringWithFormat:@"%d", workout.repeat];
    return cell;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [workouts release];
    [dateTag release];
    [navBar release];
    [plan release];
    [super dealloc];
}

@end
