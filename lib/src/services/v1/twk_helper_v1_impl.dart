import 'dart:typed_data';
import 'package:cross_file/cross_file.dart';
import 'package:tawakkalna_sdk_flutter/src/apis/v1/twk_api_v1.dart';
import 'package:tawakkalna_sdk_flutter/src/core/json_util.dart';
import 'package:tawakkalna_sdk_flutter/src/enums/blood_type.dart';
import 'package:tawakkalna_sdk_flutter/src/enums/eqama_type.dart';
import 'package:tawakkalna_sdk_flutter/src/enums/gender.dart';
import 'package:tawakkalna_sdk_flutter/src/enums/health_status.dart';
import 'package:tawakkalna_sdk_flutter/src/enums/log_type.dart';
import 'package:tawakkalna_sdk_flutter/src/enums/marital_status.dart';
import 'package:tawakkalna_sdk_flutter/src/enums/url_type.dart';
import 'package:tawakkalna_sdk_flutter/src/enums/user_type.dart';
import 'package:tawakkalna_sdk_flutter/src/models/device_info.dart';
import 'package:tawakkalna_sdk_flutter/src/models/location.dart';
import 'package:tawakkalna_sdk_flutter/src/models/national_address.dart';
import 'package:tawakkalna_sdk_flutter/src/models/passport.dart';
import 'package:tawakkalna_sdk_flutter/src/models/vehicle.dart';
import 'package:tawakkalna_sdk_flutter/src/models/violation.dart';
import 'package:tawakkalna_sdk_flutter/src/services/v1/twk_helper_v1.dart';

class TwkHelperV1Impl implements TwkHelperV1 {
  final TwkApiV1 _api;
  TwkHelperV1Impl(this._api);

  @override
  Future<void> addDocument({
    required String documentName,
    required String documentContent,
    required String referenceNumber,
    required int categoryId,
  }) {
    return _api.addDocument(
      documentName: documentName,
      documentContent: documentContent,
      referenceNumber: referenceNumber,
      categoryId: categoryId,
    );
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
    return _api.apiLog(
      url: url,
      methodType: methodType,
      responseCode: responseCode,
      requestBody: requestBody,
      requestHeaders: requestHeaders,
      requestDateTime: requestDateTime,
      responseBody: responseBody,
      responseHeaders: responseHeaders,
      responseDateTime: responseDateTime,
    );
  }

  @override
  Future<bool> askCameraPermission() {
    return _api.askCameraPermission();
  }

  @override
  Future<bool> askGalleryPermission() {
    return _api.askGalleryPermission();
  }

  @override
  Future<bool> askPushNotificationPermission() {
    return _api.askPushNotificationPermission();
  }

  @override
  Future<bool> askUserLocationPermission() {
    return _api.askUserLocationPermission();
  }

  @override
  Future<bool> askUserPreciseLocationPermission() {
    return _api.askUserPreciseLocationPermission();
  }

  @override
  Future<bool> authenticateBiometric() {
    return _api.authenticateBiometric().then((r) => r['authenticated'] as bool);
  }

  @override
  Future<void> deleteDocument({required String referenceNumber, required int categoryId}) {
    return _api.deleteDocument(
      referenceNumber: referenceNumber,
      categoryId: categoryId,
    );
  }

  @override
  Future<void> generalLog({required String eventName, required LogType logType, required String logMessage}) {
    return _api.generalLog(
      eventName: eventName,
      logType: logType.value,
      logMessage: logMessage,
    );
  }

  @override
  Future<String> generateToken() => _api.generateToken().then((r) => r['token'] as String);

  @override
  Future<XFile?> getCameraPhoto() {
    return _api.getCameraPhoto();
  }

  @override
  Future<XFile?> getCameraVideo() {
    return _api.getCameraVideo();
  }

  @override
  Future<DeviceInfo?> getDeviceInfo() {
    return _api.getDeviceInfo().then((r) => DeviceInfo.fromJson(r['device_info']));
  }

  @override
  Future<String?> getFileBase64() {
    return _api.getFileBase64();
  }

  @override
  Future<String?> getFileId() {
    return _api.getFileId();
  }

  @override
  Future<List<XFile>> getGalleryMulti() {
    return _api.getGalleryMulti();
  }

  @override
  Future<List<XFile>> getGalleryMultiVideo() {
    return _api.getGalleryMultiVideo();
  }

  @override
  Future<XFile?> getGallerySingle() {
    return _api.getGallerySingle();
  }

  @override
  Future<XFile?> getGallerySingleVideo() {
    return _api.getGallerySingleVideo();
  }

  @override
  Future<Uint8List?> getImage(String nationalId) {
    return _api.getImage(nationalId);
  }

  @override
  Future<Uint8List> getRawData(XFile file) {
    return _api.getRawData(file);
  }

  @override
  Future<String?> getUserBirthCity() => _api.getUserBirthCity().then((r) => r['birth_city'] as String?);

  @override
  Future<DateTime?> getUserBirthDate() => _api.getUserBirthDate().then((r) => JsonUtil.parseDateTime(r['birth_date']));

  @override
  Future<BloodType?> getUserBloodType() {
    return _api.getUserBloodType().then((r) => BloodType.fromCode(r['blood_type']));
  }

  @override
  Future<String?> getUserDegreeType() {
    return _api.getUserDegreeType().then((r) => r['degree_type'] as String?);
  }

  @override
  Future<String?> getUserDisabilityType() {
    return _api.getUserDisabilityType().then((r) => r['disability_type'] as String?);
  }

  @override
  Future<String?> getUserDocumentNumber() {
    return _api.getUserDocumentNumber().then((r) => r['document_number'] as String?);
  }

  @override
  Future<String?> getUserEmail() {
    return _api.getUserEmail().then((r) => r['email'] as String?);
  }

