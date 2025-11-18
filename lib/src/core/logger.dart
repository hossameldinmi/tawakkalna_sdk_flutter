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

/// Singleton logger for the Tawakkalna SDK
class TwkLogger {
  static final TwkLogger _instance = TwkLogger._internal();
  factory TwkLogger() => _instance;
  TwkLogger._internal();

  final _logs = Queue<LogEntry>();
  final _maxLogs = 1000; // Maximum number of logs to keep in memory

  /// Stream controller for log updates
  final _logStreamController = <void Function(LogEntry)>[];

  /// Get all logs
  List<LogEntry> get logs => _logs.toList();

  /// Get logs filtered by level
  List<LogEntry> getLogsByLevel(LogLevel level) {
    return _logs.where((log) => log.level == level).toList();
  }

  /// Get recent logs (last n logs)
  List<LogEntry> getRecentLogs(int count) {
    final list = _logs.toList();
    if (list.length <= count) return list;
    return list.sublist(list.length - count);
  }

  /// Add a listener for new log entries
  void addListener(void Function(LogEntry) listener) {
    _logStreamController.add(listener);
  }

  /// Remove a listener
  void removeListener(void Function(LogEntry) listener) {
    _logStreamController.remove(listener);
  }

  /// Log a message
  void log(
    String message, {
    LogLevel level = LogLevel.info,
    String? source,
    dynamic data,
  }) {
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

  /// Log a debug message
  void debug(String message, {String? source, dynamic data}) {
    log(message, level: LogLevel.debug, source: source, data: data);
  }

  /// Log an info message
  void info(String message, {String? source, dynamic data}) {
    log(message, level: LogLevel.info, source: source, data: data);
  }

  /// Log a warning message
  void warning(String message, {String? source, dynamic data}) {
    log(message, level: LogLevel.warning, source: source, data: data);
  }

  /// Log an error message
  void error(String message, {String? source, dynamic data}) {
    log(message, level: LogLevel.error, source: source, data: data);
  }

  /// Clear all logs
  void clear() {
    _logs.clear();
  }

  /// Get log statistics
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
