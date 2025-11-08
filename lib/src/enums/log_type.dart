import 'package:tawakkalna_sdk_flutter/src/core/base_enum.dart';

class LogType extends BaseEnum<int, LogType> {
  const LogType._(super.value) : super();
  static const info = LogType._(1);
  static const warning = LogType._(2);
  static const error = LogType._(3);
  static const debug = LogType._(4);

  static List<LogType> get values => [
        info,
        warning,
        error,
        debug,
      ];
}
