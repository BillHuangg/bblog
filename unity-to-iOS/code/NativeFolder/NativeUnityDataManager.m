

#import "NativeUnityDataManager.h"

@implementation NativeUnityDataManager

+ (NativeUnityDataManager*) instance
{
    static NativeUnityDataManager *_instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        _instance = [[self alloc]init];
        _instance.isUnityLoaded = false;
    });
    return _instance;
}

@end
