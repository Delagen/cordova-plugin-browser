#import "BrowserPlugin.h"

@implementation BrowserPlugin

- (void) open:(CDVInvokedUrlCommand*)command;
{
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:true];
    NSString* url = [command argumentAtIndex:0];

    if (url != nil) {
        NSURL* baseUrl = [self.webViewEngine URL];
        NSURL* absoluteUrl = [[NSURL URLWithString:url relativeToURL:baseUrl] absoluteURL];
        @try {
            [[UIApplication sharedApplication] openURL:absoluteUrl options:@{} completionHandler:nil];
        }
        @catch (NSException *exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:exception.reason];
        }
    }
    else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Url not specified"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
@end
