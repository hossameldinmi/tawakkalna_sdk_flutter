import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:tawakkalna_sdk_flutter/src/apis/v1/twk_api_v1.dart';
import 'package:tawakkalna_sdk_flutter/src/models/twk_file.dart';

class TwkApiV1DemoJsonImpl implements TwkApiV1 {
  final String jsonPath;
  final AssetBundle? assetBundle;
  final Map<String, dynamic> _map = {};
  TwkApiV1DemoJsonImpl(
      {this.jsonPath = 'packages/tawakkalna_sdk_flutter/assets/mock_profile1.0.2.json', this.assetBundle});

  dynamic _getResponseFromJson(String path) => _map[path];

  Future<void> _loadJsonIfNeeded() async {
    if (_map.isNotEmpty) return;
    final bundle = assetBundle ?? rootBundle;
    final jsonString = await bundle.loadString(jsonPath);
    if (jsonString.isEmpty) return;
    final json = jsonDecode(jsonString);
    final list = json['mock_endpoints'] as List;
    _map.addEntries(list.map((e) => MapEntry(e['path'], e['return'])));
  }

  @override
  Future<void> addDocument(
      {required String documentName,
      required String documentContent,
      required String referenceNumber,
      required int categoryId}) async {
    // TODO: implement addDocument
    throw UnimplementedError('TwkApiV1DemoJsonImpl.addDocument is not implemented yet.');
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
    throw UnimplementedError('TwkApiV1DemoJsonImpl.apiLog is not implemented yet.');
  }

