#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface TodayWorkoutViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate>
{
    UINib *tableViewCellLoader;
}

@property (nonatomic, retain) IBOutlet UITableView *workouts;
@property (nonatomic, retain) IBOutlet UITextField *dateTag;
@property (nonatomic, retain) IBOutlet UINavigationBar *navBar;

@end
