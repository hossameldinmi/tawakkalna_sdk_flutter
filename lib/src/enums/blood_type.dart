/// TODO:(TWK-team) know the actual blood types and their values
enum BloodType {
  type_0._(0),
  type_1._(1),
  type_2._(2),
  type_3._(3),
  type_4._(4),
  type_5._(5),
  type_6._(6),
  type_7._(7);

  const BloodType._(this.code);
  final int code;

  static BloodType? fromCode(int code) {
    for (var bloodType in BloodType.values) {
      if (bloodType.code == code) {
        return bloodType;
      }
    }
    return null;
  }
}
