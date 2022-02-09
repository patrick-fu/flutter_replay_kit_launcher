//
//  ZGBroadcastManager.m
//  BroadcastDemoExtension
//
//  Created by Patrick Fu on 2020/11/5.
//

#import "ZGBroadcastManager.h"

#define ZG_NOTIFICATION_NAME @"ZGFinishBroadcastUploadExtensionProcessNotification"


static ZGBroadcastManager *_sharedManager = nil;


@interface ZGBroadcastManager ()

@property (nonatomic, weak) RPBroadcastSampleHandler *sampleHandler;

@end


@implementation ZGBroadcastManager

+ (instancetype)sharedManager {
    if (!_sharedManager) {
        @synchronized (self) {
            if (!_sharedManager) {
                _sharedManager = [[self alloc] init];
            }
        }
    }
    return _sharedManager;
}

- (void)startBroadcast:(RPBroadcastSampleHandler *)sampleHandler {

    self.sampleHandler = sampleHandler;

    // Add an observer for stop broadcast notification
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
                                    (__bridge const void *)(self),
                                    onBroadcastFinish,
                                    (CFStringRef)ZG_NOTIFICATION_NAME,
                                    NULL,
                                    CFNotificationSuspensionBehaviorDeliverImmediately);


    // Do some business logic when starting screen capture here.

}

- (void)stopBroadcast {
    // Remove observer for stop broadcast notification
    CFNotificationCenterRemoveObserver(CFNotificationCenterGetDarwinNotifyCenter(),
                                       (__bridge const void *)(self),
                                       (CFStringRef)ZG_NOTIFICATION_NAME,
                                       NULL);


    // Do some business logic when finishing screen capture here.
}

- (void)handleSampleBuffer:(CMSampleBufferRef)sampleBuffer withType:(RPSampleBufferType)sampleBufferType {

    // This example demo does nothing with the sample buffer.

    // Developers need to implement their own business logic.
}


#pragma mark - Finish broadcast function

// Handle stop broadcast notification from main app process
void onBroadcastFinish(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {

    // Stop broadcast
    [[ZGBroadcastManager sharedManager] stopBroadcast];

    RPBroadcastSampleHandler *handler = [ZGBroadcastManager sharedManager].sampleHandler;
    if (handler) {
        // Finish broadcast extension process with no error
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Wnonnull"
        [handler finishBroadcastWithError:nil];
        #pragma clang diagnostic pop
    } else {
        NSLog(@"⚠️ RPBroadcastSampleHandler is null, can not stop broadcast upload extension process");
    }
}

@end