  @override
  Future<String> getUserFullName() => _api.getUserFullName().then((r) => r['full_name'] as String);

  @override
  Future<Gender?> getUserGender() => _api.getUserGender().then((r) => Gender.fromValue(r['gender']));

  @override
  Future<HealthStatus> getUserHealthStatus() =>
      _api.getUserHealthStatus().then((r) => HealthStatus.fromString(r['health_status'] as String));

  @override
  Future<int> getUserId() => _api.getUserId().then((r) => r['user_id'] as int);

  @override
  Future<DateTime?> getUserIdExpiryDate() =>
      _api.getUserIdExpiryDate().then((r) => JsonUtil.parseDateTime(r['id_expiry_date_gregorian']));

  @override
  Future<IqamaType> getUserIqamaType() => _api.getUserIqamaType().then((r) => IqamaType.fromId(r['id_type'])!);

  @override
  Future<Location?> getUserLocation() {
    return _api
        .getUserLocation()
        .then((r) => r['location'])
        .then((r) => r.isNotEmpty ? Location(latitude: r['latitude'] ?? 0.0, longitude: r['longitude'] ?? 0.0) : null);
  }

  @override
  Future<MaritalStatus> getUserMaritalStatus() {
    return _api.getUserMaritalStatus().then((r) => MaritalStatus.fromString(r['marital_status'] as String));
  }

  @override
  Future<String?> getUserMobileNumber() {
    return _api.getUserMobileNumber().then((r) => r['mobile_number'] as String?);
  }

  @override
  Future<List<NationalAddress>> getUserNationalAddress() {
    return _api.getUserNationalAddress().then((r) =>
        (r['national_addresses'] as List).map((e) => NationalAddress.fromJson(e as Map<String, dynamic>)).toList());
  }

  @override
  Future<String?> getUserNationality() {
    return _api.getUserNationality().then((r) => r['nationality_name'] as String?);
  }

  @override
  Future<String?> getUserNationalityIso() {
    return _api.getUserNationalityIso().then((r) => r['nationality_iso'] as String?);
  }

  @override
  Future<String?> getUserOccupation() {
    return _api.getUserOccupation().then((r) => r['occupation'] as String?);
  }

  @override
  Future<List<Violation>> getUserPaidViolations() {
    return _api
        .getUserPaidViolations()
        .then((r) => (r['violations'] as List).map((e) => Violation.fromJson(e)).toList());
  }

  @override
  Future<PassportResponse> getUserPassports() => _api.getUserPassports().then((r) => PassportResponse.fromJson(r));

  @override
  Future<String?> getUserProfilePhoto() {
    return _api.getUserProfilePhoto().then((r) => r['profile_photo'] as String?);
  }

  @override
  Future<UserType> getUserType() {
    return _api.getUserType().then((r) => UserType.values[r['user_type'] as int]);
  }

  @override
  Future<List<Violation>> getUserUnPaidViolations() {
    return _api
        .getUserUnPaidViolations()
        .then((r) => (r['violations'] as List).map((e) => Violation.fromJson(e)).toList());
  }

  @override
  Future<List<Vehicle>> getUserVehicles() {
    return _api.getUserVehicles().then((r) => (r['vehicles'] as List).map((e) => Vehicle.fromJson(e)).toList());
  }

  @override
  Future<Map<String, dynamic>?> livenessCheckCamera({List<Map<String, dynamic>>? configurations}) {
    return _api.livenessCheckCamera(configurations: configurations);
  }

  @override
  Future<Map<String, dynamic>?> livenessCheckImageFromFiles({List<Map<String, dynamic>>? configurations}) {
    return _api.livenessCheckImageFromFiles(configurations: configurations);
  }

  @override
  Future<Map<String, dynamic>?> livenessCheckImageFromGallery({List<Map<String, dynamic>>? configurations}) {
    return _api.livenessCheckImageFromGallery(configurations: configurations);
  }

  @override
  Future<void> openScreen({required String screenType, Map<String, dynamic>? params}) {
    return _api.openScreen(screenType: screenType, params: params);
  }

  @override
  Future<void> openService({required String serviceId, Map<String, dynamic>? params}) {
    return _api.openService(serviceId: serviceId, params: params);
  }

  @override
  Future<void> openUrl({required String url, required UrlType urlType}) {
    return _api.openUrl(
      url: url,
      urlType: urlType.value,
    );
  }

  @override
  Future<void> postCard({required String actionType, required Map<String, dynamic> payload}) {
    return _api.postCard(actionType: actionType, payload: payload);
  }

  @override
  Future<String?> scanCode() {
    return _api.scanCode();
  }

  @override
  Future<void> setPaymentConfiguration(
      {required List<String> callbackSuccessUrlList,
      required List<String> callbackFailureUrlList,
      required String successPageName,
      required String failurePageName}) {
    return _api.setPaymentConfiguration(
      callbackSuccessUrlList: callbackSuccessUrlList,
      callbackFailureUrlList: callbackFailureUrlList,
      successPageName: successPageName,
      failurePageName: failurePageName,
    );
  }

  @override
  Future<void> share({required String fileName, required String content, required String mimeType}) {
    return _api.share(fileName: fileName, content: content, mimeType: mimeType);
  }

  @override
  Future<void> shareScreenShot() {
    return _api.shareScreenShot();
  }

  @override
  Future<void> startApiIntercept() {
    return _api.startApiIntercept();
  }

  @override
  Future<void> updateDocument(
      {required String documentName,
      required String documentContent,
      required String referenceNumber,
      required int categoryId}) {
    return _api.updateDocument(
      documentName: documentName,
      documentContent: documentContent,
      referenceNumber: referenceNumber,
      categoryId: categoryId,
    );
  }
}
