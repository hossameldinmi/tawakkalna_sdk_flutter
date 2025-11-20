import 'package:equatable/equatable.dart';
import 'package:tawakkalna_sdk_flutter/src/core/json_util.dart';
import 'package:tawakkalna_sdk_flutter/src/enums/relation.dart';

/// Detailed information about a user or family member.
///
/// Contains personal details including nationality, relationship,
/// passport information, and birth details.
///
/// Used within FamilyMember and Sponsor models.
class UserDetails extends Equatable {
  /// The nationality (as a string)
  final String nationality;

  /// The relationship to the primary user
  final Relation relation;

  /// Passport number
  final String passportNumber;

  /// Date of birth
  final DateTime dateOfBirth;

  /// City of birth
  final String birthCity;

  /// Creates a new UserDetails instance.
  const UserDetails({
    required this.nationality,
    required this.relation,
    required this.passportNumber,
    required this.dateOfBirth,
    required this.birthCity,
  });

  /// Creates a UserDetails from a JSON map.
  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        nationality: json['nationality'] as String,
        relation: Relation.fromString(json['relation'] as String),
        passportNumber: json['passport_number'] as String,
        dateOfBirth: JsonUtil.parseDateTime(json['date_of_birth'])!,
        birthCity: json['birth_city'] as String,
      );

  /// Checks if the user's relation matches any in the provided list.
  ///
  /// Useful for filtering family members by relationship type.
  ///
  /// Example:
  /// ```dart
  /// if (details.isRelationMatches([Relation.son, Relation.daughter])) {
  ///   print('This is a child');
  /// }
  /// ```
  bool isRelationMatches(List<Relation> relations) => relations.contains(relation);

  @override
  List<Object?> get props => [
        nationality,
        relation,
        passportNumber,
        dateOfBirth,
        birthCity,
      ];
}
