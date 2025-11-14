/// Gender enum representing user gender types
/// TODO:(TWK-team) know the actual gender types and their values
enum Gender {
  /// Male gender
  male(1),

  /// Female gender
  female(2),

  /// Not specified or prefer not to say
  notSpecified(3);

  /// The integer value associated with this gender
  final int value;

  const Gender(this.value);

  /// Creates a Gender from an integer value
  /// Returns null if the value doesn't match any gender
  static Gender? fromValue(int? value) {
    if (value == null) return null;
    try {
      return Gender.values.firstWhere((e) => e.value == value);
    } catch (_) {
      return null;
    }
  }
}
