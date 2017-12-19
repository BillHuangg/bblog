
#import "EnterUnityViewController.h"
#import "NativeUnityDataManager.h"

@interface EnterUnityViewController ()

@end

@implementation EnterUnityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)startUnityButtonEvent:(id)sender {
        
    // 判断是否是第一次启动unity
    if([NativeUnityDataManager instance].isUnityLoaded) {

        //将存放在单例中的unityViewController变成当前的rootVC
        [NativeUnityDataManager instance].window.rootViewController = [NativeUnityDataManager instance].unityViewController;
        
        //将unityVC放到window的最上面
        [[NativeUnityDataManager instance].window bringSubviewToFront: [NativeUnityDataManager instance].unityViewController.view];
        
        // 让unity的界面显示出来
        [[[UnityGetMainWindow() rootViewController] view]setHidden:NO];
        [UnityGetMainWindow() makeKeyAndVisible];
        
        UnityPause(false);
        
    } else {
        
        [NativeUnityDataManager instance].isUnityLoaded = true;
        
        //启动unity
        [[NativeUnityDataManager instance].customUnityAppDelegate startUnity:UIApplication.sharedApplication];
        
//        
//        //生成返回键
//        UIView *pauseUnityView = [[UIView alloc] initWithFrame:CGRectMake(5, 5, 40, 40)];
//        UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 5, 30, 30)];
//        [backBtn addTarget:self action:@selector(backButtonEvent) forControlEvents:UIControlEventTouchDown];
//        [backBtn setBackgroundColor:[UIColor whiteColor]];
//        [pauseUnityView addSubview:backBtn];
//        
//        [[NativeUnityDataManager instance].window.rootViewController.view addSubview:pauseUnityView];
    }
    
    //UnitySendMessage("Main Camera", "NativeCallUnityResumeEvent", "");
}

/**
 *  返回键函数
 */
- (void)backButtonEvent {
    
    // UnitySendMessage("Main Camera", "NativeCallUnityPauseEvent", "");
    
    //跳转回iOS部分时需要暂停unity
    [NSTimer scheduledTimerWithTimeInterval: 0.5f target:self selector:@selector(pauseUnityAsync) userInfo:nil repeats:NO];
    
    //将unity的rootVC存在单例中防止被释放掉
    [NativeUnityDataManager instance].unityViewController = [NativeUnityDataManager instance].window.rootViewController;
    
    //隐藏Unity的rootVC
    [[[UnityGetMainWindow() rootViewController] view] setHidden:YES];
    
    //将当前界面B作为当前window的rootVC
    [NativeUnityDataManager instance].window.rootViewController = self;
    
    [UnityGetMainWindow() makeKeyAndVisible];
}

-(void) pauseUnityAsync {
    UnityPause(true);
}

@end
