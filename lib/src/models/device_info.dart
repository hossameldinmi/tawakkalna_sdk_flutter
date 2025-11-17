import 'package:equatable/equatable.dart';

class DeviceInfo extends Equatable {
  final int apprearance;
  final String language;
  final String device;

  const DeviceInfo({required this.apprearance, required this.language, required this.device});

  static DeviceInfo? fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return null;
    return DeviceInfo(
      apprearance: int.tryParse(json['appearance']?.toString() ?? '') ?? 1,
      language: json['app_language'],
      device: json['device_model'],
    );
  }

  bool get isAppleDevice =>
      device.toLowerCase().contains('iphone') ||
      device.toLowerCase().contains('ipad') ||
      device.toLowerCase().contains('mac');

  @override
  List<Object?> get props => [apprearance, language, device];
}
