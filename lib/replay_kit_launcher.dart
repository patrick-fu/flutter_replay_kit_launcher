
import 'dart:async';

import 'package:flutter/services.dart';

class ReplayKitLauncher {
  static const MethodChannel _channel =
      const MethodChannel('replay_kit_launcher');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
