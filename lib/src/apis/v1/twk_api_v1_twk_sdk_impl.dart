// ignore_for_file: depend_on_referenced_packages, avoid_web_libraries_in_flutter

@JS()
library js_interop;

import 'dart:convert';
import 'dart:typed_data';
import 'dart:js_interop';

import 'package:cross_file/cross_file.dart';
import 'package:flutter/foundation.dart';
import 'package:js/js_util.dart' as js_util;
import 'package:tawakkalna_sdk_flutter/src/apis/v1/twk_api_v1.dart';

// Helper extension to safely cast JSAny? to Object for promiseToFuture
extension _JSAnyHelper on JSAny? {
  Object get asObject => this as Object;
}

// JS external declarations for all twk_v1.js methods
@JS()
external JSAny? getRawDataJs(JSAny? file);
@JS()
external JSAny? getUserIdJs();
@JS()
external JSAny? getUserTypeJs();
@JS()
external JSAny? getUserBirthDateJs();
@JS()
external JSAny? getUserMobileNumberJs();
@JS()
external JSAny? getUserGenderJs();
@JS()
external JSAny? getUserLocationJs();
@JS()
external JSAny? getUserNationalityJs();
@JS()
external JSAny? getUserNationalityIsoJs();
@JS()
external JSAny? getUserFullNameJs();
@JS()
external JSAny? getUserMaritalStatusJs();
@JS()
external JSAny? getUserHealthStatusJs();
@JS()
external JSAny? getUserDisabilityTypeJs();
@JS()
external JSAny? getUserBloodTypeJs();
@JS()
external JSAny? getUserNationalAddressJs();
@JS()
external JSAny? getUserDegreeTypeJs();
@JS()
external JSAny? getUserOccupationJs();
@JS()
external JSAny? getUserFamilyMembersJs(JSAny? minage, JSAny? maxage, JSAny? gender);
@JS()
external JSAny? getUserSponsorsJs(JSAny? minage, JSAny? maxage, JSAny? gender);
@JS()
external JSAny? getUserUnPaidViolationsJs();
@JS()
external JSAny? getUserPaidViolationsJs();
@JS()
external JSAny? getUserVehiclesJs();
@JS()
external JSAny? getUserProfilePhotoJs();
@JS()
external JSAny? getUserPassportsJs();
@JS()
external JSAny? getDeviceInfoJs();
@JS()
external JSAny? getGallerySingleJs();
@JS()
external JSAny? getGalleryMultiJs();
@JS()
external JSAny? getGallerySingleVideoJs();
@JS()
external JSAny? getGalleryMultiVideoJs();
@JS()
external JSAny? getCameraPhotoJs();
@JS()
external JSAny? getCameraVideoJs();
@JS()
external JSAny? getFileBase64Js();
@JS()
external JSAny? getFileIdJs();
@JS()
external JSAny? askUserLocationPermissionJs();
@JS()
external JSAny? askUserPreciseLocationPermissionJs();
@JS()
external JSAny? askCameraPermissionJs();
@JS()
external JSAny? askGalleryPermissionJs();
@JS()
external JSAny? askPushNotificationPermissionJs();
@JS()
external JSAny? authenticateBiometricJs();
@JS()
external JSAny? shareScreenShotJs();
@JS()
external JSAny? openScreenJs(JSAny? screenType, JSAny? valuesParam);
@JS()
external JSAny? postCardJs(JSAny? actionType, JSAny? payload);
@JS()
external JSAny? generateTokenJs();
@JS()
external JSAny? shareJs(JSAny? fileName, JSAny? content, JSAny? mimetype);
@JS()
external JSAny? scanCodeJs();
@JS()
external JSAny? openServiceJs(JSAny? serviceId, JSAny? valuesParam);
@JS()
external JSAny? getImageJs(JSAny? nationalId);
@JS()
external JSAny? setPaymentConfigurationJs(
    JSAny? callbackSuccessUrlList, JSAny? callbackFailureUrlList, JSAny? successPageName, JSAny? failurePageName);
