import 'dart:collection';

/// Log level for categorizing log messages
enum LogLevel {
  debug,
  info,
  warning,
  error,
}

/// A single log entry
class LogEntry {
  final DateTime timestamp;
  final LogLevel level;
  final String message;
  final String? source;
  final dynamic data;

  LogEntry({
    required this.timestamp,
    required this.level,
    required this.message,
    this.source,
    this.data,
  });

  String get levelIcon {
    switch (level) {
      case LogLevel.debug:
        return '🔍';
      case LogLevel.info:
        return 'ℹ️';
      case LogLevel.warning:
        return '⚠️';
      case LogLevel.error:
        return '❌';
    }
  }

  String get levelName {
    switch (level) {
      case LogLevel.debug:
        return 'DEBUG';
      case LogLevel.info:
        return 'INFO';
      case LogLevel.warning:
        return 'WARNING';
      case LogLevel.error:
        return 'ERROR';
    }
  }

  /// Gets the formatted time string for the log entry.
  ///
  /// Returns time in HH:MM:SS.mmm format.
  String get timeString {
    final h = timestamp.hour.toString().padLeft(2, '0');
    final m = timestamp.minute.toString().padLeft(2, '0');
    final s = timestamp.second.toString().padLeft(2, '0');
    final ms = timestamp.millisecond.toString().padLeft(3, '0');
    return '$h:$m:$s.$ms';
  }

  @override
  String toString() {
    final sourceStr = source != null ? ' [$source]' : '';
    final dataStr = data != null ? '\n  Data: $data' : '';
    return '[$timeString] $levelIcon $levelName$sourceStr: $message$dataStr';
  }
}

/// Singleton logger for the Tawakkalna SDK.
///
/// Provides centralized logging with level filtering, memory management,
/// and listener support for log streaming.
///
/// Features:
/// - Automatic memory management (keeps last 1000 logs)
/// - Enable/disable logging dynamically
/// - Filter logs by level
/// - Stream logs to listeners
/// - Console output in debug mode
///
/// Example:
/// ```dart
/// final logger = TwkLogger();
/// logger.info('User logged in');
/// logger.error('Failed to fetch data', data: {'error': 'Network timeout'});
///
/// // Add a listener
/// logger.addListener((entry) {
///   print('New log: ${entry.message}');
/// });
///
/// // Disable logging
/// logger.setEnabled(false);
/// ```
class TwkLogger {
  static final TwkLogger _instance = TwkLogger._internal();

  factory TwkLogger() => _instance;

  TwkLogger._internal();

  final _logs = Queue<LogEntry>();

  /// Maximum number of logs to keep in memory before old ones are discarded
  final _maxLogs = 1000;

  /// List of listener callbacks for log updates
  final _logStreamController = <void Function(LogEntry)>[];

  /// Whether logging is enabled (default: true)
  bool _enabled = true;

  /// Returns whether logging is currently enabled
  bool get isEnabled => _enabled;

  /// Enables or disables logging.
  ///
  /// When disabled, all logs are cleared to free memory.
  ///
  /// Parameters:
  /// - [enabled]: true to enable logging, false to disable
  void setEnabled(bool enabled) {
    _enabled = enabled;
    if (!enabled) {
      clear(); // Clear logs when disabling to free memory
    }
  }

  /// Returns all logged entries.
  List<LogEntry> get logs => _logs.toList();

  /// Returns logs filtered by a specific level.
  ///
  /// Parameters:
  /// - [level]: The log level to filter by
  List<LogEntry> getLogsByLevel(LogLevel level) {
    return _logs.where((log) => log.level == level).toList();
  }

  /// Returns the most recent logs.
  ///
  /// Parameters:
  /// - [count]: Number of recent logs to return
  List<LogEntry> getRecentLogs(int count) {
    final list = _logs.toList();
    if (list.length <= count) return list;
    return list.sublist(list.length - count);
  }

  /// Adds a listener that will be called for each new log entry.
  ///
  /// Parameters:
  /// - [listener]: Callback function that receives new LogEntry objects
  void addListener(void Function(LogEntry) listener) {
    _logStreamController.add(listener);
  }

  /// Removes a previously added listener.
  ///
  /// Parameters:
  /// - [listener]: The listener callback to remove
  void removeListener(void Function(LogEntry) listener) {
    _logStreamController.remove(listener);
  }

  /// Logs a message with specified level and optional metadata.
  ///
  /// Parameters:
  /// - [message]: The log message
  /// - [level]: The severity level (default: LogLevel.info)
  /// - [source]: Optional source/component name
  /// - [data]: Optional additional data to log
  void log(
    String message, {
    LogLevel level = LogLevel.info,
    String? source,
    dynamic data,
  }) {
    // Skip logging if disabled
    if (!_enabled) return;

    final entry = LogEntry(
      timestamp: DateTime.now(),
      level: level,
      message: message,
      source: source,
      data: data,
    );

    _logs.add(entry);

    // Keep only the last _maxLogs entries
    while (_logs.length > _maxLogs) {
      _logs.removeFirst();
    }

    // Notify listeners
    for (final listener in _logStreamController) {
      listener(entry);
    }

    // Also print to console in debug mode
    // ignore: avoid_print
    print(entry.toString());
  }

  /// Logs a debug-level message.
  ///
  /// Debug messages are typically used for detailed information useful
  /// during development and troubleshooting.
  ///
  /// Parameters:
  /// - [message]: The debug message
  /// - [source]: Optional source/component name
  /// - [data]: Optional additional data
  void debug(String message, {String? source, dynamic data}) {
    log(message, level: LogLevel.debug, source: source, data: data);
  }

  /// Logs an info-level message.
  ///
  /// Info messages are used for general informational messages about
  /// normal application flow.
  ///
  /// Parameters:
  /// - [message]: The info message
  /// - [source]: Optional source/component name
  /// - [data]: Optional additional data
  void info(String message, {String? source, dynamic data}) {
    log(message, level: LogLevel.info, source: source, data: data);
  }

  /// Logs a warning-level message.
  ///
  /// Warning messages indicate potential issues that don't prevent
  /// the application from functioning.
  ///
  /// Parameters:
  /// - [message]: The warning message
  /// - [source]: Optional source/component name
  /// - [data]: Optional additional data
  void warning(String message, {String? source, dynamic data}) {
    log(message, level: LogLevel.warning, source: source, data: data);
  }

  /// Logs an error-level message.
  ///
  /// Error messages indicate serious issues that may affect
  /// application functionality.
  ///
  /// Parameters:
  /// - [message]: The error message
  /// - [source]: Optional source/component name
  /// - [data]: Optional additional data (e.g., exception, stack trace)
  void error(String message, {String? source, dynamic data}) {
    log(message, level: LogLevel.error, source: source, data: data);
  }

  /// Clears all logged entries from memory.
  void clear() {
    _logs.clear();
  }

  /// Returns statistics about logged entries.
  ///
  /// Provides counts for:
  /// - total: Total number of logs
  /// - debug: Number of debug-level logs
  /// - info: Number of info-level logs
  /// - warning: Number of warning-level logs
  /// - error: Number of error-level logs
  ///
  /// Returns a map with the statistics.
  Map<String, int> getStatistics() {
    return {
      'total': _logs.length,
      'debug': _logs.where((l) => l.level == LogLevel.debug).length,
      'info': _logs.where((l) => l.level == LogLevel.info).length,
      'warning': _logs.where((l) => l.level == LogLevel.warning).length,
      'error': _logs.where((l) => l.level == LogLevel.error).length,
    };
  }
}
