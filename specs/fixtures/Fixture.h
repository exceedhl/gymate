@class Workout;
@class User;
@class Plan;

@interface Fixture : NSObject
{
    User *adam;
    Plan *planOfAdam;
    Workout *workoutShoulderPress;
    Workout *workoutPushup;
    Workout *workoutTreadmill;
}

@property(nonatomic, retain) User *adam;
@property(nonatomic, retain) Plan *planOfAdam;
@property(nonatomic, retain) Workout *workoutShoulderPress;
@property(nonatomic, retain) Workout *workoutPushup;
@property(nonatomic, retain) Workout *workoutTreadmill;

+ (Fixture *)fixture;

- (void)createData;
- (void)destroyAllData;

- (void)createUsers;
- (void)destroyUsers;

- (void)createPlans;

@end