@JS()
external JSAny? generalLogJs(JSAny? eventName, JSAny? logType, JSAny? logMessage);
@JS()
external JSAny? apiLogJs(JSAny? url, JSAny? methodType, JSAny? requestBody, JSAny? requestHeaders,
    JSAny? requestDateTime, JSAny? responseBody, JSAny? responseHeaders, JSAny? responseDateTime, JSAny? responseCode);
@JS()
external JSAny? addDocumentJs(JSAny? documentName, JSAny? documentContent, JSAny? referenceNumber, JSAny? categoryId);
@JS()
external JSAny? updateDocumentJs(
    JSAny? documentName, JSAny? documentContent, JSAny? referenceNumber, JSAny? categoryId);
@JS()
external JSAny? deleteDocumentJs(JSAny? referenceNumber, JSAny? categoryId);
@JS()
external JSAny? getUserIdExpiryDateJs();
@JS()
external JSAny? startApiInterceptJs();
@JS()
external JSAny? getUserDocumentNumberJs();
@JS()
external JSAny? getUserBirthCityJs();
@JS()
external JSAny? openUrlJs(JSAny? url, JSAny? urlType);
@JS()
external JSAny? getUserEmailJs();
@JS()
external JSAny? getUserIqamaTypeJs();
@JS()
external JSAny? livenessCheckCameraJs(JSAny? configurations);
@JS()
external JSAny? livenessCheckImageFromGalleryJs(JSAny? configurations);
@JS()
external JSAny? livenessCheckImageFromFilesJs(JSAny? configurations);

/// Tawakkalna SDK Helper for V1 API
///
/// This class provides access to all V1 endpoints of the Tawakkalna SDK.
/// Most methods correspond to the JavaScript window.TWK.* functions.
class TwkApiV1TwkSdkImpl implements TwkApiV1 {
  // ==================== User Data Methods ====================

  @override
  Future<Map<String, dynamic>> getUserId() async {
    final response = await js_util.promiseToFuture(getUserIdJs().asObject);
    if (kDebugMode) print('getUserId response: $response');
    return json.decode(response);
  }

  @override
  Future<Map<String, dynamic>> getUserType() async {
    final response = await js_util.promiseToFuture(getUserTypeJs().asObject);
    if (kDebugMode) print('getUserType response: $response');
    return json.decode(response);
  }

  @override
  Future<Map<String, dynamic>> getUserBirthDate() async {
    final response = await js_util.promiseToFuture(getUserBirthDateJs().asObject);
    if (kDebugMode) print('getUserBirthDate response: $response');
    return json.decode(response);
  }

  @override
  Future<Map<String, dynamic>> getUserMobileNumber() async {
    final response = await js_util.promiseToFuture(getUserMobileNumberJs().asObject);
    if (kDebugMode) print('getUserMobileNumber response: $response');
    return json.decode(response);
  }

  @override
  Future<Map<String, dynamic>> getUserGender() async {
    final response = await js_util.promiseToFuture(getUserGenderJs().asObject);
    if (kDebugMode) print('getUserGender response: $response');
    return json.decode(response);
  }

  @override
  Future<Map<String, dynamic>> getUserLocation() async {
    final response = await js_util.promiseToFuture(getUserLocationJs().asObject);
    if (kDebugMode) print('getUserLocation response: $response');
    return json.decode(response);
  }

  @override
  Future<Map<String, dynamic>> getUserNationality() async {
    final response = await js_util.promiseToFuture(getUserNationalityJs().asObject);
    if (kDebugMode) print('getUserNationality response: $response');
    return json.decode(response);
  }

  @override
  Future<Map<String, dynamic>> getUserNationalityIso() async {
    final response = await js_util.promiseToFuture(getUserNationalityIsoJs().asObject);
    if (kDebugMode) print('getUserNationalityIso response: $response');
    return json.decode(response);
  }

  @override
  Future<Map<String, String>> getUserFullName() async {
    final response = await js_util.promiseToFuture(getUserFullNameJs().asObject);
    if (kDebugMode) print('getUserFullName response: $response');
    return Map<String, String>.from(json.decode(response));
  }

  @override
  Future<Map<String, dynamic>> getUserMaritalStatus() async {
    final response = await js_util.promiseToFuture(getUserMaritalStatusJs().asObject);
    if (kDebugMode) print('getUserMaritalStatus response: $response');
    return json.decode(response);
  }

