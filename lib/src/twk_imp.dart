import 'package:flutter/foundation.dart';
import 'package:tawakkalna_sdk_flutter/src/apis/v1/twk_api_v1.dart';
import 'package:tawakkalna_sdk_flutter/src/apis/v1/twk_api_v1_demo_json_impl.dart';
import 'package:tawakkalna_sdk_flutter/src/apis/v1/twk_api_v1_sdk_impl_stub.dart'
    if (dart.library.js_interop) 'package:tawakkalna_sdk_flutter/src/apis/v1/twk_api_v1_sdk_impl.dart';

import 'package:tawakkalna_sdk_flutter/src/apis/v2/twk_api_v2.dart';
import 'package:tawakkalna_sdk_flutter/src/apis/v2/twk_api_v2_demo_json_impl.dart';
import 'package:tawakkalna_sdk_flutter/src/apis/v2/twk_api_v2_sdk_impl_stub.dart'
    if (dart.library.js_interop) 'package:tawakkalna_sdk_flutter/src/apis/v2/twk_api_v2_sdk_impl.dart';
import 'package:tawakkalna_sdk_flutter/src/enums/gender.dart';
import 'package:tawakkalna_sdk_flutter/src/models/family_member.dart';
import 'package:tawakkalna_sdk_flutter/src/models/full_name.dart';
import 'package:tawakkalna_sdk_flutter/src/models/nationality_entity.dart';
import 'package:tawakkalna_sdk_flutter/src/models/sponsor.dart';
import 'package:cross_file/cross_file.dart';
import 'package:tawakkalna_sdk_flutter/src/core/json_util.dart';
import 'package:tawakkalna_sdk_flutter/src/core/logger.dart';
import 'package:tawakkalna_sdk_flutter/src/enums/blood_type.dart';
import 'package:tawakkalna_sdk_flutter/src/enums/eqama_type.dart';
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

class Twk {
  final TwkApiV1 _apiV1;
  final TwkApiV2 _apiV2;

  Twk({TwkApiV1? v1Api, TwkApiV2? v2Api})
      : _apiV1 = v1Api ?? (!kIsWeb && kDebugMode ? TwkApiV1DemoJsonImpl() : TwkApiV1SdkImpl()),
        _apiV2 = v2Api ?? (!kIsWeb && kDebugMode ? TwkApiV2DemoJsonImpl() : TwkApiV2SdkImpl());

  final _logger = TwkLogger();

