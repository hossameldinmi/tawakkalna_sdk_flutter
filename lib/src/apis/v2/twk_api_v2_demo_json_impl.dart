import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:tawakkalna_sdk_flutter/src/apis/v2/twk_api_v2.dart';

class TwkApiV2DemoJsonImpl implements TwkApiV2 {
  final String jsonPath;
  final AssetBundle? assetBundle;
  final Map<String, dynamic> _map = {};
  TwkApiV2DemoJsonImpl(
      {this.jsonPath = 'packages/tawakkalna_sdk_flutter/assets/mock_profile1.0.2.json', this.assetBundle});

  dynamic _getResponseFromJson(String path) => _map[path];

  Future<void> _loadJsonIfNeeded() async {
    if (_map.isNotEmpty) return;
    final bundle = assetBundle ?? rootBundle;
    final jsonString = await bundle.loadString(jsonPath);
    if (jsonString.isEmpty) return;
    final json = jsonDecode(jsonString);
    final list = json['mock_endpoints'] as List;
    _map.addEntries(list.map((e) => MapEntry(e['path'], e['return'])));
  }

  @override
  Future<Map<String, dynamic>> generateToken() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/v2/authenticate/generatetoken');
    return response;
  }

  @override
  Future<Map<String, dynamic>> getUserFamilyMembers({int? minAge, int? maxAge, int? gender}) async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/v2/user_data/family_members');
    return response;
  }

  @override
  Future<Map<String, String>> getUserFullName() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/v2/user_data/full_name') as Map;
    return response.cast();
  }

  @override
  Future<Map<String, dynamic>> getUserNationality() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/v2/user_data/nationality_name');
    return response;
  }

  @override
  Future<Map<String, dynamic>> getUserSponsors({int? minAge, int? maxAge, int? gender}) async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/v2/user_data/sponsors');
    return response;
  }
}
