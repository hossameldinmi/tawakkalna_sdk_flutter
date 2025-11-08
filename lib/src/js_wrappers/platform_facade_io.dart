import 'package:tawakkalna_sdk_flutter/src/js_wrappers/twk_util.dart';

class PlatformUtilFacadeImpl implements PlatformUtilFacade {
  @override
  Future<int> getUserId() {
    throw UnimplementedError();
  }

  @override
  Future<String> generateToken() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, String>> getUserFullName() {
    throw UnimplementedError();
  }

  @override
  Future<int> getUserGender() {
    throw UnimplementedError();
  }

  @override
  Future<String> getUserMobileNumber() {
    throw UnimplementedError();
  }

  @override
  Future<String> getUserNationalityIso() {
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getUserFamilyMembers() {
    throw UnimplementedError();
  }

  @override
  Future<void> openUrl(String url) {
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getUserNationalAddress() {
    throw UnimplementedError();
  }

  @override
  Future<void> startApiInterceptor() {
    throw UnimplementedError();
  }

  @override
  Future<void> generalLog(String eventName, String message) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, String>> getDeviceInfo() {
    throw UnimplementedError();
  }
}
