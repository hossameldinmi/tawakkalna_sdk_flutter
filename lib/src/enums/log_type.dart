/// Log type enum for different logging levels
enum LogType {
  /// Info log level
  info(1),

  /// Warning log level
  warning(2),

  /// Error log level
  error(3),

  /// Debug log level
  debug(4);

  /// The integer value associated with this log type
  final int value;

  const LogType(this.value);

  /// Creates a LogType from an integer value
  /// Returns null if the value doesn't match any log type
  static LogType? fromValue(int? value) {
    if (value == null) return null;
    try {
      return LogType.values.firstWhere((e) => e.value == value);
    } catch (_) {
      return null;
    }
  }
}
