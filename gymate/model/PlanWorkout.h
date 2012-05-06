#import <Foundation/Foundation.h>
#import "BaseObject.h"

@class Plan, Workout;


@interface PlanWorkout : BaseObject

@property(nonatomic, retain) Plan *plan;
@property(nonatomic, retain) Workout *workout;

+ (PlanWorkout *)planWorkoutWithPlan:(Plan *)aPlan andWorkout:(Workout *)aWorkout;

@end