#import "UnityCallNativeEventCollection.h"
#import "NativeUnityDataManager.h"

@implementation UnityCallNativeEventCollection

#if defined(__cplusplus)
extern "C" {
#endif
    
    bool Unity_Call_iOS_Error_Event(char *message) {
        
        return true;
    }
    
    bool Unity_Call_iOS_Message_Event(char * message, char * action) {
        
        NSString *messageString = [NSString stringWithUTF8String:message];
        NSString *actionString = [NSString stringWithUTF8String:action];
	    
        return true;
    }
    
#if defined(__cplusplus)
}
#endif

@end