  @override
  Future<Map<String, dynamic>> askCameraPermission() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/ask_permissions/camera');
    return response;
  }

  @override
  Future<Map<String, dynamic>> askGalleryPermission() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/ask_permissions/gallery');
    return response;
  }

  @override
  Future<Map<String, dynamic>> askPushNotificationPermission() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/ask_permissions/push_notification');
    return response;
  }

  @override
  Future<Map<String, dynamic>> askUserLocationPermission() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/ask_permissions/location');
    return response;
  }

  @override
  Future<Map<String, dynamic>> askUserPreciseLocationPermission() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/ask_permissions/precise_location');
    return response;
  }

  @override
  Future<Map<String, dynamic>> authenticateBiometric() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/authenticate/biometric');
    return response;
  }

  @override
  Future<void> deleteDocument({required String referenceNumber, required int categoryId}) {
    // TODO: implement deleteDocument
    throw UnimplementedError('TwkApiV1DemoJsonImpl.deleteDocument is not implemented yet.');
  }

  @override
  Future<void> generalLog({required String eventName, required int logType, required String logMessage}) {
    // TODO: implement generalLog
    throw UnimplementedError('TwkApiV1DemoJsonImpl.generalLog is not implemented yet.');
  }

  @override
  Future<Map<String, dynamic>> generateToken() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/authenticate/generatetoken');
    return response;
  }

  @override
  Future<Map<String, dynamic>?> getCameraPhoto() {
    // TODO: implement getCameraPhoto
    throw UnimplementedError('TwkApiV1DemoJsonImpl.getCameraPhoto is not implemented yet.');
  }

  @override
  Future<Map<String, dynamic>?> getCameraVideo() {
    // TODO: implement getCameraVideo
    throw UnimplementedError('TwkApiV1DemoJsonImpl.getCameraVideo is not implemented yet.');
  }

  @override
  Future<Map<String, dynamic>> getDeviceInfo() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/capabilities');
    return response;
  }

  @override
  Future<String?> getFileBase64() {
    // TODO: implement getFileBase64
    throw UnimplementedError('TwkApiV1DemoJsonImpl.getFileBase64 is not implemented yet.');
  }

  @override
  Future<String?> getFileId() {
    // TODO: implement getFileId
    throw UnimplementedError('TwkApiV1DemoJsonImpl.getFileId is not implemented yet.');
  }

  @override
  Future<List<Map<String, dynamic>>> getGalleryMulti() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/gallery/image/multi');
    return (response as List).cast();
  }

  @override
  Future<List<Map<String, dynamic>>> getGalleryMultiVideo() {
    // TODO: implement getGalleryMultiVideo
    throw UnimplementedError('TwkApiV1DemoJsonImpl.getGalleryMultiVideo is not implemented yet.');
  }

  @override
  Future<Map<String, dynamic>> getGallerySingle() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/gallery/image/single');
    return (response as List).firstOrNull ?? {};
  }

  @override
  Future<Map<String, dynamic>> getGallerySingleVideo() {
    // TODO: implement getGallerySingleVideo
    throw UnimplementedError('TwkApiV1DemoJsonImpl.getGallerySingleVideo is not implemented yet.');
  }

  @override
  Future<Uint8List?> getImage(String nationalId) {
    // TODO: implement getImage
    throw UnimplementedError('TwkApiV1DemoJsonImpl.getImage is not implemented yet.');
  }

  @override
  Future<Uint8List> getRawData(TwkFile file) {
    // TODO: implement getRawData
    throw UnimplementedError('TwkApiV1DemoJsonImpl.getRawData is not implemented yet.');
  }

  @override
  Future<Map<String, dynamic>> getUserBirthCity() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/user_data/user_birth_city');
    return response;
  }

  @override
  Future<Map<String, dynamic>> getUserBirthDate() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/user_data/birth_date');
    return response;
  }

  @override
  Future<Map<String, dynamic>> getUserBloodType() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/user_data/blood_type');
    return response;
  }

  @override
  Future<Map<String, dynamic>> getUserDegreeType() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/user_data/degree_type');
    return response;
  }

  @override
  Future<Map<String, dynamic>> getUserDisabilityType() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/user_data/disability_type');
    return response;
  }

  @override
  Future<Map<String, dynamic>> getUserDocumentNumber() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/user_data/user_document_number');
    return response;
  }

  @override
  Future<Map<String, dynamic>> getUserEmail() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/user_data/email');
    return response;
  }

  @override
  Future<Map<String, dynamic>> getUserFamilyMembers({int? minAge, int? maxAge, int? gender}) async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/user_data/family_members');
    return response;
  }

  @override
  Future<Map<String, String>> getUserFullName() async {
    await _loadJsonIfNeeded();
    // prefer richer V2 mock if available
    final response = _getResponseFromJson('/user_data/full_name') as Map;
    return response.cast<String, String>();
  }

  @override
  Future<Map<String, dynamic>> getUserGender() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/user_data/gender');
    return response;
  }

  @override
  Future<Map<String, dynamic>> getUserHealthStatus() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/user_data/health_status');
    return response;
  }

  @override
  Future<Map<String, dynamic>> getUserId() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/user_data/user_id');
    return response;
  }

  @override
  Future<Map<String, dynamic>> getUserIdExpiryDate() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/user_data/id_expiry_date');
    return response;
  }

  @override
  Future<Map<String, dynamic>> getUserIqamaType() async {
    await _loadJsonIfNeeded();
    final ret = _getResponseFromJson('/user_data/iqama_type');
    return ret;
  }

  @override
  Future<Map<String, dynamic>> getUserLocation() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/user_data/user_location');
    return response;
  }

  @override
  Future<Map<String, dynamic>> getUserMaritalStatus() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/user_data/marital_status');
    return response;
  }

  @override
  Future<Map<String, dynamic>> getUserMobileNumber() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/user_data/mobile_number');
    return response;
  }

  @override
  Future<Map<String, dynamic>> getUserNationalAddress() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/user_data/national_address');
    return response;
  }

  @override
  Future<Map<String, dynamic>> getUserNationality() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/user_data/nationality_name');
    return response;
  }

  @override
  Future<Map<String, dynamic>> getUserNationalityIso() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/user_data/nationality_iso');
    return response;
  }

  @override
  Future<Map<String, dynamic>> getUserOccupation() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/user_data/occupation');
    return response;
  }

  @override
  Future<Map<String, dynamic>> getUserPaidViolations() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/user_data/violations/paid');
    return response;
  }

  @override
  Future<Map<String, dynamic>> getUserPassports() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/user_data/passports');
    return response;
  }

  @override
  Future<Map<String, dynamic>> getUserProfilePhoto() {
    // TODO: implement getUserProfilePhoto
    throw UnimplementedError('TwkApiV1DemoJsonImpl.getUserProfilePhoto is not implemented yet.');
  }

  @override
  Future<Map<String, dynamic>> getUserSponsors({int? minAge, int? maxAge, int? gender}) async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/user_data/sponsors');
    return response;
  }

  @override
  Future<Map<String, dynamic>> getUserType() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/user_data/user_type');
    return response;
  }

  @override
  Future<Map<String, dynamic>> getUserUnPaidViolations() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/user_data/violations/unpaid');
    return response;
  }

  @override
  Future<Map<String, dynamic>> getUserVehicles() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/user_data/vehicles');
    return response;
  }

  @override
  Future<Map<String, dynamic>?> livenessCheckCamera({List<Map<String, dynamic>>? configurations}) {
    // TODO: implement livenessCheckCamera
    throw UnimplementedError('TwkApiV1DemoJsonImpl.livenessCheckCamera is not implemented yet.');
  }

  @override
  Future<Map<String, dynamic>?> livenessCheckImageFromFiles({List<Map<String, dynamic>>? configurations}) {
    // TODO: implement livenessCheckImageFromFiles
    throw UnimplementedError('TwkApiV1DemoJsonImpl.livenessCheckImageFromFiles is not implemented yet.');
  }

  @override
  Future<Map<String, dynamic>?> livenessCheckImageFromGallery({List<Map<String, dynamic>>? configurations}) {
    // TODO: implement livenessCheckImageFromGallery
    throw UnimplementedError('TwkApiV1DemoJsonImpl.livenessCheckImageFromGallery is not implemented yet.');
  }

  @override
  Future<void> openScreen({required String screenType, Map<String, dynamic>? params}) {
    // TODO: implement openScreen
    throw UnimplementedError('TwkApiV1DemoJsonImpl.openScreen is not implemented yet.');
  }

  @override
  Future<void> openService({required String serviceId, Map<String, dynamic>? params}) {
    // TODO: implement openService
    throw UnimplementedError('TwkApiV1DemoJsonImpl.openService is not implemented yet.');
  }

  @override
  Future<void> openUrl({required String url, required int urlType}) {
    // TODO: implement openUrl
    throw UnimplementedError('TwkApiV1DemoJsonImpl.openUrl is not implemented yet.');
  }

  @override
  Future<void> postCard({required String actionType, required Map<String, dynamic> payload}) {
    // TODO: implement postCard
    throw UnimplementedError('TwkApiV1DemoJsonImpl.postCard is not implemented yet.');
  }

  @override
  Future<String?> scanCode() {
    // TODO: implement scanCode
    throw UnimplementedError('TwkApiV1DemoJsonImpl.scanCode is not implemented yet.');
  }

  @override
  Future<void> setPaymentConfiguration(
      {required List<String> callbackSuccessUrlList,
      required List<String> callbackFailureUrlList,
      required String successPageName,
      required String failurePageName}) {
    // TODO: implement setPaymentConfiguration
    throw UnimplementedError('TwkApiV1DemoJsonImpl.setPaymentConfiguration is not implemented yet.');
  }

  @override
  Future<void> share({required String fileName, required String content, required String mimeType}) {
    // TODO: implement share
    throw UnimplementedError('TwkApiV1DemoJsonImpl.share is not implemented yet.');
  }

  @override
  Future<void> shareScreenShot() {
    // TODO: implement shareScreenShot
    throw UnimplementedError('TwkApiV1DemoJsonImpl.shareScreenShot is not implemented yet.');
  }

  @override
  Future<void> startApiIntercept() {
    // TODO: implement startApiIntercept
    throw UnimplementedError('TwkApiV1DemoJsonImpl.startApiIntercept is not implemented yet.');
  }

  @override
  Future<void> updateDocument(
      {required String documentName,
      required String documentContent,
      required String referenceNumber,
      required int categoryId}) {
    // TODO: implement updateDocument
    throw UnimplementedError('TwkApiV1DemoJsonImpl.updateDocument is not implemented yet.');
  }
}
