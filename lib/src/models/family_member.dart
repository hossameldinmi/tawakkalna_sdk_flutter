import 'package:equatable/equatable.dart';
import 'package:tawakkalna_sdk_flutter/src/core/json_util.dart';
import 'package:tawakkalna_sdk_flutter/src/enums/gender.dart';
import 'package:tawakkalna_sdk_flutter/src/models/user_details.dart';

/// Represents a family member in the Saudi Arabian family registry.
///
/// Contains information about the user's family members including their
/// identity details, relationship, and personal information.
///
/// Example:
/// ```dart
/// final familyMembers = await twk.getUserFamilyMembers();
/// for (var member in familyMembers) {
///   print('${member.nameEn} - ${member.details.relation}');
/// }
/// ```
class FamilyMember extends Equatable {
  /// The family member's national ID number
  final int nationalId;

  /// ID expiry date in Hijri calendar format
  final String idExpiryDateHijri;

  /// ID expiry date in Gregorian calendar format
  final DateTime idExpiryDateGregorian;

  /// Family member's name in Arabic
  final String nameAr;

  /// Family member's name in English
  final String nameEn;

  /// Family member's gender
  final Gender gender;

  /// Additional details about the family member (relationship, nationality, etc.)
  final UserDetails details;

  /// Creates a new FamilyMember instance.
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
