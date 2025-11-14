import 'package:equatable/equatable.dart';

class Passport extends Equatable {
  final String nameAr;
  final String nameEn;
  final int nationalId;
  final String birthDate;
  final String expiryDate;
  final String genderAr;
  final int genderCode;
  final String genderEn;
  final String issueCountryAr;
  final int issueCountryCode;
  final String issueCountryEn;
  final String issueDate;
  final String nationalityAr;
  final int nationalityCode;
  final String nationalityEn;
  final String passportNumber;
  final String passportTypeAr;
  final int passportTypeCode;
  final String passportTypeEn;

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

class PassportResponse extends Equatable {
  final List<Passport> userPassports;
  final List<Passport> familyMembersPassports;

  const PassportResponse({
    required this.userPassports,
    required this.familyMembersPassports,
  });

  factory PassportResponse.fromJson(Map<String, dynamic> json) => PassportResponse(
        userPassports:
            (json['user_passports'] as List<dynamic>).map((e) => Passport.fromJson(e as Map<String, dynamic>)).toList(),
        familyMembersPassports: (json['family_members_passports'] as List<dynamic>)
            .map((e) => Passport.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  @override
  List<Object?> get props => [userPassports, familyMembersPassports];
}
