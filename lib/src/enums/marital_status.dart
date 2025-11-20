/// Enumeration of marital status options.
///
/// Represents the different marital statuses as used in the Tawakkalna system.
///
/// TODO:(TWK-team) Verify the complete list of marital statuses and their string values
///
/// Example:
/// ```dart
/// final status = await twk.getUserMaritalStatus();
/// if (status == MaritalStatus.married) {
///   print('User is married');
/// }
/// ```
enum MaritalStatus {
  /// Not married
  single,

  /// Currently married
  married,

  /// Previously married, now divorced
  divorced,

  /// Previously married, spouse deceased
  widowed;

  /// Creates a MaritalStatus from a string value.
  ///
  /// Throws ArgumentError if the status string is unknown.
  ///
  /// Parameters:
  /// - [status]: The marital status string (case-insensitive)
  factory MaritalStatus.fromString(String status) {
    switch (status.toLowerCase()) {
      case 'single':
        return MaritalStatus.single;
      case 'married':
        return MaritalStatus.married;
      case 'divorced':
        return MaritalStatus.divorced;
      case 'widowed':
        return MaritalStatus.widowed;
      default:
        throw ArgumentError('Unknown marital status: $status');
    }
  }
}
