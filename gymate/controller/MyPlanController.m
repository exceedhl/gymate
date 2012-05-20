#import "MyPlanController.h"


@implementation MyPlanController

@synthesize addExercise;

- (void)viewDidLoad {
    self.navigationItem.rightBarButtonItem = addExercise;
    [super viewDidLoad];
}

- (void)dealloc {
    [addExercise release];
    [super dealloc];
}

@end