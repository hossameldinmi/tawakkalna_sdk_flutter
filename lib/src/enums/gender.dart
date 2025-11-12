// ignore_for_file: constant_identifier_names

import 'package:tawakkalna_sdk_flutter/src/core/base_enum.dart';

/// TODO:(TWK-team) know the actual gender types and their values
class Gender extends BaseEnum<int, Gender> {
  const Gender._(super.value);
  static const male = Gender._(1);
  static const female = Gender._(2);
  static const not_specified = Gender._(3);

  static List<Gender> get values => [male, female, not_specified];

  static Gender? fromValue(int? value) {
    if (value == null) return null;
    return values.firstWhere((element) => element.value == value, orElse: () => Gender._(value));
  }
}
