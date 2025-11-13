import 'package:tawakkalna_sdk_flutter/src/core/json_util.dart';
import 'package:tawakkalna_sdk_flutter/src/enums/relation.dart';

class UserDetails {
  final String nationality;
  final Relation relation;
  final String passportNumber;
  final DateTime dateOfBirth;
  final String birthCity;

  UserDetails({
    required this.nationality,
    required this.relation,
    required this.passportNumber,
    required this.dateOfBirth,
    required this.birthCity,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        nationality: json['nationality'] as String,
        relation: Relation.fromString(json['relation'] as String),
        passportNumber: json['passport_number'] as String,
        dateOfBirth: JsonUtil.parseDateTime(json['date_of_birth'])!,
        birthCity: json['birth_city'] as String,
      );
}