  @override
  Future<Map<String, dynamic>> getUserHealthStatus() async {
    final response = await js_util.promiseToFuture(getUserHealthStatusJs().asObject);
    if (kDebugMode) print('getUserHealthStatus response: $response');
    return json.decode(response);
  }

  @override
  Future<Map<String, dynamic>> getUserDisabilityType() async {
    final response = await js_util.promiseToFuture(getUserDisabilityTypeJs().asObject);
    if (kDebugMode) print('getUserDisabilityType response: $response');
    return json.decode(response);
  }

  @override
  Future<Map<String, dynamic>> getUserBloodType() async {
    final response = await js_util.promiseToFuture(getUserBloodTypeJs().asObject);
    if (kDebugMode) print('getUserBloodType response: $response');
    return json.decode(response);
  }

  @override
  Future<Map<String, dynamic>> getUserNationalAddress() async {
    final response = await js_util.promiseToFuture(getUserNationalAddressJs().asObject);
    if (kDebugMode) print('getUserNationalAddress response: $response');
    return json.decode(response);
  }

  @override
  Future<Map<String, dynamic>> getUserDegreeType() async {
    final response = await js_util.promiseToFuture(getUserDegreeTypeJs().asObject);
    if (kDebugMode) print('getUserDegreeType response: $response');
    return json.decode(response);
  }

  @override
  Future<Map<String, dynamic>> getUserOccupation() async {
    final response = await js_util.promiseToFuture(getUserOccupationJs().asObject);
    if (kDebugMode) print('getUserOccupation response: $response');
    return json.decode(response);
  }

  @override
  Future<Map<String, dynamic>> getUserFamilyMembers({int? minAge, int? maxAge, int? gender}) async {
    final response =
        await js_util.promiseToFuture(getUserFamilyMembersJs(minAge?.toJS, maxAge?.toJS, gender?.toJS).asObject);
    if (kDebugMode) print('getUserFamilyMembers response: $response');
    return json.decode(response);
  }

  @override
  Future<Map<String, dynamic>> getUserSponsors({int? minAge, int? maxAge, int? gender}) async {
    final response =
        await js_util.promiseToFuture(getUserSponsorsJs(minAge?.toJS, maxAge?.toJS, gender?.toJS).asObject);
    if (kDebugMode) print('getUserSponsors response: $response');
    return json.decode(response);
  }

  @override
  Future<Map<String, dynamic>> getUserUnPaidViolations() async {
    final response = await js_util.promiseToFuture(getUserUnPaidViolationsJs().asObject);
    if (kDebugMode) print('getUserUnPaidViolations response: $response');
    return json.decode(response);
  }

  @override
  Future<Map<String, dynamic>> getUserPaidViolations() async {
    final response = await js_util.promiseToFuture(getUserPaidViolationsJs().asObject);
    if (kDebugMode) print('getUserPaidViolations response: $response');
    return json.decode(response);
  }

  @override
  Future<Map<String, dynamic>> getUserVehicles() async {
    final response = await js_util.promiseToFuture(getUserVehiclesJs().asObject);
    if (kDebugMode) print('getUserVehicles response: $response');
    return json.decode(response);
  }

  @override
  Future<Map<String, dynamic>> getUserProfilePhoto() async {
    final response = await js_util.promiseToFuture(getUserProfilePhotoJs().asObject);
    if (kDebugMode) print('getUserProfilePhoto response: $response');
    return json.decode(response);
  }

  @override
  Future<Map<String, dynamic>> getUserPassports() async {
    final response = await js_util.promiseToFuture(getUserPassportsJs().asObject);
    if (kDebugMode) print('getUserPassports response: $response');
    return json.decode(response);
  }

  @override
  Future<Map<String, dynamic>> getUserIdExpiryDate() async {
    final response = await js_util.promiseToFuture(getUserIdExpiryDateJs().asObject);
    if (kDebugMode) print('getUserIdExpiryDate response: $response');
    return json.decode(response);
  }

  @override
  Future<Map<String, dynamic>> getUserDocumentNumber() async {
    final response = await js_util.promiseToFuture(getUserDocumentNumberJs().asObject);
    if (kDebugMode) print('getUserDocumentNumber response: $response');
    return json.decode(response);
  }

