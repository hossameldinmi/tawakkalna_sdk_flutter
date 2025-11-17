// ignore_for_file: depend_on_referenced_packages, avoid_web_libraries_in_flutter

@JS()
library js_interop;

import 'dart:convert';
import 'dart:js_interop';
import 'package:cross_file/cross_file.dart';
import 'package:flutter/foundation.dart';
import 'package:tawakkalna_sdk_flutter/src/apis/v1/twk_api_v1.dart';

typedef JsonType = JSObject?;

// JS external declarations for all twk_v1.js methods
@JS()
external JSPromise<JsonType> getRawDataJs(JSAny? file);
@JS()
external JSPromise<JsonType> getUserIdJs();
@JS()
external JSPromise<JsonType> getUserTypeJs();
@JS()
external JSPromise<JsonType> getUserBirthDateJs();
@JS()
external JSPromise<JsonType> getUserMobileNumberJs();
@JS()
external JSPromise<JsonType> getUserGenderJs();
@JS()
external JSPromise<JsonType> getUserLocationJs();
@JS()
external JSPromise<JsonType> getUserNationalityJs();
@JS()
external JSPromise<JsonType> getUserNationalityIsoJs();
@JS()
external JSPromise<JsonType> getUserFullNameJs();
@JS()
external JSPromise<JsonType> getUserMaritalStatusJs();
@JS()
external JSPromise<JsonType> getUserHealthStatusJs();
@JS()
external JSPromise<JsonType> getUserDisabilityTypeJs();
@JS()
external JSPromise<JsonType> getUserBloodTypeJs();
@JS()
external JSPromise<JsonType> getUserNationalAddressJs();
@JS()
external JSPromise<JsonType> getUserDegreeTypeJs();
@JS()
external JSPromise<JsonType> getUserOccupationJs();
@JS()
external JSPromise<JsonType> getUserFamilyMembersJs(JSAny? minage, JSAny? maxage, JSAny? gender);
@JS()
external JSPromise<JsonType> getUserSponsorsJs(JSAny? minage, JSAny? maxage, JSAny? gender);
@JS()
external JSPromise<JsonType> getUserUnPaidViolationsJs();
@JS()
external JSPromise<JsonType> getUserPaidViolationsJs();
@JS()
external JSPromise<JsonType> getUserVehiclesJs();
@JS()
external JSPromise<JsonType> getUserProfilePhotoJs();
@JS()
external JSPromise<JsonType> getUserPassportsJs();
@JS()
external JSPromise<JsonType> getDeviceInfoJs();
@JS()
external JSPromise<JsonType> getGallerySingleJs();
@JS()
external JSPromise<JsonType> getGalleryMultiJs();
@JS()
external JSPromise<JsonType> getGallerySingleVideoJs();
@JS()
external JSPromise<JsonType> getGalleryMultiVideoJs();
@JS()
external JSPromise<JsonType> getCameraPhotoJs();
@JS()
external JSPromise<JsonType> getCameraVideoJs();
@JS()
external JSPromise<JsonType> getFileBase64Js();
@JS()
external JSPromise<JsonType> getFileIdJs();
@JS()
external JSPromise<JsonType> askUserLocationPermissionJs();
@JS()
external JSPromise<JsonType> askUserPreciseLocationPermissionJs();
@JS()
external JSPromise<JsonType> askCameraPermissionJs();
@JS()
external JSPromise<JsonType> askGalleryPermissionJs();
@JS()
external JSPromise<JsonType> askPushNotificationPermissionJs();
@JS()
external JSPromise<JsonType> authenticateBiometricJs();
@JS()
external JSPromise<JsonType> shareScreenShotJs();
@JS()
external JSPromise<JsonType> openScreenJs(JSAny? screenType, JSAny? valuesParam);
@JS()
external JSPromise<JsonType> postCardJs(JSAny? actionType, JSAny? payload);
@JS()
external JSPromise<JsonType> generateTokenJs();
@JS()
external JSPromise<JsonType> shareJs(JSAny? fileName, JSAny? content, JSAny? mimetype);
@JS()
external JSPromise<JsonType> scanCodeJs();
@JS()
external JSPromise<JsonType> openServiceJs(JSAny? serviceId, JSAny? valuesParam);
@JS()
external JSPromise<JsonType> getImageJs(JSAny? nationalId);
@JS()
external JSPromise<JsonType> setPaymentConfigurationJs(
    JSAny? callbackSuccessUrlList, JSAny? callbackFailureUrlList, JSAny? successPageName, JSAny? failurePageName);
