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
  final v1 = Twk(
    v1Api: TwkApiV1DemoJsonImpl(),
    v2Api: TwkApiV2DemoJsonImpl(),
  ).v1;

  test('getUserType returns correct UserType', () async {
    final result = await v1.getUserType();
    expect(result, UserType.resident);
  });

  test('getUserMaritalStatus returns correct value', () async {
    final result = await v1.getUserMaritalStatus();
    expect(result, MaritalStatus.single);
  });

  test('getUserHealthStatus returns correct value', () async {
    final result = await v1.getUserHealthStatus();
    expect(result, HealthStatus.healthy);
  });

  test('getUserId returns correct value', () async {
    final result = await v1.getUserId();
    expect(result, 1000101111);
  });

  test('getUserIdExpiryDate returns correct date', () async {
    final result = await v1.getUserIdExpiryDate();
    expect(result, DateTime(2027, 11, 15));
  });

  test('getUserIqamaType returns correct value', () async {
    final result = await v1.getUserIqamaType();
    expect(result, IqamaType.resident);
  });

  test('getUserDocumentNumber returns correct value', () async {
    final result = await v1.getUserDocumentNumber();
    expect(result, '255732849');
  });

  test('getUserFullName returns correct value', () async {
    final result = await v1.getUserFullName();
    expect(result, 'محمد عبدالعزيز');
  });

  test('getUserBloodType returns correct value', () async {
    final result = await v1.getUserBloodType();
    expect(result, BloodType.type_1);
  });

  test('getUserDegreeType returns correct value', () async {
    final result = await v1.getUserDegreeType();
    expect(result, 'تعليم ابتدائي');
  });

  test('getUserLocation returns correct Location', () async {
    final result = await v1.getUserLocation();
    expect(result, const Location(latitude: 24.7136, longitude: 46.6753));
  });

  test('getUserNationality returns correct value', () async {
    final result = await v1.getUserNationality();
    expect(result, 'Kingdom of Saudi Arabia');
  });

  test('getUserNationalityIso returns correct value', () async {
    final result = await v1.getUserNationalityIso();
    expect(result, 'SA');
  });

  test('getUserOccupation returns correct value', () async {
    final result = await v1.getUserOccupation();
    expect(result, 'programmer');
  });

  test('getUserMobileNumber returns correct value', () async {
    final result = await v1.getUserMobileNumber();
    expect(result, '+966533978723');
  });

  test('getUserNationalAddress returns correct value', () async {
    final result = await v1.getUserNationalAddress();
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
    final result = await v1.getUserBirthDate();
    expect(result, DateTime(2023, 10, 28));
  });

  test('getUserEmail returns correct value', () async {
    final result = await v1.getUserEmail();
    expect(result, 'testmail@gmail.com');
  });

  test('getUserGender returns correct Gender', () async {
    final result = await v1.getUserGender();
    expect(result, Gender.male);
  });

  test('getUserPassports returns correct list', () async {
    final result = await v1.getUserPassports();
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
    final result = await v1.getUserVehicles();
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
    final result = await v1.getUserUnPaidViolations();
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
    final result = await v1.getUserPaidViolations();
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
}
