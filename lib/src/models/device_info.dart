class DeviceInfo {
  final int apprearance;
  final String language;
  final String device;

  DeviceInfo({required this.apprearance, required this.language, required this.device});

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
}