@JS()
external JSPromise<JsonType> generalLogJs(JSAny? eventName, JSAny? logType, JSAny? logMessage);
@JS()
external JSPromise<JsonType> apiLogJs(JSAny? url, JSAny? methodType, JSAny? requestBody, JSAny? requestHeaders,
    JSAny? requestDateTime, JSAny? responseBody, JSAny? responseHeaders, JSAny? responseDateTime, JSAny? responseCode);
@JS()
external JSPromise<JsonType> addDocumentJs(
    JSAny? documentName, JSAny? documentContent, JSAny? referenceNumber, JSAny? categoryId);
@JS()
external JSPromise<JsonType> updateDocumentJs(
    JSAny? documentName, JSAny? documentContent, JSAny? referenceNumber, JSAny? categoryId);
@JS()
external JSPromise<JsonType> deleteDocumentJs(JSAny? referenceNumber, JSAny? categoryId);
@JS()
external JSPromise<JsonType> getUserIdExpiryDateJs();
@JS()
external JSPromise<JsonType> startApiInterceptJs();
@JS()
external JSPromise<JsonType> getUserDocumentNumberJs();
@JS()
external JSPromise<JsonType> getUserBirthCityJs();
@JS()
external JSPromise<JsonType> openUrlJs(JSAny? url, JSAny? urlType);
@JS()
external JSPromise<JsonType> getUserEmailJs();
@JS()
external JSPromise<JsonType> getUserIqamaTypeJs();
@JS()
external JSPromise<JsonType> livenessCheckCameraJs(JSAny? configurations);
@JS()
external JSPromise<JsonType> livenessCheckImageFromGalleryJs(JSAny? configurations);
@JS()
external JSPromise<JsonType> livenessCheckImageFromFilesJs(JSAny? configurations);

/// Tawakkalna SDK Helper for V1 API
///
/// This class provides access to all V1 endpoints of the Tawakkalna SDK.
/// Most methods correspond to the JavaScript window.TWK.* functions.
class TwkApiV1SdkImpl implements TwkApiV1 {
  // ==================== User Data Methods ====================

