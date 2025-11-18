import 'package:equatable/equatable.dart';
import 'package:tawakkalna_sdk_flutter/twk.dart';

class FamilyMember extends Equatable {
  final int nationalId;
  final String idExpiryDateHijri;
  final DateTime idExpiryDateGregorian;
  final String nameAr;
  final String nameEn;
  final Gender gender;
  final UserDetails details;

  const FamilyMember({
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
        idExpiryDateGregorian: JsonUtil.parseDateTime(json['id_expiry_date_gregorian'])!,
        nameAr: json['name_ar'],
        nameEn: json['name_en'],
        gender: Gender.fromValue(json['gender'])!,
        details: UserDetails.fromJson((json['details'] as Map).cast()),
      );

  bool isRelationMatches(List<Relation> relations) => relations.any((r) => relations.contains(r));

  @override
  List<Object?> get props => [
        nationalId,
        idExpiryDateGregorian,
        idExpiryDateHijri,
        nameAr,
        nameEn,
        gender,
        details,
      ];
}
