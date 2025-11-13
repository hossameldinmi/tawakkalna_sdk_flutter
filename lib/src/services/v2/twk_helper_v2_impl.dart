import 'package:tawakkalna_sdk_flutter/src/apis/v2/twk_api_v2.dart';
import 'package:tawakkalna_sdk_flutter/src/enums/gender.dart';
import 'package:tawakkalna_sdk_flutter/src/models/family_member.dart';
import 'package:tawakkalna_sdk_flutter/src/models/full_name.dart';
import 'package:tawakkalna_sdk_flutter/src/models/nationality_entity.dart';
import 'package:tawakkalna_sdk_flutter/src/models/sponsor.dart';
import 'package:tawakkalna_sdk_flutter/src/services/v2/twk_helper_v2.dart';

class TwkHelperV2Impl implements TwkHelperV2 {
  final TwkApiV2 _api;
  TwkHelperV2Impl(this._api);

  @override
  Future<String> generateToken() => _api.generateToken().then((r) => r['token']);

  @override
  Future<List<FamilyMember>> getUserFamilyMembers({int? minAge, int? maxAge, Gender? gender}) {
    return _api
        .getUserFamilyMembers(
          minAge: minAge,
          maxAge: maxAge,
          gender: gender?.value,
        )
        .then((r) => r['family_members'] as List)
        .then((list) => list.map((e) => FamilyMember.fromJson(e)).toList());
  }

  @override
  Future<FullName> getUserFullName() => _api.getUserFullName().then((json) => FullName.fromJson(json));

  @override
  Future<NationalityEnity?> getUserNationality() =>
      _api.getUserNationality().then((json) => NationalityEnity.fromJson(json));

  @override
  Future<List<Sponsor>> getUserSponsors({int? minAge, int? maxAge, Gender? gender}) => _api
          .getUserSponsors(
            minAge: minAge,
            maxAge: maxAge,
            gender: gender?.value,
          )
          .then((r) => r['sponsors'] as List)
          .then((list) {
        return list.map((e) => Sponsor.fromJson(e)).toList();
      });
}
