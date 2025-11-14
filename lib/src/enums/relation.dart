/// Relation enum representing family relationships
/// TODO:(TWK-team) know the actual relations and their values
enum Relation {
  /// Father
  father('father', ['أب']),

  /// Mother
  mother('mother', ['أم']),

  /// Brother
  brother('brother', ['أخ']),

  /// Sister
  sister('sister', ['أخت']),

  /// Son
  son('son', ['ابن']),

  /// Daughter
  daughter('daughter', ['ابنة', 'بنت']),

  /// Husband
  husband('husband', ['زوج']),

  /// Wife
  wife('wife', ['زوجة']),

  /// Guardian
  guardian('guardian', ['وصي']),

  /// Other relationship
  other('other', ['آخر']);

  /// The string value associated with this relation
  final String value;

  /// Alternative matching values (e.g., Arabic translations)
  final List<String> matchingValues;

  const Relation(this.value, this.matchingValues);

  /// Creates a Relation from a string value
  /// Matches against both value and matchingValues (case-insensitive)
  /// Returns [other] if no match is found
  static Relation fromString(String relationStr) {
    for (var relation in Relation.values) {
      if (relation.value.toLowerCase() == relationStr.toLowerCase() || relation.matchingValues.contains(relationStr)) {
        return relation;
      }
    }
    return other;
  }
}
