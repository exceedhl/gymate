#import "TodayWorkoutViewController.h"

@interface TodayWorkoutViewController ()

@end

@implementation TodayWorkoutViewController

@synthesize workouts, dateTag, navBar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"BG"]];
        self.view.backgroundColor = background;
        [background release];

        [self.view addSubview:dateTag];
        dateTag.center = CGPointMake(self.view.frame.size.width - dateTag.frame.size.width / 2, self.navBar.center.y);
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"d MMM "];
        dateTag.text = [dateFormatter stringFromDate:[NSDate date]];
        [dateFormatter release];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
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

@end
