@class Workout;
@class User;
@class Plan;

@interface Fixture : NSObject
{
    User *adam;
    User *userWithoutPlan;
    Plan *planOfAdam;
    Workout *workoutShoulderPress;
    Workout *workoutPushup;
    Workout *workoutTreadmill;
}

@property(nonatomic, retain) User *adam;
@property(nonatomic, retain) User *userWithoutPlan;

@property(nonatomic, retain) Plan *planOfAdam;

@property(nonatomic, retain) Workout *workoutShoulderPress;
@property(nonatomic, retain) Workout *workoutPushup;
@property(nonatomic, retain) Workout *workoutTreadmill;

+ (Fixture *)fixture;

- (Fixture *)createData;
- (Fixture *)createUsers;
- (Fixture *)createPlans;
- (Fixture *)createWorkouts;

- (Fixture *)destroyObjects:(NSString *)className;
- (Fixture *)destroyAllData;

@end
