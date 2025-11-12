import 'package:flutter_test/flutter_test.dart';
import 'package:tawakkalna_sdk_flutter/src/services/v2/twk_helper_v2_impl.dart';
import 'package:tawakkalna_sdk_flutter/src/apis/v2/twk_api_v2_demo_json_impl.dart';
import 'package:tawakkalna_sdk_flutter/src/models/family_member.dart';
import 'package:tawakkalna_sdk_flutter/src/models/full_name.dart';
import 'package:tawakkalna_sdk_flutter/src/models/nationality.dart';
import 'package:tawakkalna_sdk_flutter/src/models/sponsor.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late TwkHelperV2Impl helper;

  setUp(() async {
    final api = TwkApiV2DemoJsonImpl();
    helper = TwkHelperV2Impl(api);
  });

  test('generateToken returns correct token', () async {
    final token = await helper.generateToken();
    expect(token, isNotEmpty);
    expect(token, isA<String>());
  });

  test('getUserFullName returns correct FullName', () async {
    final fullName = await helper.getUserFullName();
    expect(fullName, isA<FullName>());
    expect(fullName.ar, "محمد عبدالعزيز");
    expect(fullName.en, "Mohammad Abdalziz");
  });

  test('getUserNationality returns correct Nationality', () async {
    final nationality = await helper.getUserNationality();
    expect(nationality, isA<Nationality>());
    expect(nationality?.nameAr, isNotEmpty);
    expect(nationality?.nameEn, isNotEmpty);
  });

  test('getUserFamilyMembers returns correct list of FamilyMember', () async {
    final members = await helper.getUserFamilyMembers();
    expect(members, isA<List<FamilyMember>>());
    expect(members.length, greaterThan(0));
    expect(members.first, isA<FamilyMember>());
  });

  test('getUserSponsors returns correct list of Sponsor', () async {
    final sponsors = await helper.getUserSponsors();
    expect(sponsors, isA<List<Sponsor>>());
    expect(sponsors.length, greaterThan(0));
    expect(sponsors.first, isA<Sponsor>());
  });
}
