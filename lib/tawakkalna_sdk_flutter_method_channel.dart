import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'tawakkalna_sdk_flutter_platform_interface.dart';

/// An implementation of [TawakkalnaSdkFlutterPlatform] that uses method channels.
class MethodChannelTawakkalnaSdkFlutter extends TawakkalnaSdkFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('tawakkalna_sdk_flutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
