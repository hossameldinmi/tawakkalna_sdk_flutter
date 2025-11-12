import 'package:flutter_test/flutter_test.dart';
import 'package:tawakkalna_sdk_flutter/src/enums/blood_type.dart';
import 'package:tawakkalna_sdk_flutter/src/enums/eqama_type.dart';
import 'package:tawakkalna_sdk_flutter/src/services/v1/twk_helper_v1_impl.dart';
import 'package:tawakkalna_sdk_flutter/src/apis/v1/twk_api_v1_demo_json_impl.dart';
import 'package:tawakkalna_sdk_flutter/src/enums/gender.dart';
import 'package:tawakkalna_sdk_flutter/src/enums/user_type.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final helper = TwkHelperV1Impl(TwkApiV1DemoJsonImpl(jsonPath: 'assets/mock_profile1.0.2.json'));

  test('getUserType returns correct UserType', () async {
    final result = await helper.getUserType();
    expect(result, UserType.values[1]);
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
    expect(result, isA<DateTime?>());
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
    expect(result, isA<DateTime?>());
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
    expect(result.userPassports.length, greaterThan(0));
    expect(result.userPassports[0], isNotNull);
  });

  test('getUserVehicles returns correct list', () async {
    final result = await helper.getUserVehicles();
    expect(result.length, greaterThan(0));
    expect(result[0], isNotNull);
  });

  test('getUserUnPaidViolations returns correct list', () async {
    final result = await helper.getUserUnPaidViolations();
    expect(result.length, greaterThan(0));
    expect(result[0], isNotNull);
  });

  test('getUserPaidViolations returns correct list', () async {
    final result = await helper.getUserPaidViolations();
    expect(result.length, greaterThan(0));
    expect(result[0], isNotNull);
  });
}
