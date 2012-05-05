#import "AppDelegate.h"
#import "LoginViewController.h"
#import "User.h"

#define GYMATE_BG_COLOR_RED 57
#define GYMATE_BG_COLOR_GREEN 59
#define GYMATE_BG_COLOR_BLUE 66

@implementation AppDelegate

@synthesize window, tabBarController;

- (void)dealloc
{
    [window release];
    [tabBarController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Parse setApplicationId:@"LgeuExxvIpU5ZLyXeSwCk4AKj4aD1a5ViPtcef2m" 
                  clientKey:@"HrEukR6VwxpXOkiwt2XQRiDR92knGg9MguD2MESS"];
    self.window.backgroundColor = [UIColor colorWithRed:GYMATE_BG_COLOR_RED/255.0 green:GYMATE_BG_COLOR_GREEN/255.0 blue:GYMATE_BG_COLOR_BLUE/255.0 alpha:1];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = self.tabBarController;
    if (![User currentUser]) {
        [tabBarController.view setHidden:YES];
        LoginViewController *loginViewController = [[[LoginViewController alloc] initWithNibName:@"loginView" bundle:nil] autorelease];
        UINavigationController *navigationController = [[[UINavigationController alloc]initWithRootViewController:loginViewController] autorelease];
        [navigationController setNavigationBarHidden:YES];
        double delayInSeconds = 0.1;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [self.tabBarController setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
            [self.tabBarController presentModalViewController:navigationController animated:NO];
        });
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
