import 'package:tawakkalna_sdk_flutter/src/core/base_enum.dart';

/// todo:(twk-team) know the actual user types and their values
class UserType extends BaseEnum<int, UserType> {
  const UserType._(super.value);
  static const citizen = UserType._(1);
  static const resident = UserType._(2);
  static const visitor = UserType._(3);

  static List<UserType> get values => [citizen, resident, visitor];

  static UserType? fromValue(int? value) {
    if (value == null) return null;
    return values.firstWhere((element) => element.value == value, orElse: () => UserType._(value));
  }
}
