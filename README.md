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

```dart
/// Please fill in the name of the Broadcast Extension in your project, which is the file name of the `.appex` product
/// [extensionName] is your `BroadCast Upload Extension` target's `Product Name`,
/// or to be precise, the file name of the `.appex` product of the extension
ReplayKitLauncher.launchReplayKitBroadcast('BroadcastDemoExtension');
```

Please see the example app of this plugin for a full example.

### Another practical demo

**[https://github.com/zegoim/zego-express-example-screen-capture-flutter](https://github.com/zegoim/zego-express-example-screen-capture-flutter)**

This demo implements screen live broadcast on iOS/Android by using the **[ZEGO Express Audio and Video Flutter SDK](https://pub.dev/packages/zego_express_engine)**

## Contributing

Everyone is welcome to contribute code via pull requests, to help people asking for help, to add to our documentation, or to help out in any other way.
