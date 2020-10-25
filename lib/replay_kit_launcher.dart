
import 'dart:async';

import 'package:flutter/services.dart';

class ReplayKitLauncher {
  static const MethodChannel _channel =
      const MethodChannel('replay_kit_launcher');

  /// This function will directly create a free RPSystemBroadcastPickerView and automatically click the View to launch ReplayKit
  ///
  /// [extensionName] is your `BroadCast Upload Extension` target's `Product Name`,
  /// or to be precise, the file name of the `.appex` product of the extension
  static Future<void> launchReplayKitBroadcast(String extensionName) async {
    await _channel.invokeMethod('launchReplayKitBroadcast', {
      'extensionName': extensionName
    });
  }

}
