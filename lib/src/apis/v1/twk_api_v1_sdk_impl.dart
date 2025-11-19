// ignore_for_file: depend_on_referenced_packages, avoid_web_libraries_in_flutter

@JS()
library;

import 'dart:convert';
import 'dart:js_interop';
import 'package:flutter/foundation.dart';
import 'package:tawakkalna_sdk_flutter/src/apis/v1/twk_api_v1.dart';
import 'package:tawakkalna_sdk_flutter/src/core/logger.dart';
import 'package:tawakkalna_sdk_flutter/src/models/twk_file.dart';

typedef JsonType = JSObject?;

// JS external declarations for all twk_v1.js methods
@JS('window.TWK.getRawData')
external JSPromise<JsonType> getRawDataJs(JSAny? file);
@JS('window.TWK.getUserId')
external JSPromise<JsonType> getUserIdJs();
@JS('window.TWK.getUserType')
external JSPromise<JsonType> getUserTypeJs();
@JS('window.TWK.getUserBirthDate')
external JSPromise<JsonType> getUserBirthDateJs();
@JS('window.TWK.getUserMobileNumber')
external JSPromise<JsonType> getUserMobileNumberJs();
@JS('window.TWK.getUserGender')
external JSPromise<JsonType> getUserGenderJs();
@JS('window.TWK.getUserLocation')
external JSPromise<JsonType> getUserLocationJs();
@JS('window.TWK.getUserNationality')
external JSPromise<JsonType> getUserNationalityJs();
@JS('window.TWK.getUserNationalityISO')
external JSPromise<JsonType> getUserNationalityIsoJs();
@JS('window.TWK.getUserFullName')
external JSPromise<JsonType> getUserFullNameJs();
@JS('window.TWK.getUserMaritalStatus')
external JSPromise<JsonType> getUserMaritalStatusJs();
@JS('window.TWK.getUserHealthStatus')
external JSPromise<JsonType> getUserHealthStatusJs();
@JS('window.TWK.getUserDisabilityType')
external JSPromise<JsonType> getUserDisabilityTypeJs();
@JS('window.TWK.getUserBloodType')
external JSPromise<JsonType> getUserBloodTypeJs();
@JS('window.TWK.getUserNationalAddress')
external JSPromise<JsonType> getUserNationalAddressJs();
@JS('window.TWK.getUserDegreeType')
external JSPromise<JsonType> getUserDegreeTypeJs();
@JS('window.TWK.getUserOccupation')
external JSPromise<JsonType> getUserOccupationJs();
@JS('window.TWK.getUserFamilyMembers')
external JSPromise<JsonType> getUserFamilyMembersJs(JSAny? minage, JSAny? maxage, JSAny? gender);
@JS('window.TWK.getUserSponsors')
external JSPromise<JsonType> getUserSponsorsJs(JSAny? minage, JSAny? maxage, JSAny? gender);
@JS('window.TWK.getUserUnPaidViolations')
external JSPromise<JsonType> getUserUnPaidViolationsJs();
@JS('window.TWK.getUserPaidViolations')
external JSPromise<JsonType> getUserPaidViolationsJs();
@JS('window.TWK.getUserVehicles')
external JSPromise<JsonType> getUserVehiclesJs();
@JS('window.TWK.getUserProfilePhoto')
external JSPromise<JsonType> getUserProfilePhotoJs();
@JS('window.TWK.getUserPassports')
external JSPromise<JsonType> getUserPassportsJs();
@JS('window.TWK.getDeviceInfo')
external JSPromise<JsonType> getDeviceInfoJs();
@JS('window.TWK.getGallerySingle')
external JSPromise<JsonType> getGallerySingleJs();
@JS('window.TWK.getGalleryMulti')
external JSPromise<JsonType> getGalleryMultiJs();
@JS('window.TWK.getGallerySingleVideo')
external JSPromise<JsonType> getGallerySingleVideoJs();
@JS('window.TWK.getGalleryMultiVideo')
external JSPromise<JsonType> getGalleryMultiVideoJs();
@JS('window.TWK.getCameraPhoto')
external JSPromise<JsonType> getCameraPhotoJs();
@JS('window.TWK.getCameraVideo')
external JSPromise<JsonType> getCameraVideoJs();
@JS('window.TWK.getFileBase64')
external JSPromise<JsonType> getFileBase64Js();
@JS('window.TWK.getFileId')
external JSPromise<JsonType> getFileIdJs();
@JS('window.TWK.askUserLocationPermission')
external JSPromise<JsonType> askUserLocationPermissionJs();
@JS('window.TWK.askUserPreciseLocationPermission')
external JSPromise<JsonType> askUserPreciseLocationPermissionJs();
@JS('window.TWK.askCameraPermission')
external JSPromise<JsonType> askCameraPermissionJs();
@JS('window.TWK.askGalleryPermission')
external JSPromise<JsonType> askGalleryPermissionJs();
@JS('window.TWK.askPushNotificationPermission')
external JSPromise<JsonType> askPushNotificationPermissionJs();
@JS('window.TWK.authenticateBiometric')
external JSPromise<JsonType> authenticateBiometricJs();
@JS('window.TWK.shareScreenShot')
external JSPromise<JsonType> shareScreenShotJs();
@JS('window.TWK.openScreen')
external JSPromise<JsonType> openScreenJs(JSAny? screenType, JSAny? valuesParam);
@JS('window.TWK.postCard')
external JSPromise<JsonType> postCardJs(JSAny? actionType, JSAny? payload);
@JS('window.TWK.generateToken')
external JSPromise<JsonType> generateTokenJs();
@JS('window.TWK.share')
external JSPromise<JsonType> shareJs(JSAny? fileName, JSAny? content, JSAny? mimetype);
@JS('window.TWK.scanCode')
external JSPromise<JsonType> scanCodeJs();
@JS('window.TWK.openService')
external JSPromise<JsonType> openServiceJs(JSAny? serviceId, JSAny? valuesParam);
@JS('window.TWK.getImage')
external JSPromise<JsonType> getImageJs(JSAny? nationalId);
@JS('window.TWK.setPaymentConfiguration')
external JSPromise<JsonType> setPaymentConfigurationJs(
    JSAny? callbackSuccessUrlList, JSAny? callbackFailureUrlList, JSAny? successPageName, JSAny? failurePageName);
