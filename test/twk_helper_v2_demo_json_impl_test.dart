import 'package:flutter_test/flutter_test.dart';
import 'package:tawakkalna_sdk_flutter/twk.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final v2 = Twk(
    v1Api: TwkApiV1DemoJsonImpl(),
    v2Api: TwkApiV2DemoJsonImpl(),
  ).v2;
  test('generateToken returns correct token', () async {
    final token = await v2.generateToken();
    expect(token,
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYXRpb25hbElkIjoiMTAwMDAwMTIxMiIsImV4cCI6MTczODQxMDUzMywiaXNzIjoiVGF3YWtrYWxuYSIsImF1ZCI6Ik1pbmlTZXJ2aWNlMSJ9.AIN4Y6YtTBJLZLKcjtzMDlqSB42n0gP7YwMaqwnIxSudSKg0EChZLp4MElVl2LAkSq96YuSQsPZebmhhIuPsq7GybnhgVHsRi1BnWKG5ZTbZAbUxTX0-iMBjUHmbEWOlQYyn5Kxh9bfORY1yc8G6StPRV0P34xBrjEIKZFCUsEKsKUM02Y1eeByrCiCxlCHf9OBncqzkdpx-mYuNmLSNgCjNQ5AXzGP4ywwytg9cdCS4POlTJ4H6AqjVXCG5ZkAgs68XR_Q_-Wfp4o3K7DXUR9IjpkFA5TNI-F09m7Or_n0q-swSqR1FxOvDLVsBXWaqP0Rr9IV7S7f8gvS3KmYcxw');
  });

  test('getUserFullName returns correct FullName', () async {
    final fullName = await v2.getUserFullName();
    expect(fullName, const FullName(ar: "محمد عبدالعزيز", en: "Mohammad Abdalziz"));
  });

  test('getUserNationality returns correct Nationality', () async {
    final nationality = await v2.getUserNationality();
    expect(
        nationality,
        const NationalityEnity(
          nameAr: "المملكة العربيه السعودية",
          nameEn: "Kingdom of saudi arabia",
          nationality: Nationality.sa,
        ));
  });

  test('getUserFamilyMembers returns correct list of FamilyMember', () async {
    final members = await v2.getUserFamilyMembers();
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
    final sponsors = await v2.getUserSponsors();
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
}
