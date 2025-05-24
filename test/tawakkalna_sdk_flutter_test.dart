import 'package:flutter_test/flutter_test.dart';
import 'package:tawakkalna_sdk_flutter/tawakkalna_sdk_flutter.dart';
import 'package:tawakkalna_sdk_flutter/tawakkalna_sdk_flutter_platform_interface.dart';
import 'package:tawakkalna_sdk_flutter/tawakkalna_sdk_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTawakkalnaSdkFlutterPlatform
    with MockPlatformInterfaceMixin
    implements TawakkalnaSdkFlutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final TawakkalnaSdkFlutterPlatform initialPlatform = TawakkalnaSdkFlutterPlatform.instance;

  test('$MethodChannelTawakkalnaSdkFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTawakkalnaSdkFlutter>());
  });

  test('getPlatformVersion', () async {
    TawakkalnaSdkFlutter tawakkalnaSdkFlutterPlugin = TawakkalnaSdkFlutter();
    MockTawakkalnaSdkFlutterPlatform fakePlatform = MockTawakkalnaSdkFlutterPlatform();
    TawakkalnaSdkFlutterPlatform.instance = fakePlatform;

    expect(await tawakkalnaSdkFlutterPlugin.getPlatformVersion(), '42');
  });
}