@JS('window.TWK.generalLog')
external JSPromise<JsonType> generalLogJs(JSAny? eventName, JSAny? logType, JSAny? logMessage);
@JS('window.TWK.apiLog')
external JSPromise<JsonType> apiLogJs(JSAny? url, JSAny? methodType, JSAny? requestBody, JSAny? requestHeaders,
    JSAny? requestDateTime, JSAny? responseBody, JSAny? responseHeaders, JSAny? responseDateTime, JSAny? responseCode);
@JS('window.TWK.addDocument')
external JSPromise<JsonType> addDocumentJs(
    JSAny? documentName, JSAny? documentContent, JSAny? referenceNumber, JSAny? categoryId);
@JS('window.TWK.updateDocument')
external JSPromise<JsonType> updateDocumentJs(
    JSAny? documentName, JSAny? documentContent, JSAny? referenceNumber, JSAny? categoryId);
@JS('window.TWK.deleteDocument')
external JSPromise<JsonType> deleteDocumentJs(JSAny? referenceNumber, JSAny? categoryId);
@JS('window.TWK.getUserIdExpiryDate')
external JSPromise<JsonType> getUserIdExpiryDateJs();
@JS('window.TWK.startApiIntercept')
external JSPromise<JsonType> startApiInterceptJs();
@JS('window.TWK.getUserDocumentNumber')
external JSPromise<JsonType> getUserDocumentNumberJs();
@JS('window.TWK.getUserBirthCity')
external JSPromise<JsonType> getUserBirthCityJs();
@JS('window.TWK.openUrl')
external JSPromise<JsonType> openUrlJs(JSString url, JSNumber? urlType);
@JS('window.TWK.getUserEmail')
external JSPromise<JsonType> getUserEmailJs();
@JS('window.TWK.getUserIqamaType')
external JSPromise<JsonType> getUserIqamaTypeJs();
@JS('window.TWK.livenessCheckCamera')
external JSPromise<JsonType> livenessCheckCameraJs(JSAny? configurations);
@JS('window.TWK.livenessCheckImageFromGallery')
external JSPromise<JsonType> livenessCheckImageFromGalleryJs(JSAny? configurations);
@JS('window.TWK.livenessCheckImageFromFiles')
external JSPromise<JsonType> livenessCheckImageFromFilesJs(JSAny? configurations);

