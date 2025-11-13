import 'package:flutter_test/flutter_test.dart';
import 'package:tawakkalna_sdk_flutter/twk.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final helper = Twk(v2Api: TwkApiV2DemoJsonImpl()).v2;

  test('generateToken returns correct token', () async {
    final token = await helper.generateToken();
    expect(token,
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYXRpb25hbElkIjoiMTAwMDAwMTIxMiIsImV4cCI6MTczODQxMDUzMywiaXNzIjoiVGF3YWtrYWxuYSIsImF1ZCI6Ik1pbmlTZXJ2aWNlMSJ9.AIN4Y6YtTBJLZLKcjtzMDlqSB42n0gP7YwMaqwnIxSudSKg0EChZLp4MElVl2LAkSq96YuSQsPZebmhhIuPsq7GybnhgVHsRi1BnWKG5ZTbZAbUxTX0-iMBjUHmbEWOlQYyn5Kxh9bfORY1yc8G6StPRV0P34xBrjEIKZFCUsEKsKUM02Y1eeByrCiCxlCHf9OBncqzkdpx-mYuNmLSNgCjNQ5AXzGP4ywwytg9cdCS4POlTJ4H6AqjVXCG5ZkAgs68XR_Q_-Wfp4o3K7DXUR9IjpkFA5TNI-F09m7Or_n0q-swSqR1FxOvDLVsBXWaqP0Rr9IV7S7f8gvS3KmYcxw');
  });

  test('getUserFullName returns correct FullName', () async {
    final fullName = await helper.getUserFullName();
    expect(fullName, isA<FullName>());
    expect(fullName.ar, "محمد عبدالعزيز");
    expect(fullName.en, "Mohammad Abdalziz");
  });

  test('getUserNationality returns correct Nationality', () async {
    final nationality = await helper.getUserNationality();
    expect(nationality, isA<NationalityEnity>());
    expect(nationality?.nameAr, "المملكة العربيه السعودية");
    expect(nationality?.nameEn, "Kingdom of saudi arabia");
    expect(nationality?.nationality, Nationality.sa);
  });

  test('getUserFamilyMembers returns correct list of FamilyMember', () async {
    final members = await helper.getUserFamilyMembers();
    expect(members, isA<List<FamilyMember>>());
    expect(members.length, 1);
    final member = members[0];
    expect(member.nameAr, "Name arabic");
    expect(member.nameEn, "Name english");
    expect(member.details.dateOfBirth, DateTime(1990, 01, 01));
  });

  test('getUserSponsors returns correct list of Sponsor', () async {
    final sponsors = await helper.getUserSponsors();
    expect(sponsors, isA<List<Sponsor>>());
    expect(sponsors.length, 1);
    final sponsor = sponsors[0];
    expect(sponsor.nameAr, "Name arabic");
    expect(sponsor.nameEn, "Name english");
    // No id field, so skip this assertion
  });
}
