# ReplayKit Launcher

[![pub package](https://img.shields.io/pub/v/replay_kit_launcher.svg)](https://pub.dev/packages/replay_kit_launcher)

A flutter plugin of the launcher used to open `RPSystemBroadcastPickerView` for iOS

> Note: Only support iOS

## Related projects

### iOS

**[Shared preferences with App Group](https://pub.dev/packages/shared_preference_app_group)**: Shared preference supporting iOS App Group capability (using `-[NSUserDefaults initWithSuiteName:]`)

### Android

If you need to implement screen capture on **Android**, I have also developed a helpful plugin:

**[MediaProjection Creator](https://pub.dev/packages/media_projection_creator)**: A flutter plugin of the creator used to create `MediaProjection` instance (with requesting permission) for Android

## Usage

To use this plugin, add `replay_kit_launcher` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

### Example

1. Start

    ```dart
    /// Please fill in the name of the Broadcast Extension in your project, which is the file name of the `.appex` product
    /// [extensionName] is your `BroadCast Upload Extension` target's `Product Name`,
    /// or to be precise, the file name of the `.appex` product of the extension
    ReplayKitLauncher.launchReplayKitBroadcast('BroadcastDemoExtension');
    ```

2. Stop

    > Before using this method, you need to write some native code in the iOS native project to cooperate with it. For details, please refer to `/example/ios/BroadcastDemoExtension/ZGBroadcastManager.m`

    ```dart
    // Please fill in the CFNotification name in your iOS native project
    ReplayKitLauncher.finishReplayKitBroadcast('ZGFinishBroadcastUploadExtensionProcessNotification');
    ```

Please see the example app of this plugin for a full example.

### Another practical demo

**[https://github.com/zegoim/zego-express-example-screen-capture-flutter](https://github.com/zegoim/zego-express-example-screen-capture-flutter)**

This demo implements screen live broadcast on iOS/Android by using the **[ZEGO Express Audio and Video Flutter SDK](https://pub.dev/packages/zego_express_engine)**

#### Related articles

**[Flutter screen capture solution | Flutter 移动端屏幕采集方案分享](https://paaatrick.com/2020-11-20-flutter-screen-capture/)**

### FAQ

1. What is the `.appex` product file?

    Open your flutter project's iOS native workspace (`Runner.xcworkspace`), select `Xcode` -> `File` -> `New` -> `Target` and create a new `Broadcast Upload Extension` target.

    <center><img src=https://raw.githubusercontent.com/patrick-fu/personal_blog_image/master/image/20201210161519.png width=50%></center>

    Click `Next` and then fill in the `Product Name` field. This field is the file name of the `.appex` product file.

2. How to stop the ReplayKit broadcast process after launching?

    There are two ways to stop the ReplayKit broadcast process, one is to actively click the red button at the top of the iPhone screen, and the other is to call the `-[RPBroadcastSampleHandler finishBroadcastWithError:]` method provided by ReplayKit broadcast sub-process's `SampleHandler` instance object.

    But the question is how to invoke the method of the Replaykit sub-process's object on flutter side?

    One solution is to use cross-process notifications `CFNotificationCenterGetDarwinNotifyCenter`, post notifications on the flutter side with `Method Channel`, receive notifications on the iOS Replaykit sub-process side, and then actively invoke the `finishBroadcastWithError:` method after receiving the notification.

    The flutter plugin's `ReplayKitLauncher.finishReplayKitBroadcast()` method does this job: it uses `Method Channel` on the flutter side to notify the iOS native main process side to post cross-process notifications, the param `notificationName` is the CFNotification name.

    So you need to refer to the `/example/ios/BroadcastDemoExtension/ZGBroadcastManager.m` file to implement code on your project's `iOS ReplayKit broadcast extension sub-process side` to receive notifications and invoke `SampleHandler`'s `finishBroadcastWithError:` method to stop the ReplayKit broadcast sub-process extension.

## Contributing

Everyone is welcome to contribute code via pull requests, to help people asking for help, to add to our documentation, or to help out in any other way.
