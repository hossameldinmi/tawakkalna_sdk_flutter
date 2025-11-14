/// User type enum representing different types of users
/// todo:(twk-team) know the actual user types and their values
enum UserType {
  /// Citizen user type
  citizen(1),

  /// Resident user type
  resident(2),

  /// Visitor user type
  visitor(3);

  /// The integer value associated with this user type
  final int value;

  const UserType(this.value);

  /// Creates a UserType from an integer value
  /// Returns null if the value doesn't match any user type
  static UserType? fromValue(int? value) {
    if (value == null) return null;
    try {
      return UserType.values.firstWhere((e) => e.value == value);
    } catch (_) {
      return null;
    }
  }
}
