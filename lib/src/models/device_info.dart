import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Information about the user's device and app settings.
///
/// Contains device model, language preference, and appearance settings.
///
/// Example:
/// ```dart
/// final deviceInfo = await twk.getDeviceInfo();
/// if (deviceInfo != null) {
///   print('Device: ${deviceInfo.device}');
///   print('Language: ${deviceInfo.language}');
///   if (deviceInfo.isAppleDevice) {
///     print('User is on an Apple device');
///   }
/// }
/// ```
class DeviceInfo extends Equatable {
  /// Appearance mode (1 = light, 2 = dark)
  final ThemeMode appearance;

  /// App language preference (e.g., "en", "ar")
  final String appLanguage;

  /// Device model/name
  final String deviceModel;

  /// Operating system version
  final int osVersion;

  /// Creates a new DeviceInfo instance.
  const DeviceInfo({
    required this.appearance,
    required this.appLanguage,
    required this.deviceModel,
    required this.osVersion,
  });

  /// Creates a DeviceInfo from a JSON map.
  ///
  /// Returns null if the JSON is empty.
  static DeviceInfo? fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return null;
    return DeviceInfo(
      appearance: (int.tryParse(json['appearance']?.toString() ?? '') ?? 1) == 1 ? ThemeMode.light : ThemeMode.dark,
      appLanguage: json['app_language'],
      deviceModel: json['device_model'],
      osVersion: int.tryParse(json['os_version']?.toString() ?? '') ?? 0,
    );
  }

  /// Checks if the device is an Apple device (iPhone, iPad, Mac).
  ///
  /// Returns true if the device model contains "iphone", "ipad", or "mac".
  bool get isAppleDevice =>
      deviceModel.toLowerCase().contains('iphone') ||
      deviceModel.toLowerCase().contains('ipad') ||
      deviceModel.toLowerCase().contains('mac');

  @override
  List<Object?> get props => [appearance, appLanguage, deviceModel, osVersion];
}
