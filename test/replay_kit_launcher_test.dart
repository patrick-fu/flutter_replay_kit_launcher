import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:replay_kit_launcher/replay_kit_launcher.dart';

void main() {
  const MethodChannel channel = MethodChannel('replay_kit_launcher');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await ReplayKitLauncher.platformVersion, '42');
  });
}
