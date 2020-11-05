//
//  ZGBroadcastManager.h
//  BroadcastDemoExtension
//
//  Created by Patrick Fu on 2020/11/5.
//

#import <Foundation/Foundation.h>
#import <ReplayKit/ReplayKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZGBroadcastManager : NSObject

+ (instancetype)sharedManager;

/// Invoke this function in [-broadcastStartedWithSetupInfo:]
///
/// @param sampleHandler SampleHandler instance
- (void)startBroadcast:(RPBroadcastSampleHandler *)sampleHandler;

/// Invoke this function in [-broadcastFinished]
///
/// @param completion completion block
- (void)stopBroadcast;

/// Handles ReplayKit's SampleBuffer, supports receiving video and audio buffer.
///
/// @param sampleBuffer Video or audio buffer returned by ReplayKit
/// @param sampleBufferType Buffer type returned by ReplayKit
- (void)handleSampleBuffer:(CMSampleBufferRef)sampleBuffer withType:(RPSampleBufferType)sampleBufferType;

@end

NS_ASSUME_NONNULL_END
