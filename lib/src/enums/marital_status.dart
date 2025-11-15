/// TODO:(TWK-team) know the actual marital statuses and their values
enum MaritalStatus {
  single,
  married,
  divorced,
  widowed;

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
