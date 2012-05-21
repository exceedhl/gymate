#import <UIKit/UIKit.h>

@interface GymateTableViewCell : UITableViewCell

@property (nonatomic, retain) IBOutlet UILabel *name;
@property (nonatomic, retain) IBOutlet UILabel *bodyPart;
@property (nonatomic, retain) IBOutlet UILabel *type;
@property (nonatomic, retain) IBOutlet UILabel *weight;
@property (nonatomic, retain) IBOutlet UILabel *set;
@property (nonatomic, retain) IBOutlet UILabel *repeat;

@end
