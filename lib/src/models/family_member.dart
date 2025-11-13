import 'package:tawakkalna_sdk_flutter/src/enums/relation.dart';
import 'package:tawakkalna_sdk_flutter/src/models/user_details.dart';

class FamilyMember {
  final int nationalId;
  final String idExpiryDateHijri;
  final String idExpiryDateGregorian;
  final String nameAr;
  final String nameEn;
  final int gender;
  final UserDetails details;

  FamilyMember({
    required this.nationalId,
    required this.idExpiryDateHijri,
    required this.idExpiryDateGregorian,
    required this.nameAr,
    required this.nameEn,
    required this.gender,
    required this.details,
  });

  factory FamilyMember.fromJson(Map<String, dynamic> json) => FamilyMember(
        nationalId: json['national_id'],
        idExpiryDateHijri: json['id_expiry_date_hijri'],
        idExpiryDateGregorian: json['id_expiry_date_gregorian'],
        nameAr: json['name_ar'],
        nameEn: json['name_en'],
        gender: json['gender'],
        details: UserDetails.fromJson(json['details'] as Map<String, dynamic>),
      );

  bool isRelationShip(List<Relation> relations) => relations.any((r) => relations.contains(r));
}
