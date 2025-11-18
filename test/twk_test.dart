import 'package:flutter_test/flutter_test.dart';
import 'package:tawakkalna_sdk_flutter/src/enums/health_status.dart';
import 'package:tawakkalna_sdk_flutter/src/enums/marital_status.dart';
import 'package:tawakkalna_sdk_flutter/src/models/location.dart';
import 'package:tawakkalna_sdk_flutter/src/models/national_address.dart';
import 'package:tawakkalna_sdk_flutter/src/models/passport.dart';
import 'package:tawakkalna_sdk_flutter/src/models/vehicle.dart';
import 'package:tawakkalna_sdk_flutter/src/models/violation.dart';
import 'package:tawakkalna_sdk_flutter/twk.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final twk = Twk(
    v1Api: TwkApiV1DemoJsonImpl(),
    v2Api: TwkApiV2DemoJsonImpl(),
  );

  group('v1', () {
    test('getUserType returns correct UserType', () async {
      final result = await twk.getUserType();
      expect(result, UserType.resident);
    });

    test('getUserMaritalStatus returns correct value', () async {
      final result = await twk.getUserMaritalStatus();
      expect(result, MaritalStatus.single);
    });

    test('getUserHealthStatus returns correct value', () async {
      final result = await twk.getUserHealthStatus();
      expect(result, HealthStatus.healthy);
    });

    test('getUserId returns correct value', () async {
      final result = await twk.getUserId();
      expect(result, 1000101111);
    });

    test('getUserIdExpiryDate returns correct date', () async {
      final result = await twk.getUserIdExpiryDate();
      expect(result, DateTime(2027, 11, 15));
    });

    test('getUserIqamaType returns correct value', () async {
      final result = await twk.getUserIqamaType();
      expect(result, IqamaType.resident);
    });

    test('getUserDocumentNumber returns correct value', () async {
      final result = await twk.getUserDocumentNumber();
      expect(result, '255732849');
    });

    test('getUserBloodType returns correct value', () async {
      final result = await twk.getUserBloodType();
      expect(result, BloodType.type_1);
    });

    test('getUserDegreeType returns correct value', () async {
      final result = await twk.getUserDegreeType();
      expect(result, 'تعليم ابتدائي');
    });

    test('getUserLocation returns correct Location', () async {
      final result = await twk.getUserLocation();
      expect(result, const Location(latitude: 24.7136, longitude: 46.6753));
    });

    test('getUserNationalityIso returns correct value', () async {
      final result = await twk.getUserNationalityIso();
      expect(result, 'SA');
    });

    test('getUserOccupation returns correct value', () async {
      final result = await twk.getUserOccupation();
      expect(result, 'programmer');
    });

    test('getUserMobileNumber returns correct value', () async {
      final result = await twk.getUserMobileNumber();
      expect(result, '+966533978723');
    });

    test('getUserNationalAddress returns correct value', () async {
      final result = await twk.getUserNationalAddress();
      expect(result, [
        const NationalAddress(
          details: Details(
            additionalNo: "7559",
            buildingNo: "3693",
            city: "RIYADH",
            districtName: "Al Muruj Dist.",
            sectionType: "9",
            shortAddress: "RHGA3693",
            streetName: "Bani Qais",
            zipCode: "12284",
          ),
          summary: Summary(
            addressCounter: "Address 1",
            sectionType: "10",
            addressEn: "RHGA3693, 3693, Al Muruj Dist., 7559, Bani Qais, RIYADH",
            addressAr: "RHGA3693, 3693, حي المروج, 7559, بني قيس, الرياض",
            latitude: 24.7326068545263,
            longitude: 46.5989362244768,
          ),
          isPrimaryAddress: true,
        ),
      ]);
    });

    test('getUserBirthDate returns correct value', () async {
      final result = await twk.getUserBirthDate();
      expect(result, DateTime(2023, 10, 28));
    });

    test('getUserEmail returns correct value', () async {
      final result = await twk.getUserEmail();
      expect(result, 'testmail@gmail.com');
    });

    test('getUserGender returns correct Gender', () async {
      final result = await twk.getUserGender();
      expect(result, Gender.male);
    });

    test('getUserPassports returns correct list', () async {
      final result = await twk.getUserPassports();
      final List<Passport> userPassports = [
        const Passport(
          nameAr: "خالد بن عبدالغني بن عبدالمجيد خلاف",
          nameEn: "KHALLAF, KHALID ABDULGHANI A",
          nationalId: 1000101111,
          birthDate: "26/02/1971",
          expiryDate: "28/04/2028",
          genderAr: "ذكر",
          genderCode: 1,
          genderEn: "Male",
          issueCountryAr: "العربية السعودية",
          issueCountryCode: 113,
          issueCountryEn: "Saudi Arabia",
          issueDate: "21/06/2023",
          nationalityAr: "المملكة العربية السعودية",
          nationalityCode: 113,
          nationalityEn: "Kingdom of Saudi Arabia",
          passportNumber: "D559956",
          passportTypeAr: "دبلوماسي",
          passportTypeCode: 2,
          passportTypeEn: "Diplomatic",
        ),
        const Passport(
          nameAr: "خالد بن عبدالغني بن عبدالمجيد خلاف",
          nameEn: "KHALLAF, KHALID ABDULGHANI A",
          nationalId: 1000101111,
          birthDate: "26/02/1971",
          expiryDate: "05/12/2011",
          genderAr: "ذكر",
          genderCode: 1,
          genderEn: "Male",
          issueCountryAr: "العربية السعودية",
          issueCountryCode: 113,
          issueCountryEn: "Saudi Arabia",
          issueDate: "29/01/2007",
          nationalityAr: "المملكة العربية السعودية",
          nationalityCode: 113,
          nationalityEn: "Kingdom of Saudi Arabia",
          passportNumber: "S002075",
          passportTypeAr: "خاص",
          passportTypeCode: 3,
          passportTypeEn: "Private",
        ),
      ];

      final List<Passport> familyMembersPassports = [
        const Passport(
          nameAr: "باسم بنت خالد بن عبدالغني خلاف",
          nameEn: "KHALLADF, BASIM A A",
          nationalId: 1002749610,
          birthDate: "25/01/2012",
          expiryDate: "26/10/2025",
          genderAr: "أنثى",
          genderCode: 2,
          genderEn: "Female",
          issueCountryAr: "العربية السعودية",
          issueCountryCode: 113,
          issueCountryEn: "Saudi Arabia",
          issueDate: "12/06/2019",
          nationalityAr: "المملكة العربية السعودية",
          nationalityCode: 113,
          nationalityEn: "Kingdom of Saudi Arabia",
          passportNumber: "E999888",
          passportTypeAr: "عادي",
          passportTypeCode: 1,
          passportTypeEn: "Normal",
        ),
        const Passport(
          nameAr: "اروى بنت خالد بن عبدالغني خلاف",
          nameEn: "KHALLAF, ARWA ABDULGHANI H",
          nationalId: 1002922191,
          birthDate: "04/11/2013",
          expiryDate: "18/12/2026",
          genderAr: "أنثى",
          genderCode: 2,
          genderEn: "Female",
          issueCountryAr: "اثيوبيا",
          issueCountryCode: 401,
          issueCountryEn: "Ethiopia",
          issueDate: "10/02/2022",
          nationalityAr: "المملكة العربية السعودية",
          nationalityCode: 113,
          nationalityEn: "Kingdom of Saudi Arabia",
          passportNumber: "TWK54376",
          passportTypeAr: "عادي",
          passportTypeCode: 1,
          passportTypeEn: "Normal",
        ),
      ];

      expect(result.userPassports, userPassports);
      expect(result.familyMembersPassports, familyMembersPassports);
    });

    test('getUserVehicles returns correct list', () async {
      final result = await twk.getUserVehicles();
      expect(result, [
        const Vehicle(
          plateNumber: "string",
          registrationType: "string",
          majorColor: "string",
          model: "string",
          status: "string",
          modelYear: "string",
          identificationNumber: "string",
          serialNumber: "string",
          loadCapacity: "string",
          weight: "string",
          registrationExpiryDate: "string",
          manufacturer: "string",
        ),
      ]);
    });

    test('getUserUnPaidViolations returns correct list', () async {
      final result = await twk.getUserUnPaidViolations();
      expect(result, [
        const Violation(
          manufacturer: "فورد",
          plateNumber: "2018 J  U  L",
          streetSpeed: "0",
          totalFineAmount: "150",
          vehicleModel: "فوكس",
          vehicleSpeed: "0",
          vehicleType: "PRIVATE",
          violationCity: "رياض",
          violationDateTime: " 12:30 م",
          violationNumber: "1006651",
          violationStatus: "PAID VIOLATION",
          violationType: "IMPROPER USE OF THE HORN",
        ),
        const Violation(
          manufacturer: "فورد",
          plateNumber: "2018 J  U  L",
          streetSpeed: "0",
          totalFineAmount: "100",
          vehicleModel: "فوكس",
          vehicleSpeed: "0",
          vehicleType: "PRIVATE",
          violationCity: "رياض",
          violationDateTime: " 12:30 م",
          violationNumber: "1006651",
          violationStatus: "PAID VIOLATION",
          violationType: "Using Unauthorized Devices or Improper Stickers or Signs",
        ),
      ]);
    });

    test('getUserPaidViolations returns correct list', () async {
      final result = await twk.getUserPaidViolations();
      expect(result, [
        const Violation(
          manufacturer: "فورد",
          plateNumber: "2018 J  U  L",
          streetSpeed: "0",
          totalFineAmount: "150",
          vehicleModel: "فوكس",
          vehicleSpeed: "0",
          vehicleType: "PRIVATE",
          violationCity: "رياض",
          violationDateTime: " 12:30 م",
          violationNumber: "1006651",
          violationStatus: "UNPAID VIOLATION",
          violationType: "IMPROPER USE OF THE HORN",
        ),
        const Violation(
          manufacturer: "فورد",
          plateNumber: "2018 J  U  L",
          streetSpeed: "0",
          totalFineAmount: "100",
          vehicleModel: "فوكس",
          vehicleSpeed: "0",
          vehicleType: "PRIVATE",
          violationCity: "رياض",
          violationDateTime: " 12:30 م",
          violationNumber: "1006651",
          violationStatus: "UNPAID VIOLATION",
          violationType: "Using Unauthorized Devices or Improper Stickers or Signs",
        ),
      ]);
    });
  });

  group('v2', () {
    test('generateToken returns correct token', () async {
      final token = await twk.generateToken();
      expect(token,
          'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYXRpb25hbElkIjoiMTAwMDAwMTIxMiIsImV4cCI6MTczODQxMDUzMywiaXNzIjoiVGF3YWtrYWxuYSIsImF1ZCI6Ik1pbmlTZXJ2aWNlMSJ9.AIN4Y6YtTBJLZLKcjtzMDlqSB42n0gP7YwMaqwnIxSudSKg0EChZLp4MElVl2LAkSq96YuSQsPZebmhhIuPsq7GybnhgVHsRi1BnWKG5ZTbZAbUxTX0-iMBjUHmbEWOlQYyn5Kxh9bfORY1yc8G6StPRV0P34xBrjEIKZFCUsEKsKUM02Y1eeByrCiCxlCHf9OBncqzkdpx-mYuNmLSNgCjNQ5AXzGP4ywwytg9cdCS4POlTJ4H6AqjVXCG5ZkAgs68XR_Q_-Wfp4o3K7DXUR9IjpkFA5TNI-F09m7Or_n0q-swSqR1FxOvDLVsBXWaqP0Rr9IV7S7f8gvS3KmYcxw');
    });

    test('getUserFullName returns correct FullName', () async {
      final fullName = await twk.getUserFullName();
      expect(fullName, const FullName(ar: "محمد عبدالعزيز", en: "Mohammad Abdalziz"));
    });

    test('getUserNationality returns correct Nationality', () async {
      final nationality = await twk.getUserNationality();
      expect(
          nationality,
          const NationalityEnity(
            nameAr: "المملكة العربيه السعودية",
            nameEn: "Kingdom of saudi arabia",
            nationality: Nationality.sa,
          ));
    });

    test('getUserFamilyMembers returns correct list of FamilyMember', () async {
      final members = await twk.getUserFamilyMembers();
      expect(members, [
        FamilyMember(
          nationalId: 0,
          idExpiryDateHijri: "1449/06/16",
          idExpiryDateGregorian: DateTime(2027, 11, 15),
          nameAr: "Name arabic",
          nameEn: "Name english",
          gender: Gender.male,
          details: UserDetails(
            nationality: "Egypt",
            relation: Relation.son,
            passportNumber: "A0012",
            dateOfBirth: DateTime(1990, 01, 01),
            birthCity: "القاهرة",
          ),
        ),
      ]);
    });

    test('getUserSponsors returns correct list of Sponsor', () async {
      final sponsors = await twk.getUserSponsors();
      expect(sponsors, [
        Sponsor(
          nationalId: 0,
          idExpiryDateHijri: "1449/06/16",
          idExpiryDateGregorian: DateTime(2027, 11, 15),
          nameAr: "Name arabic",
          nameEn: "Name english",
          gender: Gender.male,
          details: UserDetails(
            nationality: "Egypt",
            relation: Relation.son,
            passportNumber: "A0012",
            dateOfBirth: DateTime(1990, 01, 01),
            birthCity: "القاهرة",
          ),
        ),
      ]);
    });
  });
}
