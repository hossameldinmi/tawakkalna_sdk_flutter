import 'package:tawakkalna_sdk_flutter/src/core/base_enum.dart';

/// TODO:(TWK-team) know the actual relations and their values
class Relation extends BaseEnum<String, Relation> {
  final List<String> matchingValues;

  const Relation._(super.value, this.matchingValues) : super();
  static const father = Relation._('father', ['أب']);
  static const mother = Relation._('mother', ['أم']);
  static const brother = Relation._('brother', ['أخ']);
  static const sister = Relation._('sister', ['أخت']);
  static const son = Relation._('son', ['ابن']);
  static const daughter = Relation._('daughter', ['ابنة', 'بنت']);
  static const husband = Relation._('husband', ['زوج']);
  static const wife = Relation._('wife', ['زوجة']);
  static const guardian = Relation._('guardian', ['وصي']);
  static const other = Relation._('other', ['آخر']);

  static Relation fromString(String relationStr) {
    for (var relation in values) {
      if (relation.value.toLowerCase() == relationStr.toLowerCase() || relation.matchingValues.contains(relationStr)) {
        return relation;
      }
    }
    return other;
  }

  static List<Relation> get values => [
        father,
        mother,
        brother,
        sister,
        son,
        daughter,
        husband,
        wife,
        guardian,
        other,
      ];
}
