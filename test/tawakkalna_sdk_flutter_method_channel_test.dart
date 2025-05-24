import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tawakkalna_sdk_flutter/tawakkalna_sdk_flutter_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelTawakkalnaSdkFlutter platform = MethodChannelTawakkalnaSdkFlutter();
  const MethodChannel channel = MethodChannel('tawakkalna_sdk_flutter');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
