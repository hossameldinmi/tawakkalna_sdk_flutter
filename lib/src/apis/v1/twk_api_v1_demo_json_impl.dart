import 'dart:convert';
import 'package:cross_file/cross_file.dart';
import 'package:flutter/services.dart';
import 'package:tawakkalna_sdk_flutter/src/apis/v1/twk_api_v1.dart';

class TwkApiV1DemoJsonImpl implements TwkApiV1 {
  final String jsonPath;
  final AssetBundle? assetBundle;
  final Map<String, dynamic> _map = {};
  TwkApiV1DemoJsonImpl({this.jsonPath = 'assets/mock_profile1.0.2.json', this.assetBundle});

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
  Future<Map<String, dynamic>> authenticateBiometric() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/authenticate/biometric');
    return response;
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
  Future<Map<String, dynamic>> generateToken() async {
    await _loadJsonIfNeeded();
    final response = _getResponseFromJson('/authenticate/generatetoken');
    return response;
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
    throw UnimplementedError();
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
