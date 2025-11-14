/// URL type enum for different URL schemes
enum UrlType {
  /// HTTP/HTTPS URL
  http(1),

  /// Telephone number (tel:)
  tel(2),

  /// Email address (mailto:)
  mailTo(3),

  /// Deep link URL
  deepLink(4),

  /// SMS message (sms:)
  sms(5);

  /// The integer value associated with this URL type
  final int value;

  const UrlType(this.value);

  /// Creates a UrlType from an integer value
  /// Returns null if the value doesn't match any URL type
  static UrlType? fromValue(int? value) {
    if (value == null) return null;
    try {
      return UrlType.values.firstWhere((e) => e.value == value);
    } catch (_) {
      return null;
    }
  }
}
