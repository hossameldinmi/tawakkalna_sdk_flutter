import 'package:equatable/equatable.dart';

/// Represents a passport document with all its details.
///
/// Contains comprehensive passport information including personal details,
/// issue information, and passport type. All bilingual fields include both
/// Arabic and English versions.
///
/// Example:
/// ```dart
/// final passports = await twk.getUserPassports();
/// for (var passport in passports.userPassports) {
///   print('Passport: ${passport.passportNumber}');
///   print('Expiry: ${passport.expiryDate}');
/// }
/// ```
class Passport extends Equatable {
  /// The passport holder's name in Arabic
  final String nameAr;

  /// The passport holder's name in English
  final String nameEn;

  /// The national ID number of the passport holder
  final int nationalId;

  /// The passport holder's birth date
  final String birthDate;

  /// The date when the passport expires
  final String expiryDate;

  /// Gender in Arabic
  final String genderAr;

  /// Numeric gender code
  final int genderCode;

  /// Gender in English
  final String genderEn;

  /// Country of issue in Arabic
  final String issueCountryAr;

  /// Numeric code for the country of issue
  final int issueCountryCode;

  /// Country of issue in English
  final String issueCountryEn;

  /// The date when the passport was issued
  final String issueDate;

  /// Nationality in Arabic
  final String nationalityAr;

  /// Numeric nationality code
  final int nationalityCode;

  /// Nationality in English
  final String nationalityEn;

  /// The passport number (unique identifier)
  final String passportNumber;

  /// Passport type in Arabic (e.g., ordinary, diplomatic)
  final String passportTypeAr;

  /// Numeric code for the passport type
  final int passportTypeCode;

  /// Passport type in English
  final String passportTypeEn;

  /// Creates a new Passport instance.
  const Passport({
    required this.nameAr,
    required this.nameEn,
    required this.nationalId,
    required this.birthDate,
    required this.expiryDate,
    required this.genderAr,
    required this.genderCode,
    required this.genderEn,
    required this.issueCountryAr,
    required this.issueCountryCode,
    required this.issueCountryEn,
    required this.issueDate,
    required this.nationalityAr,
    required this.nationalityCode,
    required this.nationalityEn,
    required this.passportNumber,
    required this.passportTypeAr,
    required this.passportTypeCode,
    required this.passportTypeEn,
  });

  factory Passport.fromJson(Map<String, dynamic> json) => Passport(
        nameAr: json['name_ar'] as String,
        nameEn: json['name_en'] as String,
        nationalId: json['national_id'] as int,
        birthDate: json['birth_date'] as String,
        expiryDate: json['expiry_date'] as String,
        genderAr: json['gender_ar'] as String,
        genderCode: json['gender_code'] as int,
        genderEn: json['gender_en'] as String,
        issueCountryAr: json['issue_country_ar'] as String,
        issueCountryCode: json['issue_country_code'] as int,
        issueCountryEn: json['issue_country_en'] as String,
        issueDate: json['issue_date'] as String,
        nationalityAr: json['nationality_ar'] as String,
        nationalityCode: json['nationality_code'] as int,
        nationalityEn: json['nationality_en'] as String,
        passportNumber: json['passport_number'] as String,
        passportTypeAr: json['passport_type_ar'] as String,
        passportTypeCode: json['passport_type_code'] as int,
        passportTypeEn: json['passport_type_en'] as String,
      );

  @override
  List<Object?> get props => [
        nameAr,
        nameEn,
        nationalId,
        birthDate,
        expiryDate,
        genderAr,
        genderCode,
        genderEn,
        issueCountryAr,
        issueCountryCode,
        issueCountryEn,
        issueDate,
        nationalityAr,
        nationalityCode,
        nationalityEn,
        passportNumber,
        passportTypeAr,
        passportTypeCode,
        passportTypeEn,
      ];
}

/// Response containing passport information for both the user and their family members.
///
/// This is the return type for the `getUserPassports()` method.
class PassportResponse extends Equatable {
  /// List of passports belonging to the primary user
  final List<Passport> userPassports;

  /// List of passports belonging to family members
  final List<Passport> familyMembersPassports;

  /// Creates a new PassportResponse instance.
  const PassportResponse({
    required this.userPassports,
    required this.familyMembersPassports,
  });

  factory PassportResponse.fromJson(Map<String, dynamic> json) => PassportResponse(
        userPassports:
            (json['user_passports'] as List<dynamic>).map((e) => Passport.fromJson((e as Map).cast())).toList(),
        familyMembersPassports: (json['family_members_passports'] as List<dynamic>)
            .map((e) => Passport.fromJson((e as Map).cast()))
            .toList(),
      );

  @override
  List<Object?> get props => [userPassports, familyMembersPassports];
}
