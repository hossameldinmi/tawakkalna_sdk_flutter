import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'tawakkalna_sdk_flutter_method_channel.dart';

abstract class TawakkalnaSdkFlutterPlatform extends PlatformInterface {
  /// Constructs a TawakkalnaSdkFlutterPlatform.
  TawakkalnaSdkFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static TawakkalnaSdkFlutterPlatform _instance = MethodChannelTawakkalnaSdkFlutter();

  /// The default instance of [TawakkalnaSdkFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelTawakkalnaSdkFlutter].
  static TawakkalnaSdkFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TawakkalnaSdkFlutterPlatform] when
  /// they register themselves.
  static set instance(TawakkalnaSdkFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