  Future<void> addDocument({
    required String documentName,
    required String documentContent,
    required String referenceNumber,
    required int categoryId,
  }) {
    return _apiV1.addDocument(
      documentName: documentName,
      documentContent: documentContent,
      referenceNumber: referenceNumber,
      categoryId: categoryId,
    );
  }

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
    return _apiV1.apiLog(
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

  Future<bool> askCameraPermission() {
    return _apiV1.askCameraPermission();
  }

  Future<bool> askGalleryPermission() {
    return _apiV1.askGalleryPermission();
  }

  Future<bool> askPushNotificationPermission() {
    return _apiV1.askPushNotificationPermission();
  }

  Future<bool> askUserLocationPermission() {
    return _apiV1.askUserLocationPermission();
  }

  Future<bool> askUserPreciseLocationPermission() {
    return _apiV1.askUserPreciseLocationPermission();
  }

  Future<bool> authenticateBiometric() {
    return _apiV1.authenticateBiometric().then((r) => r['authenticated'] as bool);
  }

  Future<void> deleteDocument({required String referenceNumber, required int categoryId}) {
    return _apiV1.deleteDocument(
      referenceNumber: referenceNumber,
      categoryId: categoryId,
    );
  }

  Future<void> generalLog({required String eventName, required LogType logType, required String logMessage}) {
    return _apiV1.generalLog(
      eventName: eventName,
      logType: logType.value,
      logMessage: logMessage,
    );
  }

  Future<XFile?> getCameraPhoto() {
    return _apiV1.getCameraPhoto();
  }

  Future<XFile?> getCameraVideo() {
    return _apiV1.getCameraVideo();
  }

  Future<DeviceInfo?> getDeviceInfo() {
    return _apiV1.getDeviceInfo().then((r) => DeviceInfo.fromJson(((r['device_info'] ?? {}) as Map).cast()));
  }

  Future<String?> getFileBase64() {
    return _apiV1.getFileBase64();
  }

  Future<String?> getFileId() {
    return _apiV1.getFileId();
  }

  Future<List<XFile>> getGalleryMulti() {
    return _apiV1.getGalleryMulti();
  }

  Future<List<XFile>> getGalleryMultiVideo() {
    return _apiV1.getGalleryMultiVideo();
  }

  Future<XFile?> getGallerySingle() {
    return _apiV1.getGallerySingle();
  }

  Future<XFile?> getGallerySingleVideo() {
    return _apiV1.getGallerySingleVideo();
  }

  Future<Uint8List?> getImage(String nationalId) {
    return _apiV1.getImage(nationalId);
  }

  Future<Uint8List> getRawData(XFile file) {
    return _apiV1.getRawData(file);
  }

  Future<String?> getUserBirthCity() => _apiV1.getUserBirthCity().then((r) => r['birth_city'] as String?);

  Future<DateTime?> getUserBirthDate() =>
      _apiV1.getUserBirthDate().then((r) => JsonUtil.parseDateTime(r['birth_date']));

  Future<BloodType?> getUserBloodType() {
    return _apiV1.getUserBloodType().then((r) => BloodType.fromCode(r['blood_type']));
  }

  Future<String?> getUserDegreeType() {
    return _apiV1.getUserDegreeType().then((r) => r['degree_type'] as String?);
  }

  Future<String?> getUserDisabilityType() {
    return _apiV1.getUserDisabilityType().then((r) => r['disability_type'] as String?);
  }

  Future<String?> getUserDocumentNumber() {
    return _apiV1.getUserDocumentNumber().then((r) => r['document_number'] as String?);
  }

  Future<String?> getUserEmail() {
    return _apiV1.getUserEmail().then((r) => r['email'] as String?);
  }

  Future<Gender?> getUserGender() => _apiV1.getUserGender().then((r) => Gender.fromValue(r['gender']));

  Future<HealthStatus> getUserHealthStatus() =>
      _apiV1.getUserHealthStatus().then((r) => HealthStatus.fromString(r['health_status'] as String));

  Future<int> getUserId() {
    _logger.debug('Fetching user ID from API');
    return _apiV1.getUserId().then((r) => r['user_id'] as int);
  }

  Future<DateTime?> getUserIdExpiryDate() =>
      _apiV1.getUserIdExpiryDate().then((r) => JsonUtil.parseDateTime(r['id_expiry_date_gregorian']));

  Future<IqamaType> getUserIqamaType() => _apiV1.getUserIqamaType().then((r) => IqamaType.fromId(r['id_type'])!);

  Future<Location?> getUserLocation() {
    return _apiV1
        .getUserLocation()
        .then((r) => r['location'])
        .then((r) => r.isNotEmpty ? Location(latitude: r['latitude'] ?? 0.0, longitude: r['longitude'] ?? 0.0) : null);
  }

  Future<MaritalStatus> getUserMaritalStatus() {
    return _apiV1.getUserMaritalStatus().then((r) => MaritalStatus.fromString(r['marital_status'] as String));
  }

  Future<String?> getUserMobileNumber() {
    return _apiV1.getUserMobileNumber().then((r) => r['mobile_number'] as String?);
  }

  Future<List<NationalAddress>> getUserNationalAddress() {
    return _apiV1.getUserNationalAddress().then(
        (r) => (r['national_addresses'] as List).map((e) => NationalAddress.fromJson((e as Map).cast())).toList());
  }

  Future<String?> getUserNationalityIso() {
    return _apiV1.getUserNationalityIso().then((r) => r['nationality_iso'] as String?);
  }

  Future<String?> getUserOccupation() {
    return _apiV1.getUserOccupation().then((r) => r['occupation'] as String?);
  }

  Future<List<Violation>> getUserPaidViolations() {
    return _apiV1
        .getUserPaidViolations()
        .then((r) => (r['violations'] as List).map((e) => Violation.fromJson((e as Map).cast())).toList());
  }

  Future<PassportResponse> getUserPassports() => _apiV1.getUserPassports().then((r) => PassportResponse.fromJson(r));

  Future<String?> getUserProfilePhoto() {
    return _apiV1.getUserProfilePhoto().then((r) => r['profile_photo'] as String?);
  }

  Future<UserType> getUserType() {
    return _apiV1.getUserType().then((r) => UserType.values[r['user_type'] as int]);
  }

  Future<List<Violation>> getUserUnPaidViolations() {
    return _apiV1
        .getUserUnPaidViolations()
        .then((r) => (r['violations'] as List).map((e) => Violation.fromJson((e as Map).cast())).toList());
  }

  Future<List<Vehicle>> getUserVehicles() {
    return _apiV1
        .getUserVehicles()
        .then((r) => (r['vehicles'] as List).map((e) => Vehicle.fromJson((e as Map).cast())).toList());
  }

  Future<Map<String, dynamic>?> livenessCheckCamera({List<Map<String, dynamic>>? configurations}) {
    return _apiV1.livenessCheckCamera(configurations: configurations);
  }

  Future<Map<String, dynamic>?> livenessCheckImageFromFiles({List<Map<String, dynamic>>? configurations}) {
    return _apiV1.livenessCheckImageFromFiles(configurations: configurations);
  }

  Future<Map<String, dynamic>?> livenessCheckImageFromGallery({List<Map<String, dynamic>>? configurations}) {
    return _apiV1.livenessCheckImageFromGallery(configurations: configurations);
  }

  Future<void> openScreen({required String screenType, Map<String, dynamic>? params}) {
    return _apiV1.openScreen(screenType: screenType, params: params);
  }

  Future<void> openService({required String serviceId, Map<String, dynamic>? params}) {
    return _apiV1.openService(serviceId: serviceId, params: params);
  }

  Future<void> openUrl({required String url, required UrlType urlType}) {
    return _apiV1.openUrl(
      url: url,
      urlType: urlType.value,
    );
  }

  Future<void> postCard({required String actionType, required Map<String, dynamic> payload}) {
    return _apiV1.postCard(actionType: actionType, payload: payload);
  }

  Future<String?> scanCode() {
    return _apiV1.scanCode();
  }

  Future<void> setPaymentConfiguration(
      {required List<String> callbackSuccessUrlList,
      required List<String> callbackFailureUrlList,
      required String successPageName,
      required String failurePageName}) {
    return _apiV1.setPaymentConfiguration(
      callbackSuccessUrlList: callbackSuccessUrlList,
      callbackFailureUrlList: callbackFailureUrlList,
      successPageName: successPageName,
      failurePageName: failurePageName,
    );
  }

  Future<void> share({required String fileName, required String content, required String mimeType}) {
    return _apiV1.share(fileName: fileName, content: content, mimeType: mimeType);
  }

  Future<void> shareScreenShot() {
    return _apiV1.shareScreenShot();
  }

  Future<void> startApiIntercept() {
    return _apiV1.startApiIntercept();
  }

  Future<void> updateDocument(
      {required String documentName,
      required String documentContent,
      required String referenceNumber,
      required int categoryId}) {
    return _apiV1.updateDocument(
      documentName: documentName,
      documentContent: documentContent,
      referenceNumber: referenceNumber,
      categoryId: categoryId,
    );
  }

  Future<String> generateToken() => _apiV2.generateToken().then((r) => r['token']);

  Future<List<FamilyMember>> getUserFamilyMembers({int? minAge, int? maxAge, Gender? gender}) {
    return _apiV2
        .getUserFamilyMembers(
          minAge: minAge,
          maxAge: maxAge,
          gender: gender?.value,
        )
        .then((r) => r['family_members'] as List)
        .then((list) => list.map((e) => FamilyMember.fromJson((e as Map).cast())).toList());
  }

  Future<FullName> getUserFullName() => _apiV2.getUserFullName().then((json) => FullName.fromJson(json));

  Future<NationalityEnity?> getUserNationality() =>
      _apiV2.getUserNationality().then((json) => NationalityEnity.fromJson(json));

  Future<List<Sponsor>> getUserSponsors({int? minAge, int? maxAge, Gender? gender}) => _apiV2
          .getUserSponsors(
            minAge: minAge,
            maxAge: maxAge,
            gender: gender?.value,
          )
          .then((r) => r['sponsors'] as List)
          .then((list) {
        return list.map((e) => Sponsor.fromJson((e as Map).cast())).toList();
      });
}
