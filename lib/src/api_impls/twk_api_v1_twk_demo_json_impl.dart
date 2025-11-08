import 'dart:convert';
import 'dart:typed_data';

import 'package:cross_file/cross_file.dart';
import 'package:flutter/services.dart';
import 'package:tawakkalna_sdk_flutter/src/enums/gender.dart';
import 'package:tawakkalna_sdk_flutter/src/interfaces/apis/twk_api_v1.dart';

class TwkApiV1DemoJsonImpl implements TwkApiV1 {
  final String jsonPath;
  final AssetBundle? assetBundle;
  final Map<String, dynamic> _map = {};
  TwkApiV1DemoJsonImpl({this.jsonPath = 'mock_profile1.0.2.json', this.assetBundle});

  dynamic _getResponseFromJson(String path) => (_map['mock_endpoints'] as List<dynamic>)
      .firstWhere((element) => element['path'] == path, orElse: () => null)?['return'];

  Future<void> _loadJsonIfNeeded() async {
    if (_map.isEmpty) {
      final bundle = assetBundle ?? rootBundle;
      final jsonString = await bundle.loadString(jsonPath);
      _map.addAll(await Future.value(Map<String, dynamic>.from(await Future.value(
          jsonString.isNotEmpty ? await Future.value(jsonDecode(jsonString)) : <String, dynamic>{}))));
    }
  }

  @override
  Future<void> addDocument(
      {required String documentName,
      required String documentContent,
      required String referenceNumber,
      required int categoryId}) async {
    // TODO: implement addDocument
    throw UnimplementedError();
  }

  @override
  Future<void> apiLog(
      {required String url,
      required int methodType,
      String? requestBody,
      Map<String, String>? requestHeaders,
      DateTime? requestDateTime,
      String? responseBody,
      Map<String, String>? responseHeaders,
      DateTime? responseDateTime,
      required int responseCode}) {
    // TODO: implement apiLog
    throw UnimplementedError();
  }

  @override
  Future<bool> askCameraPermission() {
    // TODO: implement askCameraPermission
    throw UnimplementedError();
  }

  @override
  Future<bool> askGalleryPermission() {
    // TODO: implement askGalleryPermission
    throw UnimplementedError();
  }

  @override
  Future<bool> askPushNotificationPermission() {
    // TODO: implement askPushNotificationPermission
    throw UnimplementedError();
  }

  @override
  Future<bool> askUserLocationPermission() {
    // TODO: implement askUserLocationPermission
    throw UnimplementedError();
  }

  @override
  Future<bool> askUserPreciseLocationPermission() {
    // TODO: implement askUserPreciseLocationPermission
    throw UnimplementedError();
  }

  @override
  Future<bool> authenticateBiometric() async {
    await _loadJsonIfNeeded();
    return _getResponseFromJson('/authenticate/biometric') as bool;
  }

  @override
  Future<void> deleteDocument({required String referenceNumber, required int categoryId}) {
    // TODO: implement deleteDocument
    throw UnimplementedError();
  }

  @override
  Future<void> generalLog({required String eventName, required int logType, required String logMessage}) {
    // TODO: implement generalLog
    throw UnimplementedError();
  }

  @override
  Future<String> generateToken() async {
    await _loadJsonIfNeeded();
    return _getResponseFromJson('/authenticate/generatetoken') as String;
  }

  @override
  Future<XFile?> getCameraPhoto() {
    // TODO: implement getCameraPhoto
    throw UnimplementedError();
  }

