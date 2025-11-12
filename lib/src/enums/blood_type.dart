enum BloodType {
  type_0(0),
  type_1(1),
  type_2(2),
  type_3(3),
  type_4(4),
  type_5(5),
  type_6(6),
  type_7(7);

  const BloodType(this.code);
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
