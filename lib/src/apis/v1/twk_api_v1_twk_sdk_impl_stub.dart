// Stub implementation for non-web platforms
// This file is used when dart:js_interop is not available

import 'dart:typed_data';

import 'package:cross_file/cross_file.dart';
import 'package:tawakkalna_sdk_flutter/src/apis/v1/twk_api_v1.dart';

/// Stub implementation that throws UnimplementedError for all methods
/// This is used on non-web platforms where JS interop is not available
class TwkApiV1TwkSdkImpl implements TwkApiV1 {
  @override
  Future<void> addDocument({
    required String documentName,
    required String documentContent,
    required String referenceNumber,
    required int categoryId,
  }) {
    throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.addDocument is not implemented yet.');
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
  }) {
    throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.apiLog is not implemented yet.');
  }

  @override
  Future<bool> askCameraPermission() {
    throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.askCameraPermission is not implemented yet.');
  }

  @override
  Future<bool> askGalleryPermission() {
    throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.askGalleryPermission is not implemented yet.');
  }

  @override
  Future<bool> askPushNotificationPermission() {
    throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.askPushNotificationPermission is not implemented yet.');
  }

  @override
  Future<bool> askUserLocationPermission() {
    throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.askUserLocationPermission is not implemented yet.');
  }
}

@override
Future<bool> askUserPreciseLocationPermission() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.askUserPreciseLocationPermission is not implemented yet.');
}

@override
Future<Map<String, dynamic>> authenticateBiometric() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.authenticateBiometric is not implemented yet.');
}

@override
Future<void> deleteDocument({
  required String referenceNumber,
  required int categoryId,
}) {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.deleteDocument is not implemented yet.');
}

@override
Future<Map<String, dynamic>> generateToken() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.generateToken is not implemented yet.');
}

@override
Future<XFile?> getCameraPhoto() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getCameraPhoto is not implemented yet.');
}

@override
Future<XFile?> getCameraVideo() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getCameraVideo is not implemented yet.');
}

@override
Future<Map<String, dynamic>> getDeviceInfo() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getDeviceInfo is not implemented yet.');
}

@override
Future<String?> getFileBase64() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getFileBase64 is not implemented yet.');
}

@override
Future<String?> getFileId() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getFileId is not implemented yet.');
}

@override
Future<List<XFile>> getGalleryMulti() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getGalleryMulti is not implemented yet.');
}

@override
Future<List<XFile>> getGalleryMultiVideo() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getGalleryMultiVideo is not implemented yet.');
}

@override
Future<XFile?> getGallerySingle() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getGallerySingle is not implemented yet.');
}

@override
Future<XFile?> getGallerySingleVideo() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getGallerySingleVideo is not implemented yet.');
}

@override
Future<Uint8List?> getImage(String nationalId) {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getImage is not implemented yet.');
}

@override
Future<Uint8List> getRawData(XFile file) {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getRawData is not implemented yet.');
}

@override
Future<Map<String, dynamic>> getUserBirthCity() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getUserBirthCity is not implemented yet.');
}

@override
Future<Map<String, dynamic>> getUserBirthDate() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getUserBirthDate is not implemented yet.');
}

@override
Future<Map<String, dynamic>> getUserBloodType() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getUserBloodType is not implemented yet.');
}

@override
Future<Map<String, dynamic>> getUserDegreeType() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getUserDegreeType is not implemented yet.');
}

@override
Future<Map<String, dynamic>> getUserDisabilityType() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getUserDisabilityType is not implemented yet.');
}

@override
Future<Map<String, dynamic>> getUserDocumentNumber() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getUserDocumentNumber is not implemented yet.');
}

@override
Future<Map<String, dynamic>> getUserEmail() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getUserEmail is not implemented yet.');
}

@override
Future<Map<String, dynamic>> getUserFamilyMembers({
  int? minAge,
  int? maxAge,
  int? gender,
}) {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getUserFamilyMembers is not implemented yet.');
}

@override
Future<Map<String, String>> getUserFullName() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getUserFullName is not implemented yet.');
}

@override
Future<Map<String, dynamic>> getUserGender() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getUserGender is not implemented yet.');
}

@override
Future<Map<String, dynamic>> getUserHealthStatus() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getUserHealthStatus is not implemented yet.');
}

