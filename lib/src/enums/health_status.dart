/// TODO:(TWK-team) know the actual marital statuses and their values
enum HealthStatus {
  healthy;

  factory HealthStatus.fromString(String status) {
    switch (status.toLowerCase()) {
      case 'healthy':
        return HealthStatus.healthy;
      default:
        throw ArgumentError('Unknown health status: $status');
    }
  }
}
