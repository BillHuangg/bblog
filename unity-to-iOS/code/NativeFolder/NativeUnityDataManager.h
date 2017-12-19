

#import <Foundation/Foundation.h>
#import "CustomUnityAppController.h"

@interface NativeUnityDataManager : NSObject

@property (nonatomic) BOOL isUnityLoaded;
@property (nonatomic) BOOL isUnityViewRotated;

@property (strong, nonatomic) UIViewController *unityViewController;
@property (strong, nonatomic) UIViewController *previousViewController;
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CustomUnityAppController *customUnityAppDelegate;

+ (NativeUnityDataManager*) instance;

@end
