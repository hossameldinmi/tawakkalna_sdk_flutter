import 'package:tawakkalna_sdk_flutter/src/core/base_enum.dart';

class IqamaType extends BaseEnum<({int id, String key}), IqamaType> {
  const IqamaType._(super.value) : super();
  static const resident = IqamaType._((id: 1, key: 'resident'));
  static const visitor = IqamaType._((id: 2, key: 'visitor'));
  static const diplomatic = IqamaType._((id: 3, key: 'diplomatic'));
  static const other = IqamaType._((id: -1, key: 'other'));

  static const List<IqamaType> values = [
    resident,
    visitor,
    diplomatic,
  ];

  static IqamaType? fromValue(int value) {
    return IqamaType.values.firstWhere(
      (e) => e.value.id == value,
      orElse: () => other,
    );
  }
}
