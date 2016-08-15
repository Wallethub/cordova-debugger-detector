#import <Cordova/CDV.h>

@interface DebuggerAttachmentDetector : CDVPlugin

- (void)enable:(CDVInvokedUrlCommand*)command;
- (void)disable:(CDVInvokedUrlCommand*)command;

@end