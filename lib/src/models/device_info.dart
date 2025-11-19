import 'package:equatable/equatable.dart';

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
  final int apprearance;

  /// App language preference (e.g., "en", "ar")
  final String language;

  /// Device model/name
  final String device;

  /// Creates a new DeviceInfo instance.
  const DeviceInfo({required this.apprearance, required this.language, required this.device});

  /// Creates a DeviceInfo from a JSON map.
  ///
  /// Returns null if the JSON is empty.
  static DeviceInfo? fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return null;
    return DeviceInfo(
      apprearance: int.tryParse(json['appearance']?.toString() ?? '') ?? 1,
      language: json['app_language'],
      device: json['device_model'],
    );
  }

  /// Checks if the device is an Apple device (iPhone, iPad, Mac).
  ///
  /// Returns true if the device model contains "iphone", "ipad", or "mac".
  bool get isAppleDevice =>
      device.toLowerCase().contains('iphone') ||
      device.toLowerCase().contains('ipad') ||
      device.toLowerCase().contains('mac');

  @override
  List<Object?> get props => [apprearance, language, device];
}
