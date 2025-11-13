import 'package:flutter_test/flutter_test.dart';
import 'package:tawakkalna_sdk_flutter/src/enums/blood_type.dart';
import 'package:tawakkalna_sdk_flutter/src/enums/eqama_type.dart';
import 'package:tawakkalna_sdk_flutter/src/apis/v1/twk_api_v1_demo_json_impl.dart';
import 'package:tawakkalna_sdk_flutter/src/enums/gender.dart';
import 'package:tawakkalna_sdk_flutter/src/enums/user_type.dart';
import 'package:tawakkalna_sdk_flutter/twk.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final helper = Twk(v1Api: TwkApiV1DemoJsonImpl()).v1;

  test('getUserType returns correct UserType', () async {
    final result = await helper.getUserType();
    expect(result, UserType.resident);
  });

  test('getUserMaritalStatus returns correct value', () async {
    final result = await helper.getUserMaritalStatus();
    expect(result, 'single');
  });

  test('getUserHealthStatus returns correct value', () async {
    final result = await helper.getUserHealthStatus();
    expect(result, 'healthy');
  });

  test('getUserId returns correct value', () async {
    final result = await helper.getUserId();
    expect(result, 1000101111);
  });

  test('getUserIdExpiryDate returns correct date', () async {
    final result = await helper.getUserIdExpiryDate();
    expect(result?.year, 2027);
    expect(result?.month, 11);
    expect(result?.day, 15);
  });

  test('getUserIqamaType returns correct value', () async {
    final result = await helper.getUserIqamaType();
    expect(result, IqamaType.resident);
  });

  test('getUserDocumentNumber returns correct value', () async {
    final result = await helper.getUserDocumentNumber();
    expect(result, '255732849');
  });

  test('getUserFullName returns correct value', () async {
    final result = await helper.getUserFullName();
    expect(result, 'محمد عبدالعزيز');
  });

  test('getUserBloodType returns correct value', () async {
    final result = await helper.getUserBloodType();
    expect(result, BloodType.type_1);
  });

  test('getUserDegreeType returns correct value', () async {
    final result = await helper.getUserDegreeType();
    expect(result, 'تعليم ابتدائي');
  });

  test('getUserLocation returns correct Location', () async {
    final result = await helper.getUserLocation();
    expect(result?.latitude, 24.7136);
    expect(result?.longitude, 46.6753);
  });

  test('getUserNationality returns correct value', () async {
    final result = await helper.getUserNationality();
    expect(result, 'Kingdom of Saudi Arabia');
  });

  test('getUserNationalityIso returns correct value', () async {
    final result = await helper.getUserNationalityIso();
    expect(result, 'SA');
  });

  test('getUserOccupation returns correct value', () async {
    final result = await helper.getUserOccupation();
    expect(result, 'programmer');
  });

  test('getUserMobileNumber returns correct value', () async {
    final result = await helper.getUserMobileNumber();
    expect(result, '+966533978723');
  });

  test('getUserBirthDate returns correct value', () async {
    final result = await helper.getUserBirthDate();
    expect(result?.year, 2023);
    expect(result?.month, 10);
    expect(result?.day, 28);
  });

  test('getUserEmail returns correct value', () async {
    final result = await helper.getUserEmail();
    expect(result, 'testmail@gmail.com');
  });

  test('getUserGender returns correct Gender', () async {
    final result = await helper.getUserGender();
    expect(result, Gender.male);
  });

  test('getUserPassports returns correct list', () async {
    final result = await helper.getUserPassports();
    expect(result.userPassports.length, 2);
    expect(result.userPassports[0].passportNumber, 'D559956');
    expect(result.userPassports[1].passportNumber, 'S002075');
    expect(result.familyMembersPassports.length, 2);
    expect(result.familyMembersPassports[0].passportNumber, 'E999888');
    expect(result.familyMembersPassports[1].passportNumber, 'TWK54376');
  });

  test('getUserVehicles returns correct list', () async {
    final result = await helper.getUserVehicles();
    expect(result.length, 1);
    expect(result[0].plateNumber, 'string');
  });

  test('getUserUnPaidViolations returns correct list', () async {
    final result = await helper.getUserUnPaidViolations();
    expect(result.length, 2);
    final violation = result[0];
    expect(violation.violationNumber, '1006651');
    expect(violation.violationStatus, 'PAID VIOLATION');
    expect(result[1].violationType, 'Using Unauthorized Devices or Improper Stickers or Signs');
  });

  test('getUserPaidViolations returns correct list', () async {
    final result = await helper.getUserPaidViolations();
    expect(result.length, 2);
    expect(result[0].violationNumber, '1006651');
    expect(result[0].violationStatus, 'UNPAID VIOLATION');
    expect(result[1].violationType, 'Using Unauthorized Devices or Improper Stickers or Signs');
  });
}
