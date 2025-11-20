/// Enumeration of Iqama (residence permit) types in Saudi Arabia.
///
/// Represents different categories of residence permits issued to non-citizens.
///
/// TODO:(TWK-team) Verify the actual iqama types and their numeric values
///
/// Example:
/// ```dart
/// final iqamaType = await twk.getUserIqamaType();
/// if (iqamaType == IqamaType.resident) {
///   print('User is a resident');
/// }
/// ```
enum IqamaType {
  /// Standard resident permit
  resident._(0, 'resident'),

  /// Visitor/tourist permit
  visitor._(1, 'visitor'),

  /// Diplomatic permit
  diplomatic._(2, 'diplomatic'),

  /// Other/unknown type
  other._(-1, 'other');

  /// Numeric ID for this Iqama type
  final int id;

  /// String key for this Iqama type
  final String key;

  const IqamaType._(this.id, this.key);

  /// Creates an IqamaType from a numeric ID.
  ///
  /// Returns [other] if the ID doesn't match any known type.
  static IqamaType? fromId(int id) {
    return IqamaType.values.firstWhere(
      (e) => e.id == id,
      orElse: () => other,
    );
  }
}