/// Tawakkalna SDK Helper for V1 API
///
/// This class provides access to all V1 endpoints of the Tawakkalna SDK.
/// Most methods correspond to the JavaScript window.TWK.* functions.
class TwkApiV1SdkImpl implements TwkApiV1 {
  final _logger = TwkLogger();

  // ==================== User Data Methods ====================

  @override
  Future<Map<String, dynamic>> getUserId() async {
    _logger.debug('sdk implementation - getUserId called');
    final func = getUserIdJs();
    _logger.debug('getUserId - func: $func', source: 'TwkApiV1');
    final jsValue = await func.toDart;
    _logger.debug('getUserId - jsValue: ${jsValue ?? 'NULLVALUE'}', source: 'TwkApiV1');
    final dartValue = jsValue?.dartify();
    _logger.debug('getUserId - dartValue: ${dartValue ?? 'NULLVALUE'}', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('getUserId - value: ${value ?? 'NULLVALUE'}', source: 'TwkApiV1');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserType() async {
    final jsValue = await getUserTypeJs().toDart;
    _logger.debug('getUserType - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('getUserType - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('getUserType - value: $value', source: 'TwkApiV1');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserBirthDate() async {
    final jsValue = await getUserBirthDateJs().toDart;
    _logger.debug('getUserBirthDate - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('getUserBirthDate - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('getUserBirthDate - value: $value', source: 'TwkApiV1');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserMobileNumber() async {
    final jsValue = await getUserMobileNumberJs().toDart;
    _logger.debug('getUserMobileNumber - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('getUserMobileNumber - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('getUserMobileNumber - value: $value', source: 'TwkApiV1');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserGender() async {
    final jsValue = await getUserGenderJs().toDart;
    _logger.debug('getUserGender - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('getUserGender - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('getUserGender - value: $value', source: 'TwkApiV1');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserLocation() async {
    final jsValue = await getUserLocationJs().toDart;
    _logger.debug('getUserLocation - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('getUserLocation - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('getUserLocation - value: $value', source: 'TwkApiV1');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserNationality() async {
    final jsValue = await getUserNationalityJs().toDart;
    _logger.debug('getUserNationality - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('getUserNationality - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('getUserNationality - value: $value', source: 'TwkApiV1');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserNationalityIso() async {
    final jsValue = await getUserNationalityIsoJs().toDart;
    _logger.debug('getUserNationalityIso - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('getUserNationalityIso - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('getUserNationalityIso - value: $value', source: 'TwkApiV1');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, String>> getUserFullName() async {
    final jsValue = await getUserFullNameJs().toDart;
    _logger.debug('getUserFullName - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('getUserFullName - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('getUserFullName - value: $value', source: 'TwkApiV1');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserMaritalStatus() async {
    final jsValue = await getUserMaritalStatusJs().toDart;
    _logger.debug('getUserMaritalStatus - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('getUserMaritalStatus - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('getUserMaritalStatus - value: $value', source: 'TwkApiV1');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserHealthStatus() async {
    final jsValue = await getUserHealthStatusJs().toDart;
    _logger.debug('getUserHealthStatus - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('getUserHealthStatus - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('getUserHealthStatus - value: $value', source: 'TwkApiV1');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserDisabilityType() async {
    final jsValue = await getUserDisabilityTypeJs().toDart;
    _logger.debug('getUserDisabilityType - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('getUserDisabilityType - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('getUserDisabilityType - value: $value', source: 'TwkApiV1');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserBloodType() async {
    final jsValue = await getUserBloodTypeJs().toDart;
    _logger.debug('getUserBloodType - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('getUserBloodType - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('getUserBloodType - value: $value', source: 'TwkApiV1');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserNationalAddress() async {
    final jsValue = await getUserNationalAddressJs().toDart;
    _logger.debug('getUserNationalAddress - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('getUserNationalAddress - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('getUserNationalAddress - value: $value', source: 'TwkApiV1');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserDegreeType() async {
    final jsValue = await getUserDegreeTypeJs().toDart;
    _logger.debug('getUserDegreeType - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('getUserDegreeType - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('getUserDegreeType - value: $value', source: 'TwkApiV1');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserOccupation() async {
    final jsValue = await getUserOccupationJs().toDart;
    _logger.debug('getUserOccupation - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('getUserOccupation - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('getUserOccupation - value: $value', source: 'TwkApiV1');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserFamilyMembers({int? minAge, int? maxAge, int? gender}) async {
    final jsValue = await getUserFamilyMembersJs(minAge?.toJS, maxAge?.toJS, gender?.toJS).toDart;
    _logger.debug('getUserFamilyMembers - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('getUserFamilyMembers - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('getUserFamilyMembers - value: $value', source: 'TwkApiV1');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserSponsors({int? minAge, int? maxAge, int? gender}) async {
    final jsValue = await getUserSponsorsJs(minAge?.toJS, maxAge?.toJS, gender?.toJS).toDart;
    _logger.debug('getUserSponsors - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('getUserSponsors - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('getUserSponsors - value: $value', source: 'TwkApiV1');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserUnPaidViolations() async {
    final jsValue = await getUserUnPaidViolationsJs().toDart;
    _logger.debug('getUserUnPaidViolations - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('getUserUnPaidViolations - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('getUserUnPaidViolations - value: $value', source: 'TwkApiV1');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserPaidViolations() async {
    final jsValue = await getUserPaidViolationsJs().toDart;
    _logger.debug('getUserPaidViolations - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('getUserPaidViolations - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('getUserPaidViolations - value: $value', source: 'TwkApiV1');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserVehicles() async {
    final jsValue = await getUserVehiclesJs().toDart;
    _logger.debug('getUserVehicles - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('getUserVehicles - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('getUserVehicles - value: $value', source: 'TwkApiV1');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserProfilePhoto() async {
    final jsValue = await getUserProfilePhotoJs().toDart;
    _logger.debug('getUserProfilePhoto - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('getUserProfilePhoto - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('getUserProfilePhoto - value: $value', source: 'TwkApiV1');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserPassports() async {
    final jsValue = await getUserPassportsJs().toDart;
    _logger.debug('getUserPassports - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('getUserPassports - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('getUserPassports - value: $value', source: 'TwkApiV1');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserIdExpiryDate() async {
    final jsValue = await getUserIdExpiryDateJs().toDart;
    _logger.debug('getUserIdExpiryDate - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('getUserIdExpiryDate - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('getUserIdExpiryDate - value: $value', source: 'TwkApiV1');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserDocumentNumber() async {
    final jsValue = await getUserDocumentNumberJs().toDart;
    _logger.debug('getUserDocumentNumber - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('getUserDocumentNumber - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('getUserDocumentNumber - value: $value', source: 'TwkApiV1');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserBirthCity() async {
    final jsValue = await getUserBirthCityJs().toDart;
    _logger.debug('getUserBirthCity - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('getUserBirthCity - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('getUserBirthCity - value: $value', source: 'TwkApiV1');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserEmail() async {
    final jsValue = await getUserEmailJs().toDart;
    _logger.debug('getUserEmail - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('getUserEmail - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('getUserEmail - value: $value', source: 'TwkApiV1');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> getUserIqamaType() async {
    final jsValue = await getUserIqamaTypeJs().toDart;
    _logger.debug('getUserIqamaType - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('getUserIqamaType - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('getUserIqamaType - value: $value', source: 'TwkApiV1');
    return (value as Map).cast();
  }

  @override
  Future<Uint8List?> getImage(String nationalId) async {
    final jsValue = await getImageJs(nationalId.toJS).toDart;
    _logger.debug('getImage - jsValue: $jsValue', source: 'TwkApiV1');
    final value = jsValue?.dartify();
    _logger.debug('getImage - value: $value', source: 'TwkApiV1');
    if (value == null) return null;
    final string = value as String;
    return Uint8List.fromList(base64Decode(string));
  }

  // ==================== Device & Capabilities Methods ====================

  @override
  Future<Map<String, dynamic>> getDeviceInfo() async {
    final jsValue = await getDeviceInfoJs().toDart;
    _logger.debug('getDeviceInfo - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('getDeviceInfo - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('getDeviceInfo - value: $value', source: 'TwkApiV1');
    return (value as Map).cast();
  }

  // ==================== Gallery Methods ====================

  @override
  Future<Map<String, dynamic>?> getGallerySingle() async {
    final jsValue = await getGallerySingleJs().toDart;
    _logger.debug('getGallerySingle - jsValue: $jsValue', source: 'TwkApiV1');
    final value = jsValue?.dartify();
    _logger.debug('getGallerySingle - value: $value', source: 'TwkApiV1');
    if (value == null) return null;
    final result = (value as Map)['result'];
    _logger.debug('getGallerySingle - result: $result', source: 'TwkApiV1');
    final firstElement = (result as List).firstOrNull;
    _logger.debug('getGallerySingle - firstElement: $firstElement', source: 'TwkApiV1');
    if (firstElement == null) return null;
    final file = (firstElement as Map).cast<String, dynamic>();
    _logger.debug('getGallerySingle - file: $file', source: 'TwkApiV1');
    return file;
  }

  @override
  Future<List<Map<String, dynamic>>> getGalleryMulti() async {
    final jsValue = await getGalleryMultiJs().toDart;
    _logger.debug('getGalleryMulti - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('getGalleryMulti - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('getGalleryMulti - value: $value', source: 'TwkApiV1');
    if (value == null) return [];
    final List<dynamic> files = value as List<dynamic>;
    return files.map((f) => (f as Map).cast<String, dynamic>()).toList();
  }

  @override
  Future<Map<String, dynamic>?> getGallerySingleVideo() async {
    final jsValue = await getGallerySingleVideoJs().toDart;
    _logger.debug('getGallerySingleVideo - jsValue: $jsValue', source: 'TwkApiV1');
    final value = jsValue?.dartify();
    _logger.debug('getGallerySingleVideo - value: $value', source: 'TwkApiV1');
    if (value == null) return null;
    final file = (value as Map).cast<String, dynamic>();
    return file;
  }

  @override
  Future<List<Map<String, dynamic>>> getGalleryMultiVideo() async {
    final jsValue = await getGalleryMultiVideoJs().toDart;
    _logger.debug('getGalleryMultiVideo - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('getGalleryMultiVideo - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('getGalleryMultiVideo - value: $value', source: 'TwkApiV1');
    final List<dynamic> files = value as List<dynamic>;
    return files.map((f) => (f as Map).cast<String, dynamic>()).toList();
  }

  // ==================== Camera Methods ====================

  @override
  Future<Map<String, dynamic>?> getCameraPhoto() async {
    final jsValue = await getCameraPhotoJs().toDart;
    _logger.debug('getCameraPhoto - jsValue: $jsValue', source: 'TwkApiV1');
    final value = jsValue?.dartify();
    _logger.debug('getCameraPhoto - value: $value', source: 'TwkApiV1');
    if (value == null) return null;
    final file = (value as Map).cast<String, dynamic>();
    return file;
  }

  @override
  Future<Map<String, dynamic>?> getCameraVideo() async {
    final jsValue = await getCameraVideoJs().toDart;
    _logger.debug('getCameraVideo - jsValue: $jsValue', source: 'TwkApiV1');
    final value = jsValue?.dartify();
    _logger.debug('getCameraVideo - value: $value', source: 'TwkApiV1');
    if (value == null) return null;
    final file = (value as Map).cast<String, dynamic>();
    return file;
  }

  // ==================== File Methods ====================

  @override
  Future<Uint8List> getRawData(TwkFile file) async {
    final jsValue = await getRawDataJs(file.data.toJS).toDart;
    _logger.debug('getRawData - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('getRawData - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('getRawData - value: $value', source: 'TwkApiV1');
    final string = value as String;
    return Uint8List.fromList(base64Decode(string));
  }

  @override
  Future<String?> getFileBase64() async {
    final jsValue = await getFileBase64Js().toDart;
    _logger.debug('getFileBase64 - jsValue: $jsValue', source: 'TwkApiV1');
    final value = jsValue?.dartify();
    _logger.debug('getFileBase64 - value: $value', source: 'TwkApiV1');
    return value as String?;
  }

  @override
  Future<String?> getFileId() async {
    final jsValue = await getFileIdJs().toDart;
    _logger.debug('getFileId - jsValue: $jsValue', source: 'TwkApiV1');
    final value = jsValue?.dartify();
    _logger.debug('getFileId - value: $value', source: 'TwkApiV1');
    return value as String?;
  }

  // ==================== Permission Methods ====================

  @override
  Future<bool> askUserLocationPermission() async {
    final jsValue = await askUserLocationPermissionJs().toDart;
    _logger.debug('askUserLocationPermission - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('askUserLocationPermission - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('askUserLocationPermission - value: $value', source: 'TwkApiV1');
    return value as bool;
  }

  @override
  Future<bool> askUserPreciseLocationPermission() async {
    final jsValue = await askUserPreciseLocationPermissionJs().toDart;
    _logger.debug('askUserPreciseLocationPermission - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('askUserPreciseLocationPermission - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('askUserPreciseLocationPermission - value: $value', source: 'TwkApiV1');
    return value as bool;
  }

  @override
  Future<bool> askCameraPermission() async {
    final jsValue = await askCameraPermissionJs().toDart;
    _logger.debug('askCameraPermission - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('askCameraPermission - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('askCameraPermission - value: $value', source: 'TwkApiV1');
    return value as bool;
  }

  @override
  Future<bool> askGalleryPermission() async {
    final jsValue = await askGalleryPermissionJs().toDart;
    _logger.debug('askGalleryPermission - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('askGalleryPermission - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('askGalleryPermission - value: $value', source: 'TwkApiV1');
    return value as bool;
  }

  @override
  Future<bool> askPushNotificationPermission() async {
    final jsValue = await askPushNotificationPermissionJs().toDart;
    _logger.debug('askPushNotificationPermission - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('askPushNotificationPermission - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('askPushNotificationPermission - value: $value', source: 'TwkApiV1');
    return value as bool;
  }

  // ==================== Authentication Methods ====================

  @override
  Future<Map<String, dynamic>> authenticateBiometric() async {
    final jsValue = await authenticateBiometricJs().toDart;
    _logger.debug('authenticateBiometric - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('authenticateBiometric - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('authenticateBiometric - value: $value', source: 'TwkApiV1');
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>> generateToken() async {
    final jsValue = await generateTokenJs().toDart;
    _logger.debug('generateToken - jsValue: $jsValue', source: 'TwkApiV1');
    final dartValue = jsValue.dartify();
    _logger.debug('generateToken - dartValue: $dartValue', source: 'TwkApiV1');
    final value = (dartValue as Map)['result'];
    _logger.debug('generateToken - value: $value', source: 'TwkApiV1');
    return (value as Map).cast();
  }

  // ==================== Share Methods ====================

  @override
  Future<void> shareScreenShot() async {
    await shareScreenShotJs().toDart;
  }

  @override
  Future<void> share({required String fileName, required String content, required String mimeType}) async {
    await shareJs(fileName.toJS, content.toJS, mimeType.toJS).toDart;
  }

  // ==================== Navigation Methods ====================

  @override
  Future<void> openScreen({required String screenType, Map<String, dynamic>? params}) async {
    await openScreenJs(screenType.toJS, params?.jsify()).toDart;
  }

  @override
  Future<void> openService({required String serviceId, Map<String, dynamic>? params}) async {
    await openServiceJs(serviceId.toJS, params?.jsify()).toDart;
  }

  @override
  Future<void> openUrl({required String url, required int urlType}) async {
    await openUrlJs(url.toJS, urlType.toJS).toDart;
  }

  // ==================== Card Methods ====================

  @override
  Future<void> postCard({required String actionType, required Map<String, dynamic> payload}) async {
    await postCardJs(actionType.toJS, payload.jsify()).toDart;
  }

  // ==================== Scanner Methods ====================

  @override
  Future<String?> scanCode() async {
    final jsValue = await scanCodeJs().toDart;
    final value = jsValue?.dartify();
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
    await setPaymentConfigurationJs(
      callbackSuccessUrlList.jsify(),
      callbackFailureUrlList.jsify(),
      successPageName.toJS,
      failurePageName.toJS,
    ).toDart;
  }

  // ==================== Logging Methods ====================

  @override
  Future<void> generalLog({
    required String eventName,
    required int logType,
    required String logMessage,
  }) async {
    await generalLogJs(eventName.toJS, logType.toJS, logMessage.toJS).toDart;
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
    await apiLogJs(
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
  }

  @override
  Future<void> startApiIntercept() async {
    await startApiInterceptJs().toDart;
  }

  // ==================== Document Methods ====================

  @override
  Future<void> addDocument({
    required String documentName,
    required String documentContent,
    required String referenceNumber,
    required int categoryId,
  }) async {
    await addDocumentJs(documentName.toJS, documentContent.toJS, referenceNumber.toJS, categoryId.toJS).toDart;
  }

  @override
  Future<void> updateDocument({
    required String documentName,
    required String documentContent,
    required String referenceNumber,
    required int categoryId,
  }) async {
    await updateDocumentJs(documentName.toJS, documentContent.toJS, referenceNumber.toJS, categoryId.toJS).toDart;
  }

  @override
  Future<void> deleteDocument({
    required String referenceNumber,
    required int categoryId,
  }) async {
    await deleteDocumentJs(referenceNumber.toJS, categoryId.toJS).toDart;
  }

  // ==================== Liveness Check Methods ====================

  @override
  Future<Map<String, dynamic>?> livenessCheckCamera({
    List<Map<String, dynamic>>? configurations,
  }) async {
    final jsValue = await livenessCheckCameraJs(configurations?.jsify()).toDart;
    final value = jsValue?.dartify();
    if (value == null) return null;
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>?> livenessCheckImageFromGallery({
    List<Map<String, dynamic>>? configurations,
  }) async {
    final jsValue = await livenessCheckImageFromGalleryJs(configurations?.jsify()).toDart;
    final value = jsValue?.dartify();
    if (value == null) return null;
    return (value as Map).cast();
  }

  @override
  Future<Map<String, dynamic>?> livenessCheckImageFromFiles({
    List<Map<String, dynamic>>? configurations,
  }) async {
    final jsValue = await livenessCheckImageFromFilesJs(configurations?.jsify()).toDart;
    final value = jsValue?.dartify();
    if (value == null) return null;
    return (value as Map).cast();
  }
}
