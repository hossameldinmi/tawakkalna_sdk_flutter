import 'package:tawakkalna_sdk_flutter/src/models/device_info.dart';
import 'package:tawakkalna_sdk_flutter/src/models/family_member.dart';
import 'package:tawakkalna_sdk_flutter/src/models/national_address.dart';

import 'platform_facade_io.dart' if (dart.library.html) 'platform_facade_web.dart';

abstract class PlatformUtilFacade {
  Future<String> generateToken();
  Future<int> getUserId();
  Future<int> getUserGender();
  Future<String> getUserMobileNumber();
  Future<Map<String, String>> getUserFullName();
  Future<String> getUserNationalityIso();
  Future<List<Map<String, dynamic>>> getUserFamilyMembers();
  Future<void> openUrl(String url);
  Future<List<Map<String, dynamic>>> getUserNationalAddress();
  Future<void> startApiInterceptor();
  Future<void> generalLog(String eventName, String message);
  Future<Map<String, dynamic>> getDeviceInfo();
}

class TwkUtil {
  static final _facade = PlatformUtilFacadeImpl();

  static Future<String> generateToken() => _facade.generateToken();
  static Future<int> getUserId() => _facade.getUserId();
  static Future<int> getUserGender() => _facade.getUserGender();
  static Future<String> getUserMobileNumber() => _facade.getUserMobileNumber();
  static Future<Map<String, String>> getUserFullName() => _facade.getUserFullName();
  static Future<String> getUserNationalityIso() => _facade.getUserNationalityIso();
  static Future<List<FamilyMember>> getUserFamilyMembers() =>
      _facade.getUserFamilyMembers().then((value) => value.map((e) => FamilyMember.fromJson(e)).toList());
  static Future<void> openUrl(String url) => _facade.openUrl(url);
  static Future<List<NationalAddress>> getUserNationalAddress() =>
      _facade.getUserNationalAddress().then((value) => value.map((e) => NationalAddress.fromJson(e)).toList());
  static Future<void> startApiInterceptor() => _facade.startApiInterceptor();
  static Future<void> generalLog(String eventName, String message) async {
    // _facade.generalLog(eventName, message);
  }

  static Future<DeviceInfo?> getDeviceInfo() => _facade.getDeviceInfo().then((v) => DeviceInfo.fromJson(v));
}