  @override
  Future<Map<String, dynamic>> getUserBirthCity() async {
    final response = await js_util.promiseToFuture(getUserBirthCityJs().asObject);
    if (kDebugMode) print('getUserBirthCity response: $response');
    return json.decode(response);
  }

  @override
  Future<Map<String, dynamic>> getUserEmail() async {
    final response = await js_util.promiseToFuture(getUserEmailJs().asObject);
    if (kDebugMode) print('getUserEmail response: $response');
    return json.decode(response);
  }

  @override
  Future<Map<String, dynamic>> getUserIqamaType() async {
    final response = await js_util.promiseToFuture(getUserIqamaTypeJs().asObject);
    if (kDebugMode) print('getUserIqamaType response: $response');
    return json.decode(response);
  }

  @override
  Future<Uint8List?> getImage(String nationalId) async {
    final response = await js_util.promiseToFuture(getImageJs(nationalId.toJS).asObject);
    if (kDebugMode) print('getImage response length: ${response?.length ?? 0}');
    if (response == null) return null;
    return Uint8List.fromList(base64Decode(response));
  }

  // ==================== Device & Capabilities Methods ====================

  @override
  Future<Map<String, dynamic>> getDeviceInfo() async {
    final response = await js_util.promiseToFuture(getDeviceInfoJs().asObject);
    if (kDebugMode) print('getDeviceInfo response: $response');
    return json.decode(response);
  }

  // ==================== Gallery Methods ====================

  @override
  Future<XFile?> getGallerySingle() async {
    final result = await js_util.promiseToFuture(getGallerySingleJs().asObject);
    if (kDebugMode) print('getGallerySingle response: $result');
    if (result == null) return null;
    final file = json.decode(result);
    return XFile(file['path']);
  }

  @override
  Future<List<XFile>> getGalleryMulti() async {
    final result = await js_util.promiseToFuture(getGalleryMultiJs().asObject);
    if (kDebugMode) print('getGalleryMulti response: $result');
    final List<dynamic> files = json.decode(result);
    return files.map((f) => XFile(f['path'])).toList();
  }

  @override
  Future<XFile?> getGallerySingleVideo() async {
    final result = await js_util.promiseToFuture(getGallerySingleVideoJs().asObject);
    if (kDebugMode) print('getGallerySingleVideo response: $result');
    if (result == null) return null;
    final file = json.decode(result);
    return XFile(file['path']);
  }

  @override
  Future<List<XFile>> getGalleryMultiVideo() async {
    final result = await js_util.promiseToFuture(getGalleryMultiVideoJs().asObject);
    if (kDebugMode) print('getGalleryMultiVideo response: $result');
    final List<dynamic> files = json.decode(result);
    return files.map((f) => XFile(f['path'])).toList();
  }

  // ==================== Camera Methods ====================

  @override
  Future<XFile?> getCameraPhoto() async {
    final result = await js_util.promiseToFuture(getCameraPhotoJs().asObject);
    if (kDebugMode) print('getCameraPhoto response: $result');
    if (result == null) return null;
    final file = json.decode(result);
    return XFile(file['path']);
  }

  @override
  Future<XFile?> getCameraVideo() async {
    final result = await js_util.promiseToFuture(getCameraVideoJs().asObject);
    if (kDebugMode) print('getCameraVideo response: $result');
    if (result == null) return null;
    final file = json.decode(result);
    return XFile(file['path']);
  }

  // ==================== File Methods ====================

  @override
  Future<Uint8List> getRawData(XFile file) async {
    final result = await js_util.promiseToFuture(getRawDataJs(file.path.toJS).asObject);
    if (kDebugMode) print('getRawData response length: ${result?.length ?? 0}');
    return Uint8List.fromList(base64Decode(result));
  }

  @override
  Future<String?> getFileBase64() async {
    final result = await js_util.promiseToFuture(getFileBase64Js().asObject);
    if (kDebugMode) print('getFileBase64 response length: ${result?.length ?? 0}');
    return result as String?;
  }

