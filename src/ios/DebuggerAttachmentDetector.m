#import "DebuggerAttachmentDetector.h"
#import <Cordova/CDV.h>
#include <assert.h>
#include <stdbool.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/sysctl.h>
@implementation DebuggerAttachmentDetector

- (void)enable:(CDVInvokedUrlCommand*)command
{
    [[NSUserDefaults standardUserDefaults] setObject:@"y" forKey:@"enable"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    NSArray *arg=command.arguments;
    if ([arg count]>0) {
        float f=[[arg firstObject] floatValue];
        [NSTimer scheduledTimerWithTimeInterval:f target:self selector:@selector(checkDebugger) userInfo:nil repeats:YES];
    }
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Enabled..."];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)disable:(CDVInvokedUrlCommand*)command
{
    [[NSUserDefaults standardUserDefaults] setObject:@"n" forKey:@"enable"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Disabled..."];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
-(void)checkDebugger{
    
    NSString *enabled = [[NSUserDefaults standardUserDefaults] stringForKey:@"enable"];
    if([enabled isEqualToString:@"y"]){
        NSLog(@"checking......");
        BOOL isDebugger=[self isDebuggerAttached];
        if(isDebugger){
            exit(0);
            NSLog(@"Debugger Attachement Found.");
            //        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"found" message:@"found" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            //        [alert show];
        }
    }
    
}
- (BOOL)isDebuggerAttached {
    BOOL debuggerIsAttached = NO;
    
    //static dispatch_once_t debuggerPredicate;
    //dispatch_once(&debuggerPredicate, ^{
    struct kinfo_proc info;
    size_t info_size = sizeof(info);
    int name[4];
    
    name[0] = CTL_KERN;
    name[1] = KERN_PROC;
    name[2] = KERN_PROC_PID;
    name[3] = getpid();
    
    if (sysctl(name, 4, &info, &info_size, NULL, 0) == -1) {
        NSLog(@"[HockeySDK] ERROR: Checking for a running debugger via sysctl() failed: %s", strerror(errno));
        debuggerIsAttached = false;
    }
    
    if (!debuggerIsAttached && (info.kp_proc.p_flag & P_TRACED) != 0)
        debuggerIsAttached = true;
    //});
    
    return debuggerIsAttached;
}
//- (BOOL)isDebuggerAttached {
//    static BOOL debuggerIsAttached = NO;
//
//    static dispatch_once_t debuggerPredicate;
//    dispatch_once(&debuggerPredicate, ^{
//        struct kinfo_proc info;
//        size_t info_size = sizeof(info);
//        int name[4];
//
//        name[0] = CTL_KERN;
//        name[1] = KERN_PROC;
//        name[2] = KERN_PROC_PID;
//        name[3] = getpid();
//
//        if (sysctl(name, 4, &info, &info_size, NULL, 0) == -1) {
//            NSLog(@"[HockeySDK] ERROR: Checking for a running debugger via sysctl() failed: %s", strerror(errno));
//            debuggerIsAttached = false;
//        }
//
//        if (!debuggerIsAttached && (info.kp_proc.p_flag & P_TRACED) != 0)
//            debuggerIsAttached = true;
//    });
//
//    return debuggerIsAttached;
//}
@end