@override
Future<Map<String, dynamic>> getUserId() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getUserId is not implemented yet.');
}

@override
Future<Map<String, dynamic>> getUserIdExpiryDate() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getUserIdExpiryDate is not implemented yet.');
}

@override
Future<Map<String, dynamic>> getUserIqamaType() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getUserIqamaType is not implemented yet.');
}

@override
Future<Map<String, dynamic>> getUserLocation() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getUserLocation is not implemented yet.');
}

@override
Future<Map<String, dynamic>> getUserMaritalStatus() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getUserMaritalStatus is not implemented yet.');
}

@override
Future<Map<String, dynamic>> getUserMobileNumber() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getUserMobileNumber is not implemented yet.');
}

@override
Future<Map<String, dynamic>> getUserNationalAddress() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getUserNationalAddress is not implemented yet.');
}

@override
Future<Map<String, dynamic>> getUserNationality() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getUserNationality is not implemented yet.');
}

@override
Future<Map<String, dynamic>> getUserNationalityIso() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getUserNationalityIso is not implemented yet.');
}

@override
Future<Map<String, dynamic>> getUserOccupation() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getUserOccupation is not implemented yet.');
}

@override
Future<Map<String, dynamic>> getUserPaidViolations() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getUserPaidViolations is not implemented yet.');
}

@override
Future<Map<String, dynamic>> getUserPassports() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getUserPassports is not implemented yet.');
}

@override
Future<Map<String, dynamic>> getUserProfilePhoto() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getUserProfilePhoto is not implemented yet.');
}

@override
Future<Map<String, dynamic>> getUserSponsors({
  int? minAge,
  int? maxAge,
  int? gender,
}) {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getUserSponsors is not implemented yet.');
}

@override
Future<Map<String, dynamic>> getUserType() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getUserType is not implemented yet.');
}

@override
Future<Map<String, dynamic>> getUserUnPaidViolations() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getUserUnPaidViolations is not implemented yet.');
}

@override
Future<Map<String, dynamic>> getUserVehicles() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.getUserVehicles is not implemented yet.');
}

@override
Future<void> generalLog({
  required String eventName,
  required int logType,
  required String logMessage,
}) {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.generalLog is not implemented yet.');
}

@override
Future<Map<String, dynamic>?> livenessCheckCamera({
  List<Map<String, dynamic>>? configurations,
}) {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.livenessCheckCamera is not implemented yet.');
}

@override
Future<Map<String, dynamic>?> livenessCheckImageFromFiles({
  List<Map<String, dynamic>>? configurations,
}) {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.livenessCheckImageFromFiles is not implemented yet.');
}

@override
Future<Map<String, dynamic>?> livenessCheckImageFromGallery({
  List<Map<String, dynamic>>? configurations,
}) {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.livenessCheckImageFromGallery is not implemented yet.');
}

@override
Future<void> openScreen({
  required String screenType,
  Map<String, dynamic>? params,
}) {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.openScreen is not implemented yet.');
}

@override
Future<void> openService({
  required String serviceId,
  Map<String, dynamic>? params,
}) {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.openService is not implemented yet.');
}

@override
Future<void> openUrl({
  required String url,
  required int urlType,
}) {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.openUrl is not implemented yet.');
}

@override
Future<void> postCard({
  required String actionType,
  required Map<String, dynamic> payload,
}) {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.postCard is not implemented yet.');
}

@override
Future<String?> scanCode() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.scanCode is not implemented yet.');
}

@override
Future<void> setPaymentConfiguration({
  required List<String> callbackSuccessUrlList,
  required List<String> callbackFailureUrlList,
  required String successPageName,
  required String failurePageName,
}) {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.setPaymentConfiguration is not implemented yet.');
}

@override
Future<void> share({
  required String fileName,
  required String content,
  required String mimeType,
}) {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.share is not implemented yet.');
}

@override
Future<void> shareScreenShot() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.shareScreenShot is not implemented yet.');
}

@override
Future<void> startApiIntercept() {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.startApiIntercept is not implemented yet.');
}

@override
Future<void> updateDocument({
  required String documentName,
  required String documentContent,
  required String referenceNumber,
  required int categoryId,
}) {
  throw UnimplementedError('TwkApiV1TwkSdkImpl.stub.updateDocument is not implemented yet.');
}