  @override
  Future<String?> getFileId() async {
    final result = await js_util.promiseToFuture(getFileIdJs().asObject);
    if (kDebugMode) print('getFileId response: $result');
    return result as String?;
  }

  // ==================== Permission Methods ====================

  @override
  Future<bool> askUserLocationPermission() async {
    final response = await js_util.promiseToFuture(askUserLocationPermissionJs().asObject);
    if (kDebugMode) print('askUserLocationPermission response: $response');
    return json.decode(response) as bool;
  }

  @override
  Future<bool> askUserPreciseLocationPermission() async {
    final response = await js_util.promiseToFuture(askUserPreciseLocationPermissionJs().asObject);
    if (kDebugMode) print('askUserPreciseLocationPermission response: $response');
    return json.decode(response) as bool;
  }

  @override
  Future<bool> askCameraPermission() async {
    final response = await js_util.promiseToFuture(askCameraPermissionJs().asObject);
    if (kDebugMode) print('askCameraPermission response: $response');
    return json.decode(response) as bool;
  }

  @override
  Future<bool> askGalleryPermission() async {
    final response = await js_util.promiseToFuture(askGalleryPermissionJs().asObject);
    if (kDebugMode) print('askGalleryPermission response: $response');
    return json.decode(response) as bool;
  }

  @override
  Future<bool> askPushNotificationPermission() async {
    final response = await js_util.promiseToFuture(askPushNotificationPermissionJs().asObject);
    if (kDebugMode) print('askPushNotificationPermission response: $response');
    return json.decode(response) as bool;
  }

  // ==================== Authentication Methods ====================

  @override
  Future<Map<String, dynamic>> authenticateBiometric() async {
    final response = await js_util.promiseToFuture(authenticateBiometricJs().asObject);
    if (kDebugMode) print('authenticateBiometric response: $response');
    return json.decode(response);
  }

  @override
  Future<Map<String, dynamic>> generateToken() async {
    final response = await js_util.promiseToFuture(generateTokenJs().asObject);
    if (kDebugMode) print('generateToken response: $response');
    return json.decode(response);
  }

  // ==================== Share Methods ====================

  @override
  Future<void> shareScreenShot() async {
    final response = await js_util.promiseToFuture(shareScreenShotJs().asObject);
    if (kDebugMode) print('shareScreenShot response: $response');
  }

  @override
  Future<void> share({required String fileName, required String content, required String mimeType}) async {
    final response = await js_util.promiseToFuture(shareJs(fileName.toJS, content.toJS, mimeType.toJS).asObject);
    if (kDebugMode) print('share response: $response');
  }

  // ==================== Navigation Methods ====================

  @override
  Future<void> openScreen({required String screenType, Map<String, dynamic>? params}) async {
    final response = await js_util.promiseToFuture(openScreenJs(screenType.toJS, params?.jsify()).asObject);
    if (kDebugMode) print('openScreen response: $response');
  }

  @override
  Future<void> openService({required String serviceId, Map<String, dynamic>? params}) async {
    final response = await js_util.promiseToFuture(openServiceJs(serviceId.toJS, params?.jsify()).asObject);
    if (kDebugMode) print('openService response: $response');
  }

  @override
  Future<void> openUrl({required String url, required int urlType}) async {
    final response = await js_util.promiseToFuture(openUrlJs(url.toJS, urlType.toJS).asObject);
    if (kDebugMode) print('openUrl response: $response');
  }

  // ==================== Card Methods ====================

  @override
  Future<void> postCard({required String actionType, required Map<String, dynamic> payload}) async {
    final response = await js_util.promiseToFuture(postCardJs(actionType.toJS, payload.jsify()).asObject);
    if (kDebugMode) print('postCard response: $response');
  }

  // ==================== Scanner Methods ====================

  @override
  Future<String?> scanCode() async {
    final response = await js_util.promiseToFuture(scanCodeJs().asObject);
    if (kDebugMode) print('scanCode response: $response');
    return response as String?;
  }

  // ==================== Payment Methods ====================

