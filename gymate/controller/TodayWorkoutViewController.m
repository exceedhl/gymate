#import "TodayWorkoutViewController.h"
#import "GymateTableViewCell.h"

@interface TodayWorkoutViewController ()
- (void) createCustomViews;
@end

@implementation TodayWorkoutViewController

@synthesize workouts, dateTag, navBar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
//        Plan *plan = Plan.findByUser();
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
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
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GymateTableViewCell *cell = (GymateTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"GymateTableViewCell"];
    return cell;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [workouts release];
    [dateTag release];
    [navBar release];
    [super dealloc];
}

@end
