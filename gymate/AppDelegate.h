#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    UIWindow *window;
    UITabBarController *tabBarController;
}

@property (retain, nonatomic) IBOutlet UIWindow *window;
@property (retain, nonatomic) IBOutlet UITabBarController *tabBarController;

@end
