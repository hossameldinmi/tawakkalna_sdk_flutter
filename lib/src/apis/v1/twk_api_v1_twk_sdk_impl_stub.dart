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
    throw UnimplementedError();
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
    throw UnimplementedError();
  }

  @override
  Future<bool> askCameraPermission() {
    throw UnimplementedError();
  }

  @override
  Future<bool> askGalleryPermission() {
    throw UnimplementedError();
  }

  @override
  Future<bool> askPushNotificationPermission() {
    throw UnimplementedError();
  }

  @override
  Future<bool> askUserLocationPermission() {
    throw UnimplementedError();
  }

  @override
  Future<bool> askUserPreciseLocationPermission() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> authenticateBiometric() {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteDocument({
    required String referenceNumber,
    required int categoryId,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> generateToken() {
    throw UnimplementedError();
  }

  @override
  Future<XFile?> getCameraPhoto() {
    throw UnimplementedError();
  }

  @override
  Future<XFile?> getCameraVideo() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getDeviceInfo() {
    throw UnimplementedError();
  }

  @override
  Future<String?> getFileBase64() {
    throw UnimplementedError();
  }

  @override
  Future<String?> getFileId() {
    throw UnimplementedError();
  }

  @override
  Future<List<XFile>> getGalleryMulti() {
    throw UnimplementedError();
  }

  @override
  Future<List<XFile>> getGalleryMultiVideo() {
    throw UnimplementedError();
  }

  @override
  Future<XFile?> getGallerySingle() {
    throw UnimplementedError();
  }

  @override
  Future<XFile?> getGallerySingleVideo() {
    throw UnimplementedError();
  }

  @override
  Future<Uint8List?> getImage(String nationalId) {
    throw UnimplementedError();
  }

  @override
  Future<Uint8List> getRawData(XFile file) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserBirthCity() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserBirthDate() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserBloodType() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserDegreeType() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserDisabilityType() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserDocumentNumber() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserEmail() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserFamilyMembers({
    int? minAge,
    int? maxAge,
    int? gender,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, String>> getUserFullName() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserGender() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserHealthStatus() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserId() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserIdExpiryDate() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserIqamaType() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserLocation() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserMaritalStatus() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserMobileNumber() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserNationalAddress() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserNationality() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserNationalityIso() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserOccupation() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserPaidViolations() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserPassports() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserProfilePhoto() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserSponsors({
    int? minAge,
    int? maxAge,
    int? gender,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserType() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserUnPaidViolations() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserVehicles() {
    throw UnimplementedError();
  }

  @override
  Future<void> generalLog({
    required String eventName,
    required int logType,
    required String logMessage,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>?> livenessCheckCamera({
    List<Map<String, dynamic>>? configurations,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>?> livenessCheckImageFromFiles({
    List<Map<String, dynamic>>? configurations,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>?> livenessCheckImageFromGallery({
    List<Map<String, dynamic>>? configurations,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> openScreen({
    required String screenType,
    Map<String, dynamic>? params,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> openService({
    required String serviceId,
    Map<String, dynamic>? params,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> openUrl({
    required String url,
    required int urlType,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> postCard({
    required String actionType,
    required Map<String, dynamic> payload,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<String?> scanCode() {
    throw UnimplementedError();
  }

  @override
  Future<void> setPaymentConfiguration({
    required List<String> callbackSuccessUrlList,
    required List<String> callbackFailureUrlList,
    required String successPageName,
    required String failurePageName,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> share({
    required String fileName,
    required String content,
    required String mimeType,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> shareScreenShot() {
    throw UnimplementedError();
  }

  @override
  Future<void> startApiIntercept() {
    throw UnimplementedError();
  }

  @override
  Future<void> updateDocument({
    required String documentName,
    required String documentContent,
    required String referenceNumber,
    required int categoryId,
  }) {
    throw UnimplementedError();
  }
}
