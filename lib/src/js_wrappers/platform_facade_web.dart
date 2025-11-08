// ignore_for_file: depend_on_referenced_packages, avoid_web_libraries_in_flutter

@JS()
library js_interop;

import 'dart:convert';
import 'dart:developer';
import 'dart:js_interop';
import 'package:flutter/foundation.dart';
import 'package:js/js_util.dart' as js_util;
import 'package:tawakkalna_sdk_flutter/src/js_wrappers/twk_util.dart';

@JS()
external generateTokenJs();

@JS()
external getUserIdJs();
@JS()
external getUserFullNameJs();
@JS()
external getUserGenderJs();
@JS()
external getUserMobileNumberJs();
@JS()
external getUserNationalityIsoJs();
@JS()
external getUserFamilyMembersJs();

@JS()
external openUrlJs(String url);
@JS()
external getUserNationalAddressJs();

@JS()
external startApiInterceptJs();

@JS()
external generalLogJs(String eventName, String message);

@JS()
external getDeviceInfoJs();

class PlatformUtilFacadeImpl implements PlatformUtilFacade {
  @override
  Future<String> generateToken() async {
    try {
      final promise = generateTokenJs();
      log('promise');
      log(promise);
      final response = await js_util.promiseToFuture(promise);
      log('responseString');
      log(response);
      return json.decode(response)['token'];
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      rethrow;
    }
  }

  @override
  Future<int> getUserId() async {
    try {
      final request = getUserIdJs();
      final response = await js_util.promiseToFuture(request);
      log('responsStringe');
      log(response);
      return json.decode(response)['user_id'] as int;
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      rethrow;
    }
  }

  @override
  Future<Map<String, String>> getUserFullName() async {
    try {
      final request = getUserFullNameJs();
      final response = await js_util.promiseToFuture(request);
      log('responsStringe');
      log(response);
      return json.decode(response);
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      rethrow;
    }
  }

  @override
  Future<int> getUserGender() async {
    try {
      final request = getUserGenderJs();
      final response = await js_util.promiseToFuture(request);
      log('responsStringe');
      log(response);
      return json.decode(response)['gender'];
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      rethrow;
    }
  }

  @override
  Future<String> getUserMobileNumber() async {
    try {
      final request = getUserMobileNumberJs();
      final response = await js_util.promiseToFuture(request);
      log('responsStringe');
      log(response);
      return json.decode(response)['mobile_number'];
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      rethrow;
    }
  }

  @override
  Future<String> getUserNationalityIso() async {
    try {
      final request = getUserNationalityIsoJs();
      final response = await js_util.promiseToFuture(request);
      log('responsStringe');
      log(response);
      return json.decode(response)['nationality_iso'];
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getUserFamilyMembers() async {
    try {
      late final response;
      if (!kDebugMode) {
        final request = getUserFamilyMembersJs();
        response = await js_util.promiseToFuture(request);
        generalLog('Family-Members', json.encode(response));
        log('responsStringe');
        log(response);
      }
      return kDebugMode
          ? [
              {
                "national_id": 0,
                "id_expiry_date_hijri": "1449/06/16",
                "id_expiry_date_gregorian": "2027/11/15",
                "name_ar": "Name arabic",
                "name_en": "Name english",
                "gender": 1,
                "details": {
                  "nationality": "Egypt",
                  "relation": "Son",
                  "passport_number": "A0012",
                  "date_of_birth": "01/01/1990",
                  "birth_city": "القاهرة"
                }
              }
            ]
          : json.decode(response)['family_members'];
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      rethrow;
    }
  }

  @override
  Future<void> openUrl(String url) async {
    try {
      final request = openUrlJs(url);
      log("openUrl request::::::::::::::::: $url");
      TwkUtil.generalLog("openUrl - url", url);
      final result = await js_util.promiseToFuture(request);
      TwkUtil.generalLog("openUrl - result", result);
      log("openUrl result::::::::::::::::: $result");
    } catch (e, st) {
      TwkUtil.generalLog("openUrl - error", e.toString());
      log("openUrl e::::::::::::::::: $e");
      log("openUrl st::::::::::::::::: $st");
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getUserNationalAddress() async {
    try {
      late final response;
      if (!kDebugMode) {
        final request = getUserNationalAddressJs();
        response = await js_util.promiseToFuture(request);
        log('responsStringe');
        log(response);
      }
      return kDebugMode
          ? [
              {
                "details": {
                  "additional_no": "7559",
                  "building_no": "3693",
                  "city": "RIYADH",
                  "district_name": "Al Muruj Dist.",
                  "section_type": "9",
                  "short_address": "RHGA3693",
                  "street_name": "Bani Qais",
                  "zip_code": "12284"
                },
                "is_primary_address": true,
                "summary": {
                  "address_counter": "Address 1",
                  "section_type": "10",
                  "address_en": "RHGA3693, 3693, Al Muruj Dist., 7559, Bani Qais, RIYADH",
                  "address_ar": "RHGA3693, 3693, حي المروج, 7559, بني قيس, الرياض",
                  "latitude": 24.7326068545263,
                  "longitude": 46.5989362244768
                }
              }
            ]
          : json.decode(response)['national_addresses'];
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      rethrow;
    }
  }

  @override
  Future<void> startApiInterceptor() async {
    if (!kDebugMode) {
      try {
        final request = startApiInterceptJs();
        await js_util.promiseToFuture(request);
      } catch (e, st) {
        log(e.toString());
        log(st.toString());
      }
    }
  }

  @override
  Future<void> generalLog(String eventName, String message) async {
    if (!kDebugMode) {
      try {
        final request = generalLogJs(eventName, message);
        await js_util.promiseToFuture(request);
      } catch (e, st) {
        log(e.toString());
        log(st.toString());
      }
    }
  }

  @override
  Future<Map<String, dynamic>> getDeviceInfo() async {
    if (!kDebugMode) {
      try {
        final request = getDeviceInfoJs();
        final response = await js_util.promiseToFuture(request);
        return json.decode(response) as Map<String, dynamic>;
      } catch (e, st) {
        log(e.toString());
        log(st.toString());
        return {};
      }
    }
    return {};
  }
}