  @override
  Future<Map<String, dynamic>> getUserId() async {
    final jsValue = await getUserIdJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('getUserId response: $value');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserType() async {
    final jsValue = await getUserTypeJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('getUserType response: $value');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserBirthDate() async {
    final jsValue = await getUserBirthDateJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('getUserBirthDate response: $value');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserMobileNumber() async {
    final jsValue = await getUserMobileNumberJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('getUserMobileNumber response: $value');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserGender() async {
    final jsValue = await getUserGenderJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('getUserGender response: $value');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserLocation() async {
    final jsValue = await getUserLocationJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('getUserLocation response: $value');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserNationality() async {
    final jsValue = await getUserNationalityJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('getUserNationality response: $value');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserNationalityIso() async {
    final jsValue = await getUserNationalityIsoJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('getUserNationalityIso response: $value');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, String>> getUserFullName() async {
    final jsValue = await getUserFullNameJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('getUserFullName response: $value');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserMaritalStatus() async {
    final jsValue = await getUserMaritalStatusJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('getUserMaritalStatus response: $value');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserHealthStatus() async {
    final jsValue = await getUserHealthStatusJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('getUserHealthStatus response: $value');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserDisabilityType() async {
    final jsValue = await getUserDisabilityTypeJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('getUserDisabilityType response: $value');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserBloodType() async {
    final jsValue = await getUserBloodTypeJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('getUserBloodType response: $value');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserNationalAddress() async {
    final jsValue = await getUserNationalAddressJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('getUserNationalAddress response: $value');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserDegreeType() async {
    final jsValue = await getUserDegreeTypeJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('getUserDegreeType response: $value');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserOccupation() async {
    final jsValue = await getUserOccupationJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('getUserOccupation response: $value');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserFamilyMembers({int? minAge, int? maxAge, int? gender}) async {
    final jsValue = await getUserFamilyMembersJs(minAge?.toJS, maxAge?.toJS, gender?.toJS).toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('getUserFamilyMembers response: $value');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserSponsors({int? minAge, int? maxAge, int? gender}) async {
    final jsValue = await getUserSponsorsJs(minAge?.toJS, maxAge?.toJS, gender?.toJS).toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('getUserSponsors response: $value');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserUnPaidViolations() async {
    final jsValue = await getUserUnPaidViolationsJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('getUserUnPaidViolations response: $value');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserPaidViolations() async {
    final jsValue = await getUserPaidViolationsJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('getUserPaidViolations response: $value');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserVehicles() async {
    final jsValue = await getUserVehiclesJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('getUserVehicles response: $value');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserProfilePhoto() async {
    final jsValue = await getUserProfilePhotoJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('getUserProfilePhoto response: $value');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserPassports() async {
    final jsValue = await getUserPassportsJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('getUserPassports response: $value');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserIdExpiryDate() async {
    final jsValue = await getUserIdExpiryDateJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('getUserIdExpiryDate response: $value');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserDocumentNumber() async {
    final jsValue = await getUserDocumentNumberJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('getUserDocumentNumber response: $value');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserBirthCity() async {
    final jsValue = await getUserBirthCityJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('getUserBirthCity response: $value');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserEmail() async {
    final jsValue = await getUserEmailJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('getUserEmail response: $value');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserIqamaType() async {
    final jsValue = await getUserIqamaTypeJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('getUserIqamaType response: $value');
    return (value as Map).cast();
  }

  @override
  Future<Uint8List?> getImage(String nationalId) async {
    final jsValue = await getImageJs(nationalId.toJS).toDart;
    final value = jsValue?.dartify();
    if (kDebugMode) print('getImage response: $value');
    if (value == null) return null;
    final string = value as String;
    return Uint8List.fromList(base64Decode(string));
  }

  // ==================== Device & Capabilities Methods ====================

  @override
  Future<Map<String, dynamic>> getDeviceInfo() async {
    final jsValue = await getDeviceInfoJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('getDeviceInfo response: $value');
    return (value as Map).cast();
  }

  // ==================== Gallery Methods ====================

  @override
  Future<XFile?> getGallerySingle() async {
    final jsValue = await getGallerySingleJs().toDart;
    final value = jsValue?.dartify();
    if (kDebugMode) print('getGallerySingle response: $value');
    if (value == null) return null;
    final file = value as Map;
    return XFile(file['path']);
  }

  @override
  Future<List<XFile>> getGalleryMulti() async {
    final jsValue = await getGalleryMultiJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('getGalleryMulti response: $value');
    final List<dynamic> files = value as List<dynamic>;
    return files.map((f) => XFile((f as Map)['path'])).toList();
  }

  @override
  Future<XFile?> getGallerySingleVideo() async {
    final jsValue = await getGallerySingleVideoJs().toDart;
    final value = jsValue?.dartify();
    if (kDebugMode) print('getGallerySingleVideo response: $value');
    if (value == null) return null;
    final file = (value as Map).cast<String, dynamic>();
    return XFile(file['path']);
  }

  @override
  Future<List<XFile>> getGalleryMultiVideo() async {
    final jsValue = await getGalleryMultiVideoJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('getGalleryMultiVideo response: $value');
    final List<dynamic> files = value as List<dynamic>;
    return files.map((f) => XFile((f as Map)['path'])).toList();
  }

  // ==================== Camera Methods ====================

  @override
  Future<XFile?> getCameraPhoto() async {
    final jsValue = await getCameraPhotoJs().toDart;
    final value = jsValue?.dartify();
    if (kDebugMode) print('getCameraPhoto response: $value');
    if (value == null) return null;
    final file = (value as Map).cast<String, dynamic>();
    return XFile(file['path']);
  }

  @override
  Future<XFile?> getCameraVideo() async {
    final jsValue = await getCameraVideoJs().toDart;
    final value = jsValue?.dartify();
    if (kDebugMode) print('getCameraVideo response: $value');
    if (value == null) return null;
    final file = (value as Map).cast<String, dynamic>();
    return XFile(file['path']);
  }

  // ==================== File Methods ====================

  @override
  Future<Uint8List> getRawData(XFile file) async {
    final jsValue = await getRawDataJs(file.path.toJS).toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('getRawData response: $value');
    final string = value as String;
    return Uint8List.fromList(base64Decode(string));
  }

  @override
  Future<String?> getFileBase64() async {
    final jsValue = await getFileBase64Js().toDart;
    final value = jsValue?.dartify();
    if (kDebugMode) print('getFileBase64 response: $value');
    return value as String?;
  }

  @override
  Future<String?> getFileId() async {
    final jsValue = await getFileIdJs().toDart;
    final value = jsValue?.dartify();
    if (kDebugMode) print('getFileId response: $value');
    return value as String?;
  }

  // ==================== Permission Methods ====================

  @override
  Future<bool> askUserLocationPermission() async {
    final jsValue = await askUserLocationPermissionJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('askUserLocationPermission response: $value');
    return value as bool;
  }

  @override
  Future<bool> askUserPreciseLocationPermission() async {
    final jsValue = await askUserPreciseLocationPermissionJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('askUserPreciseLocationPermission response: $value');
    return value as bool;
  }

  @override
  Future<bool> askCameraPermission() async {
    final jsValue = await askCameraPermissionJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('askCameraPermission response: $value');
    return value as bool;
  }

  @override
  Future<bool> askGalleryPermission() async {
    final jsValue = await askGalleryPermissionJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('askGalleryPermission response: $value');
    return value as bool;
  }

  @override
  Future<bool> askPushNotificationPermission() async {
    final jsValue = await askPushNotificationPermissionJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('askPushNotificationPermission response: $value');
    return value as bool;
  }

  // ==================== Authentication Methods ====================

  @override
  Future<Map<String, dynamic>> authenticateBiometric() async {
    final jsValue = await authenticateBiometricJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('authenticateBiometric response: $value');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> generateToken() async {
    final jsValue = await generateTokenJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('generateToken response: $value');
    return (value as Map).cast();
  }

  // ==================== Share Methods ====================

  @override
  Future<void> shareScreenShot() async {
    final jsValue = await shareScreenShotJs().toDart;
    final value = jsValue?.dartify();
    if (kDebugMode) print('shareScreenShot response: $value');
  }

  @override
  Future<void> share({required String fileName, required String content, required String mimeType}) async {
    final jsValue = await shareJs(fileName.toJS, content.toJS, mimeType.toJS).toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('share response: $value');
  }

  // ==================== Navigation Methods ====================

  @override
  Future<void> openScreen({required String screenType, Map<String, dynamic>? params}) async {
    final jsValue = await openScreenJs(screenType.toJS, params?.jsify()).toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('openScreen response: $value');
  }

  @override
  Future<void> openService({required String serviceId, Map<String, dynamic>? params}) async {
    final jsValue = await openServiceJs(serviceId.toJS, params?.jsify()).toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('openService response: $value');
  }

  @override
  Future<void> openUrl({required String url, required int urlType}) async {
    final jsValue = await openUrlJs(url.toJS, urlType.toJS).toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('openUrl response: $value');
  }

  // ==================== Card Methods ====================

  @override
  Future<void> postCard({required String actionType, required Map<String, dynamic> payload}) async {
    final jsValue = await postCardJs(actionType.toJS, payload.jsify()).toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('postCard response: $value');
  }

  // ==================== Scanner Methods ====================

  @override
  Future<String?> scanCode() async {
    final jsValue = await scanCodeJs().toDart;
    final value = jsValue?.dartify();
    if (kDebugMode) print('scanCode response: $value');
    return value as String?;
  }

  // ==================== Payment Methods ====================

  @override
  Future<void> setPaymentConfiguration({
    required List<String> callbackSuccessUrlList,
    required List<String> callbackFailureUrlList,
    required String successPageName,
    required String failurePageName,
  }) async {
    final jsValue = await setPaymentConfigurationJs(
      callbackSuccessUrlList.jsify(),
      callbackFailureUrlList.jsify(),
      successPageName.toJS,
      failurePageName.toJS,
    ).toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('setPaymentConfiguration response: $value');
  }

  // ==================== Logging Methods ====================

  @override
  Future<void> generalLog({
    required String eventName,
    required int logType,
    required String logMessage,
  }) async {
    final jsValue = await generalLogJs(eventName.toJS, logType.toJS, logMessage.toJS).toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('generalLog response: $value');
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
    final jsValue = await apiLogJs(
      url.toJS,
      methodType.toJS,
      requestBody?.toJS,
      requestHeaders?.jsify(),
      requestDateTime?.toIso8601String().toJS,
      responseBody?.toJS,
      responseHeaders?.jsify(),
      responseDateTime?.toIso8601String().toJS,
      responseCode.toJS,
    ).toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('apiLog response: $value');
  }

  @override
  Future<void> startApiIntercept() async {
    final jsValue = await startApiInterceptJs().toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('startApiIntercept response: $value');
  }

  // ==================== Document Methods ====================

  @override
  Future<void> addDocument({
    required String documentName,
    required String documentContent,
    required String referenceNumber,
    required int categoryId,
  }) async {
    final jsValue =
        await addDocumentJs(documentName.toJS, documentContent.toJS, referenceNumber.toJS, categoryId.toJS).toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('addDocument response: $value');
  }

  @override
  Future<void> updateDocument({
    required String documentName,
    required String documentContent,
    required String referenceNumber,
    required int categoryId,
  }) async {
    final jsValue =
        await updateDocumentJs(documentName.toJS, documentContent.toJS, referenceNumber.toJS, categoryId.toJS).toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('updateDocument response: $value');
  }

  @override
  Future<void> deleteDocument({
    required String referenceNumber,
    required int categoryId,
  }) async {
    final jsValue = await deleteDocumentJs(referenceNumber.toJS, categoryId.toJS).toDart;
    final value = jsValue.dartify();
    if (kDebugMode) print('deleteDocument response: $value');
  }

  // ==================== Liveness Check Methods ====================

  @override
  Future<Map<String, dynamic>?> livenessCheckCamera({
    List<Map<String, dynamic>>? configurations,
  }) async {
    final jsValue = await livenessCheckCameraJs(configurations?.jsify()).toDart;
    final value = jsValue?.dartify();
    if (kDebugMode) print('livenessCheckCamera response: $value');
    if (value == null) return null;
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>?> livenessCheckImageFromGallery({
    List<Map<String, dynamic>>? configurations,
  }) async {
    final jsValue = await livenessCheckImageFromGalleryJs(configurations?.jsify()).toDart;
    final value = jsValue?.dartify();
    if (kDebugMode) print('livenessCheckImageFromGallery response: $value');
    if (value == null) return null;
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>?> livenessCheckImageFromFiles({
    List<Map<String, dynamic>>? configurations,
  }) async {
    final jsValue = await livenessCheckImageFromFilesJs(configurations?.jsify()).toDart;
    final value = jsValue?.dartify();
    if (kDebugMode) print('livenessCheckImageFromFiles response: $value');
    if (value == null) return null;
    return (value as Map).cast();
  }
}
