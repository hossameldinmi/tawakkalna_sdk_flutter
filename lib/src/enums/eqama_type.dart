/// TODO:(TWK-team) know the actual iqama types and their values
enum IqamaType {
  resident._(0, 'resident'),
  visitor._(1, 'visitor'),
  diplomatic._(2, 'diplomatic'),
  other._(-1, 'other');

  final int id;
  final String key;
  const IqamaType._(this.id, this.key);

  static IqamaType? fromId(int id) {
    return IqamaType.values.firstWhere(
      (e) => e.id == id,
      orElse: () => other,
    );
  }
}
