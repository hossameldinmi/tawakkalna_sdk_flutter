import 'package:tawakkalna_sdk_flutter/src/core/json_util.dart';
import 'package:tawakkalna_sdk_flutter/src/enums/gender.dart';
import 'package:tawakkalna_sdk_flutter/src/enums/relation.dart';

class Sponsor {
  final int nationalId;
  final String idExpiryDateHijri;
  final DateTime idExpiryDateGregorian;
  final String nameAr;
  final String nameEn;
  final Gender gender;
  final SponsorDetails details;

  Sponsor({
    required this.nationalId,
    required this.idExpiryDateHijri,
    required this.idExpiryDateGregorian,
    required this.nameAr,
    required this.nameEn,
    required this.gender,
    required this.details,
  });

  factory Sponsor.fromJson(Map<String, dynamic> json) => Sponsor(
        nationalId: json['national_id'] as int,
        idExpiryDateHijri: json['id_expiry_date_hijri'] as String,
        idExpiryDateGregorian: JsonUtil.parseDateTime(json['id_expiry_date_gregorian'])!,
        nameAr: json['name_ar'] as String,
        nameEn: json['name_en'] as String,
        gender: Gender.fromValue(json['gender'] as int)!,
        details: SponsorDetails.fromJson(json['details'] as Map<String, dynamic>),
      );
}

class SponsorDetails {
  final String nationality;
  final Relation relation;
  final String passportNumber;
  final DateTime dateOfBirth;
  final String birthCity;

  SponsorDetails({
    required this.nationality,
    required this.relation,
    required this.passportNumber,
    required this.dateOfBirth,
    required this.birthCity,
  });

  factory SponsorDetails.fromJson(Map<String, dynamic> json) => SponsorDetails(
        nationality: json['nationality'] as String,
        relation: Relation.fromString(json['relation'] as String),
        passportNumber: json['passport_number'] as String,
        dateOfBirth: DateTime.parse(json['date_of_birth'] as String),
        birthCity: json['birth_city'] as String,
      );
}
