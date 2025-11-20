/// Enumeration of health status options.
///
/// Represents the user's health/vaccination status in the Tawakkalna system.
/// This was particularly relevant during COVID-19 for tracking vaccination status.
///
/// TODO:(TWK-team) Document all health statuses and their values
/// (e.g., vaccinated, partially_vaccinated, not_vaccinated, immune, etc.)
///
/// Example:
/// ```dart
/// final healthStatus = await twk.getUserHealthStatus();
/// if (healthStatus == HealthStatus.healthy) {
///   print('User has healthy status');
/// }
/// ```
enum HealthStatus {
  /// Healthy/compliant health status
  healthy;

  /// Creates a HealthStatus from a string value.
  ///
  /// Throws ArgumentError if the status string is unknown.
  ///
  /// Parameters:
  /// - [status]: The health status string (case-insensitive)
  factory HealthStatus.fromString(String status) {
    switch (status.toLowerCase()) {
      case 'healthy':
        return HealthStatus.healthy;
      default:
        throw ArgumentError('Unknown health status: $status');
    }
  }
}
