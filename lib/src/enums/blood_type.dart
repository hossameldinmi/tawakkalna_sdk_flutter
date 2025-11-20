/// Enumeration of blood type classifications.
///
/// Represents the different blood types as used in the Tawakkalna system.
/// Each type is associated with a numeric code for API communication.
///
/// TODO:(TWK-team) Verify and document the actual blood types and their values
/// (e.g., which code represents A+, B+, O-, etc.)
///
/// Example:
/// ```dart
/// final bloodType = await twk.getUserBloodType();
/// if (bloodType != null) {
///   print('Blood type code: ${bloodType.code}');
/// }
/// ```
enum BloodType {
  /// Blood type 0 (specific type to be documented)
  type_0._(0),

  /// Blood type 1 (specific type to be documented)
  type_1._(1),

  /// Blood type 2 (specific type to be documented)
  type_2._(2),

  /// Blood type 3 (specific type to be documented)
  type_3._(3),

  /// Blood type 4 (specific type to be documented)
  type_4._(4),

  /// Blood type 5 (specific type to be documented)
  type_5._(5),

  /// Blood type 6 (specific type to be documented)
  type_6._(6),

  /// Blood type 7 (specific type to be documented)
  type_7._(7);

  const BloodType._(this.code);

  /// The numeric code representing this blood type in the API
  final int code;

  /// Creates a BloodType from a numeric code.
  ///
  /// Returns null if the code doesn't match any known blood type.
  ///
  /// Parameters:
  /// - [code]: The numeric blood type code from the API
  static BloodType? fromCode(int code) {
    for (var bloodType in BloodType.values) {
      if (bloodType.code == code) {
        return bloodType;
      }
    }
    return null;
  }
}