  @override
  Future<void> setPaymentConfiguration({
    required List<String> callbackSuccessUrlList,
    required List<String> callbackFailureUrlList,
    required String successPageName,
    required String failurePageName,
  }) async {
    final response = await js_util.promiseToFuture(
      setPaymentConfigurationJs(
        callbackSuccessUrlList.jsify(),
        callbackFailureUrlList.jsify(),
        successPageName.toJS,
        failurePageName.toJS,
      ).asObject,
    );
    if (kDebugMode) print('setPaymentConfiguration response: $response');
  }

  // ==================== Logging Methods ====================

  @override
  Future<void> generalLog({
    required String eventName,
    required int logType,
    required String logMessage,
  }) async {
    final response = await js_util.promiseToFuture(
      generalLogJs(eventName.toJS, logType.toJS, logMessage.toJS).asObject,
    );
    if (kDebugMode) print('generalLog response: $response');
  }

  @override
  Future<void> apiLog({
    required String url,
    required int methodType,
    String? requestBody,
    Map<String, String>? requestHeaders,
    DateTime? requestDateTime,
    String? responseBody,
    Map<String, String>? responseHeaders,
    DateTime? responseDateTime,
    required int responseCode,
  }) async {
    final response = await js_util.promiseToFuture(
      apiLogJs(
        url.toJS,
        methodType.toJS,
        requestBody?.toJS,
        requestHeaders?.jsify(),
        requestDateTime?.toIso8601String().toJS,
        responseBody?.toJS,
        responseHeaders?.jsify(),
        responseDateTime?.toIso8601String().toJS,
        responseCode.toJS,
      ).asObject,
    );
    if (kDebugMode) print('apiLog response: $response');
  }

  @override
  Future<void> startApiIntercept() async {
    final response = await js_util.promiseToFuture(startApiInterceptJs().asObject);
    if (kDebugMode) print('startApiIntercept response: $response');
  }

  // ==================== Document Methods ====================

  @override
  Future<void> addDocument({
    required String documentName,
    required String documentContent,
    required String referenceNumber,
    required int categoryId,
  }) async {
    final response = await js_util.promiseToFuture(
      addDocumentJs(documentName.toJS, documentContent.toJS, referenceNumber.toJS, categoryId.toJS).asObject,
    );
    if (kDebugMode) print('addDocument response: $response');
  }

  @override
  Future<void> updateDocument({
    required String documentName,
    required String documentContent,
    required String referenceNumber,
    required int categoryId,
  }) async {
    final response = await js_util.promiseToFuture(
      updateDocumentJs(documentName.toJS, documentContent.toJS, referenceNumber.toJS, categoryId.toJS).asObject,
    );
    if (kDebugMode) print('updateDocument response: $response');
  }

  @override
  Future<void> deleteDocument({
    required String referenceNumber,
    required int categoryId,
  }) async {
    final response = await js_util.promiseToFuture(
      deleteDocumentJs(referenceNumber.toJS, categoryId.toJS).asObject,
    );
    if (kDebugMode) print('deleteDocument response: $response');
  }

  // ==================== Liveness Check Methods ====================

  @override
  Future<Map<String, dynamic>?> livenessCheckCamera({
    List<Map<String, dynamic>>? configurations,
  }) async {
    final response = await js_util.promiseToFuture(
      livenessCheckCameraJs(configurations?.jsify()).asObject,
    );
    if (kDebugMode) print('livenessCheckCamera response: $response');
    if (response == null) return null;
    return json.decode(response);
  }

  @override
  Future<Map<String, dynamic>?> livenessCheckImageFromGallery({
    List<Map<String, dynamic>>? configurations,
  }) async {
    final response = await js_util.promiseToFuture(
      livenessCheckImageFromGalleryJs(configurations?.jsify()).asObject,
    );
    if (kDebugMode) print('livenessCheckImageFromGallery response: $response');
    if (response == null) return null;
    return json.decode(response);
  }

  @override
  Future<Map<String, dynamic>?> livenessCheckImageFromFiles({
    List<Map<String, dynamic>>? configurations,
  }) async {
    final response = await js_util.promiseToFuture(
      livenessCheckImageFromFilesJs(configurations?.jsify()).asObject,
    );
    if (kDebugMode) print('livenessCheckImageFromFiles response: $response');
    if (response == null) return null;
    return json.decode(response);
  }
}