  @override
  Future<XFile?> getCameraVideo() {
    // TODO: implement getCameraVideo
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getDeviceInfo() {
    // TODO: implement getDeviceInfo
    throw UnimplementedError();
  }

  @override
  Future<String?> getFileBase64() {
    // TODO: implement getFileBase64
    throw UnimplementedError();
  }

  @override
  Future<String?> getFileId() {
    // TODO: implement getFileId
    throw UnimplementedError();
  }

  @override
  Future<List<XFile>> getGalleryMulti() {
    // TODO: implement getGalleryMulti
    throw UnimplementedError();
  }

  @override
  Future<List<XFile>> getGalleryMultiVideo() {
    // TODO: implement getGalleryMultiVideo
    throw UnimplementedError();
  }

  @override
  Future<XFile?> getGallerySingle() {
    // TODO: implement getGallerySingle
    throw UnimplementedError();
  }

  @override
  Future<XFile?> getGallerySingleVideo() {
    // TODO: implement getGallerySingleVideo
    throw UnimplementedError();
  }

  @override
  Future<Uint8List?> getImage(String nationalId) {
    // TODO: implement getImage
    throw UnimplementedError();
  }

  @override
  Future<Uint8List> getRawData(XFile file) {
    // TODO: implement getRawData
    throw UnimplementedError();
  }

  @override
  Future<String?> getUserBirthCity() {
    // TODO: implement getUserBirthCity
    throw UnimplementedError();
  }

  @override
  Future<String?> getUserBirthDate() async {
    await _loadJsonIfNeeded();
    return _getResponseFromJson('/user_data/birth_date') as String;
  }

  @override
  Future<String?> getUserBloodType() async {
    await _loadJsonIfNeeded();
    return _getResponseFromJson('/user_data/blood_type') as String?;
  }

  @override
  Future<String?> getUserDegreeType() async {
    await _loadJsonIfNeeded();
    return _getResponseFromJson('/user_data/degree_type') as String?;
  }

  @override
  Future<String?> getUserDisabilityType() {
    // TODO: implement getUserDisabilityType
    throw UnimplementedError();
  }

  @override
  Future<String?> getUserDocumentNumber() async {
    await _loadJsonIfNeeded();
    return _getResponseFromJson('/user_data/document_number') as String?;
  }

  @override
  Future<String?> getUserEmail() async {
    await _loadJsonIfNeeded();
    return _getResponseFromJson('/user_data/email') as String?;
  }

  @override
  Future<List<Map<String, dynamic>>> getUserFamilyMembers({int? minAge, int? maxAge, int? gender}) {
    // TODO: implement getUserFamilyMembers
    throw UnimplementedError();
  }

  @override
  Future<Map<String, String>> getUserFullName() {
    // TODO: implement getUserFullName
    throw UnimplementedError();
  }

  @override
  Future<int?> getUserGender() {
    // TODO: implement getUserGender
    throw UnimplementedError();
  }

  @override
  Future<String?> getUserHealthStatus() {
    // TODO: implement getUserHealthStatus
    throw UnimplementedError();
  }

  @override
  Future<int> getUserId() {
    // TODO: implement getUserId
    throw UnimplementedError();
  }

  @override
  Future<DateTime?> getUserIdExpiryDate() {
    // TODO: implement getUserIdExpiryDate
    throw UnimplementedError();
  }

  @override
  Future<String?> getUserIqamaType() {
    // TODO: implement getUserIqamaType
    throw UnimplementedError();
  }

  @override
  Future<Map<String, double?>> getUserLocation() {
    // TODO: implement getUserLocation
    throw UnimplementedError();
  }

  @override
  Future<String?> getUserMaritalStatus() {
    // TODO: implement getUserMaritalStatus
    throw UnimplementedError();
  }

  @override
  Future<String?> getUserMobileNumber() {
    // TODO: implement getUserMobileNumber
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getUserNationalAddress() {
    // TODO: implement getUserNationalAddress
    throw UnimplementedError();
  }

  @override
  Future<String?> getUserNationality() {
    // TODO: implement getUserNationality
    throw UnimplementedError();
  }

  @override
  Future<String?> getUserNationalityIso() {
    // TODO: implement getUserNationalityIso
    throw UnimplementedError();
  }

  @override
  Future<String?> getUserOccupation() {
    // TODO: implement getUserOccupation
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getUserPaidViolations() {
    // TODO: implement getUserPaidViolations
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getUserPassports() {
    // TODO: implement getUserPassports
    throw UnimplementedError();
  }

  @override
  Future<String?> getUserProfilePhoto() {
    // TODO: implement getUserProfilePhoto
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getUserSponsors({int? minAge, int? maxAge, Gender? gender}) {
    // TODO: implement getUserSponsors
    throw UnimplementedError();
  }

  @override
  Future<int> getUserType() {
    // TODO: implement getUserType
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getUserUnPaidViolations() {
    // TODO: implement getUserUnPaidViolations
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getUserVehicles() {
    // TODO: implement getUserVehicles
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>?> livenessCheckCamera({List<Map<String, dynamic>>? configurations}) {
    // TODO: implement livenessCheckCamera
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>?> livenessCheckImageFromFiles({List<Map<String, dynamic>>? configurations}) {
    // TODO: implement livenessCheckImageFromFiles
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>?> livenessCheckImageFromGallery({List<Map<String, dynamic>>? configurations}) {
    // TODO: implement livenessCheckImageFromGallery
    throw UnimplementedError();
  }

  @override
  Future<void> openScreen({required String screenType, Map<String, dynamic>? params}) {
    // TODO: implement openScreen
    throw UnimplementedError();
  }

  @override
  Future<void> openService({required String serviceId, Map<String, dynamic>? params}) {
    // TODO: implement openService
    throw UnimplementedError();
  }

  @override
  Future<void> openUrl({required String url, required int urlType}) {
    // TODO: implement openUrl
    throw UnimplementedError();
  }

  @override
  Future<void> postCard({required String actionType, required Map<String, dynamic> payload}) {
    // TODO: implement postCard
    throw UnimplementedError();
  }

  @override
  Future<String?> scanCode() {
    // TODO: implement scanCode
    throw UnimplementedError();
  }

  @override
  Future<void> setPaymentConfiguration(
      {required List<String> callbackSuccessUrlList,
      required List<String> callbackFailureUrlList,
      required String successPageName,
      required String failurePageName}) {
    // TODO: implement setPaymentConfiguration
    throw UnimplementedError();
  }

  @override
  Future<void> share({required String fileName, required String content, required String mimeType}) {
    // TODO: implement share
    throw UnimplementedError();
  }

  @override
  Future<void> shareScreenShot() {
    // TODO: implement shareScreenShot
    throw UnimplementedError();
  }

  @override
  Future<void> startApiIntercept() {
    // TODO: implement startApiIntercept
    throw UnimplementedError();
  }

  @override
  Future<void> updateDocument(
      {required String documentName,
      required String documentContent,
      required String referenceNumber,
      required int categoryId}) {
    // TODO: implement updateDocument
    throw UnimplementedError();
  }
}
