
#import "CustomUnityAppController.h"
#import "EnterUnityViewController.h"
#import "NativeUnityDataManager.h"
// #import "ViewController.h"

IMPL_APP_CONTROLLER_SUBCLASS(CustomUnityAppController)

@interface CustomUnityAppController () {
    EnterUnityViewController* viewController;
}

@end

@implementation CustomUnityAppController

- (void)startUnity:(UIApplication *)application {
    
    //判断是否加载到HomeView，bool值作为全局变量存放在单例中
    if(![NativeUnityDataManager instance].isUnityLoaded) {
        

        viewController = [EnterUnityViewController new];
        
        // viewController = [story instantiateInitialViewController];
        // viewController = [story instantiateInitialViewController];
        
        //将当前window的rootViewController变成自定义的VC，实现入口的修改
        self.window.rootViewController = viewController;
        [NativeUnityDataManager instance].customUnityAppDelegate = self;
        
        //将当前window也作为全局变量存放在单例中
        [NativeUnityDataManager instance].window = self.window;
        
    } else {
        
        //启动unity
        [super startUnity:application];
    }
}

- (BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    [super application:application didFinishLaunchingWithOptions:launchOptions];
    
    // Do any additional setup after super finish launching

    return YES;
}


//- (void)applicationWillResignActive:(UIApplication *)application {
//    [super applicationWillResignActive:application];
//    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
//    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
//}
//
//- (void)applicationDidEnterBackground:(UIApplication *)application {
//    [super applicationDidEnterBackground:application];
//    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
//    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//}
//
//- (void)applicationWillEnterForeground:(UIApplication *)application {
//    [super applicationWillEnterForeground:application];
//    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
//}
//
//- (void)applicationDidBecomeActive:(UIApplication *)application {
//    [super applicationDidBecomeActive:application];
//    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//}
//
//- (void)applicationWillTerminate:(UIApplication *)application {
//    [super applicationWillTerminate:application];
//    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
//}

@end
