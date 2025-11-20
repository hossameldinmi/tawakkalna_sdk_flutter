// ignore_for_file: depend_on_referenced_packages, avoid_web_libraries_in_flutter

@JS()
library;

import 'dart:js_interop';
import 'package:tawakkalna_sdk_flutter/src/apis/v2/twk_api_v2.dart';
import 'package:tawakkalna_sdk_flutter/src/core/logger.dart';

typedef JsonType = JSObject?;

// JS external declarations for all window.TWK.V2.* methods
@JS('window.TWK.V2.generateToken')
external JSPromise<JsonType> generateTokenV2Js();
@JS('window.TWK.V2.getUserFullName')
external JSPromise<JsonType> getUserFullNameV2Js();
@JS('window.TWK.V2.getUserFamilyMembers')
external JSPromise<JsonType> getUserFamilyMembersV2Js(JSAny? minage, JSAny? maxage, JSAny? gender);
@JS('window.TWK.V2.getUserSponsors')
external JSPromise<JsonType> getUserSponsorsV2Js(JSAny? minage, JSAny? maxage, JSAny? gender);
@JS('window.TWK.V2.getUserNationality')
external JSPromise<JsonType> getUserNationalityV2Js();

/// Tawakkalna SDK Helper for V2 API
///
/// This class provides access to all V2 endpoints of the Tawakkalna SDK.
/// Most methods correspond to the JavaScript window.TWK.V2.* functions.
class TwkApiV2SdkImpl implements TwkApiV2 {
  final _logger = TwkLogger();

  // ==================== Authentication Methods ====================

  @override
  Future<Map<String, dynamic>> generateToken() async {
    final jsValue = await generateTokenV2Js().toDart;
    _logger.debug('generateToken (V2) - jsValue: $jsValue', source: 'TwkApiV2');
    final dartValue = jsValue.dartify();
    _logger.debug('generateToken (V2) - dartValue: $dartValue', source: 'TwkApiV2');
    final value = (dartValue as Map)['result'];
    _logger.debug('generateToken (V2) - value: $value', source: 'TwkApiV2');
    return (value as Map).cast();
  }

  // ==================== User Data Methods ====================

  @override
  Future<Map<String, String>> getUserFullName() async {
    final jsValue = await getUserFullNameV2Js().toDart;
    _logger.debug('getUserFullName (V2) - jsValue: $jsValue', source: 'TwkApiV2');
    final dartValue = jsValue.dartify();
    _logger.debug('getUserFullName (V2) - dartValue: $dartValue', source: 'TwkApiV2');
    final value = (dartValue as Map)['result'];
    _logger.debug('getUserFullName (V2) - value: $value', source: 'TwkApiV2');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserFamilyMembers({int? minAge, int? maxAge, int? gender}) async {
    final jsValue = await getUserFamilyMembersV2Js(minAge?.toJS, maxAge?.toJS, gender?.toJS).toDart;
    _logger.debug('getUserFamilyMembers (V2) - jsValue: $jsValue', source: 'TwkApiV2');
    final dartValue = jsValue.dartify();
    _logger.debug('getUserFamilyMembers (V2) - dartValue: $dartValue', source: 'TwkApiV2');
    final value = (dartValue as Map)['result'];
    _logger.debug('getUserFamilyMembers (V2) - value: $value', source: 'TwkApiV2');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserSponsors({int? minAge, int? maxAge, int? gender}) async {
    final jsValue = await getUserSponsorsV2Js(minAge?.toJS, maxAge?.toJS, gender?.toJS).toDart;
    _logger.debug('getUserSponsors (V2) - jsValue: $jsValue', source: 'TwkApiV2');
    final dartValue = jsValue.dartify();
    _logger.debug('getUserSponsors (V2) - dartValue: $dartValue', source: 'TwkApiV2');
    final value = (dartValue as Map)['result'];
    _logger.debug('getUserSponsors (V2) - value: $value', source: 'TwkApiV2');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserNationality() async {
    final jsValue = await getUserNationalityV2Js().toDart;
    _logger.debug('getUserNationality (V2) - jsValue: $jsValue', source: 'TwkApiV2');
    final dartValue = jsValue.dartify();
    _logger.debug('getUserNationality (V2) - dartValue: $dartValue', source: 'TwkApiV2');
    final value = (dartValue as Map)['result'];
    _logger.debug('getUserNationality (V2) - value: $value', source: 'TwkApiV2');
    return (value as Map).cast();
  }
}
