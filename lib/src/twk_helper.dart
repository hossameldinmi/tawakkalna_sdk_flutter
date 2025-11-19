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
import 'package:tawakkalna_sdk_flutter/src/models/disability_type.dart';
import 'package:tawakkalna_sdk_flutter/src/models/family_member.dart';
import 'package:tawakkalna_sdk_flutter/src/models/full_name.dart';
import 'package:tawakkalna_sdk_flutter/src/models/nationality_entity.dart';
import 'package:tawakkalna_sdk_flutter/src/models/sponsor.dart';
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
import 'package:tawakkalna_sdk_flutter/src/models/twk_file.dart';
import 'package:tawakkalna_sdk_flutter/src/models/vehicle.dart';
import 'package:tawakkalna_sdk_flutter/src/models/violation.dart';

/// Main helper class for interacting with the Tawakkalna SDK.
///
/// This class provides a unified interface to all Tawakkalna API methods,
/// including both V1 and V2 APIs. It automatically selects the appropriate
/// implementation based on the platform and build mode:
/// - Web + Release: Uses SDK implementation (real data when in Tawakkalna app)
/// - Non-Web + Debug: Uses mock implementation for testing
///
/// Example:
/// ```dart
/// // Use default implementation (mock for debug, SDK for release)
/// final twk = TwkHelper();
///
/// // Or provide custom implementations
/// final twk = TwkHelper(
///   v1Api: MyCustomV1Impl(),
///   v2Api: MyCustomV2Impl(),
/// );
/// ```
class TwkHelper {
  /// V1 API implementation instance
  final TwkApiV1 _apiV1;

  /// V2 API implementation instance
  final TwkApiV2 _apiV2;

  /// Creates a new TwkHelper instance.
  ///
  /// If [v1Api] or [v2Api] are not provided, the constructor automatically
  /// selects the appropriate implementation based on platform and build mode.
  ///
  /// Parameters:
  /// - [v1Api]: Optional custom V1 API implementation
  /// - [v2Api]: Optional custom V2 API implementation
  TwkHelper({TwkApiV1? v1Api, TwkApiV2? v2Api})
      : _apiV1 = v1Api ?? (!kIsWeb && kDebugMode ? TwkApiV1DemoJsonImpl() : TwkApiV1SdkImpl()),
        _apiV2 = v2Api ?? (!kIsWeb && kDebugMode ? TwkApiV2DemoJsonImpl() : TwkApiV2SdkImpl());

  /// Internal logger instance for debugging
  final _logger = TwkLogger();

  /// Adds a new document to the user's Tawakkalna document repository.
  ///
  /// This method allows mini apps to store documents in the Tawakkalna app,
  /// making them accessible to the user from their document library.
  ///
  /// Parameters:
  /// - [documentName]: The name/title of the document
  /// - [documentContent]: The document content (typically base64 encoded)
  /// - [referenceNumber]: A unique reference number for the document
  /// - [categoryId]: The category ID to organize the document
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

  /// Logs API requests and responses for debugging and monitoring.
  ///
  /// This method allows mini apps to report their API activity to Tawakkalna
  /// for debugging, monitoring, and analytics purposes.
  ///
  /// Parameters:
  /// - [url]: The API endpoint URL
  /// - [methodType]: HTTP method type (numeric code)
  /// - [responseCode]: HTTP response status code
  /// - [requestBody]: Optional request body content
  /// - [requestHeaders]: Optional request headers
  /// - [requestDateTime]: Optional request timestamp
  /// - [responseBody]: Optional response body content
  /// - [responseHeaders]: Optional response headers
  /// - [responseDateTime]: Optional response timestamp
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

  /// Requests camera access permission from the user.
  ///
  /// Returns true if permission is granted, false otherwise.
  /// The user will see a permission dialog if not already granted.
  Future<bool> askCameraPermission() {
    return _apiV1.askCameraPermission().then((v) => v['granted'] as bool);
  }

  /// Requests gallery/photo library access permission from the user.
  ///
  /// Returns true if permission is granted, false otherwise.
  Future<bool> askGalleryPermission() {
    return _apiV1.askGalleryPermission().then((v) => v['granted'] as bool);
  }

  /// Requests push notification permission from the user.
  ///
  /// Returns true if permission is granted, false otherwise.
  /// Required for sending notifications to the user.
  Future<bool> askPushNotificationPermission() {
    return _apiV1.askPushNotificationPermission().then((v) => v['granted'] as bool);
    ;
  }

  /// Requests user location permission (approximate).
  ///
  /// Returns true if permission is granted, false otherwise.
  Future<bool> askUserLocationPermission() {
    return _apiV1.askUserLocationPermission().then((v) => v['granted'] as bool);
  }

  /// Requests precise location permission from the user.
  ///
  /// Returns true if permission is granted, false otherwise.
  /// Provides more accurate GPS coordinates than approximate location.
  Future<bool> askUserPreciseLocationPermission() {
    return _apiV1.askUserPreciseLocationPermission().then((v) => v['granted'] as bool);
  }

  /// Authenticates the user using biometric authentication (fingerprint/Face ID).
  ///
  /// Returns true if authentication succeeds, false otherwise.
  /// The device must support biometric authentication.
  Future<bool> authenticateBiometric() {
    return _apiV1.authenticateBiometric().then((r) => r['authenticated'] as bool);
  }

  /// Deletes a document from the user's Tawakkalna document repository.
  ///
  /// Parameters:
  /// - [referenceNumber]: The reference number of the document to delete
  /// - [categoryId]: The category ID of the document
  Future<void> deleteDocument({required String referenceNumber, required int categoryId}) {
    return _apiV1.deleteDocument(
      referenceNumber: referenceNumber,
      categoryId: categoryId,
    );
  }

  /// Logs general events and messages for debugging.
  ///
  /// Parameters:
  /// - [eventName]: Name of the event being logged
  /// - [logType]: The severity level of the log message
  /// - [logMessage]: The actual log message content
  Future<void> generalLog({required String eventName, required LogType logType, required String logMessage}) {
    return _apiV1.generalLog(
      eventName: eventName,
      logType: logType.value,
      logMessage: logMessage,
    );
  }

  /// Captures a photo using the device camera.
  ///
  /// Returns a TwkFile object containing the captured photo,
  /// or null if the user cancels or an error occurs.
  ///
  /// Requires camera permission to be granted first.
  Future<TwkFile?> getCameraPhoto() {
    return _apiV1.getCameraPhoto().then(
          (r) => r != null ? TwkFile.fromJson(r) : null,
        );
  }

  /// Captures a video using the device camera.
  ///
  /// Returns a TwkFile object containing the captured video,
  /// or null if the user cancels or an error occurs.
  ///
  /// Requires camera permission to be granted first.
  Future<TwkFile?> getCameraVideo() {
    return _apiV1.getCameraVideo().then(
          (r) => r != null ? TwkFile.fromJson(r) : null,
        );
  }

  /// Retrieves information about the user's device.
  ///
  /// Returns a DeviceInfo object containing details such as:
  /// - Device model and manufacturer
  /// - Operating system and version
  /// - App version
  /// - Device identifiers
  Future<DeviceInfo?> getDeviceInfo() {
    return _apiV1.getDeviceInfo().then((r) => DeviceInfo.fromJson((r as Map).cast()));
  }

  /// Gets a file's content as a base64-encoded string.
  ///
  /// Returns the base64 encoded content of the selected file.
  Future<String?> getFileBase64() {
    return _apiV1.getFileBase64();
  }

  /// Gets a file identifier for a selected file.
  ///
  /// Returns a unique ID that can be used to reference the file.
  Future<String?> getFileId() {
    return _apiV1.getFileId();
  }

  /// Allows the user to select multiple photos from their gallery.
  ///
  /// Returns a list of TwkFile objects representing the selected photos.
  /// Requires gallery permission to be granted first.
  Future<List<TwkFile>> getGalleryMulti() {
    return _apiV1.getGalleryMulti().then((r) => Future.wait(r.map((e) => TwkFile.fromJson(e))));
  }

  /// Allows the user to select multiple videos from their gallery.
  ///
  /// Returns a list of TwkFile objects representing the selected videos.
  /// Requires gallery permission to be granted first.
  Future<List<TwkFile>> getGalleryMultiVideo() {
    return _apiV1.getGalleryMultiVideo().then((r) => Future.wait(r.map((e) => TwkFile.fromJson(e))));
  }

  /// Allows the user to select a single photo from their gallery.
  ///
  /// Returns a TwkFile object representing the selected photo,
  /// or null if the user cancels.
  Future<TwkFile?> getGallerySingle() {
    return _apiV1.getGallerySingle().then(
          (r) => r != null ? TwkFile.fromJson(r) : null,
        );
  }

  /// Allows the user to select a single video from their gallery.
  ///
  /// Returns a TwkFile object representing the selected video,
  /// or null if the user cancels.
  Future<TwkFile?> getGallerySingleVideo() {
    return _apiV1.getGallerySingleVideo().then(
          (r) => r != null ? TwkFile.fromJson((r['result'] as Map).cast()) : null,
        );
  }

  /// Retrieves the profile image for a user by their national ID.
  ///
  /// Parameters:
  /// - [nationalId]: The national ID of the user
  ///
  /// Returns the image data as bytes, or null if not available.
  Future<Uint8List?> getImage(String nationalId) {
    return _apiV1.getImage(nationalId);
  }

  /// Gets the raw binary data from a TwkFile.
  ///
  /// Parameters:
  /// - [file]: The TwkFile to get data from
  ///
  /// Returns the file's content as bytes.
  Future<Uint8List> getRawData(TwkFile file) {
    return _apiV1.getRawData(file);
  }

  /// Retrieves the user's birth city.
  ///
  /// Returns the city name as a string, or null if not available.
  Future<String?> getUserBirthCity() => _apiV1.getUserBirthCity().then((r) => r['birth_city'] as String?);

  /// Retrieves the user's birth date.
  ///
  /// Returns the birth date as a DateTime object, or null if not available.
  Future<DateTime?> getUserBirthDate() =>
      _apiV1.getUserBirthDate().then((r) => JsonUtil.parseDateTime(r['birth_date']));

  /// Retrieves the user's blood type.
  ///
  /// Returns a BloodType enum value, or null if not available.
  Future<BloodType?> getUserBloodType() {
    return _apiV1.getUserBloodType().then((r) => BloodType.fromCode(r['blood_type']));
  }

  /// Retrieves the user's degree/education type.
  ///
  /// Returns the degree type as a string, or null if not available.
  Future<String?> getUserDegreeType() {
    return _apiV1.getUserDegreeType().then((r) => r['degree_type'] as String?);
  }

  /// Retrieves the user's disability type if applicable.
  ///
  /// Returns the disability type as a string, or null if not applicable.
  Future<DisabilityType?> getUserDisabilityType() {
    return _apiV1.getUserDisabilityType().then((r) => r.isNotEmpty ? DisabilityType.fromJson(r) : null);
  }

  /// Retrieves the user's document number (national ID or Iqama number).
  ///
  /// Returns the document number as a string, or null if not available.
  Future<String?> getUserDocumentNumber() {
    return _apiV1.getUserDocumentNumber().then((r) => r['document_number'] as String?);
  }

  /// Retrieves the user's email address.
  ///
  /// Returns the email as a string, or null if not available.
  Future<String?> getUserEmail() {
    return _apiV1.getUserEmail().then((r) => r['email'] as String?);
  }

  /// Retrieves the user's gender.
  ///
  /// Returns a Gender enum value, or null if not available.
  Future<Gender?> getUserGender() => _apiV1.getUserGender().then((r) => Gender.fromValue(r['gender']));

  /// Retrieves the user's current health status.
  ///
  /// Returns a HealthStatus enum value indicating vaccination/health status.
  Future<HealthStatus> getUserHealthStatus() =>
      _apiV1.getUserHealthStatus().then((r) => HealthStatus.fromString(r['health_status'] as String));

  /// Retrieves the user's unique ID in the Tawakkalna system.
  ///
  /// Returns the user ID as an integer.
  Future<int> getUserId() {
    _logger.debug('Fetching user ID from API');
    return _apiV1.getUserId().then((r) => r['user_id'] as int);
  }

  /// Retrieves the expiry date of the user's ID document.
  ///
  /// Returns the expiry date as a DateTime object, or null if not available.
  Future<DateTime?> getUserIdExpiryDate() =>
      _apiV1.getUserIdExpiryDate().then((r) => JsonUtil.parseDateTime(r['id_expiry_date_gregorian']));

  /// Retrieves the user's Iqama (residence permit) type.
  ///
  /// Returns an IqamaType enum value.
  /// Applicable only for residents.
  Future<IqamaType> getUserIqamaType() => _apiV1.getUserIqamaType().then((r) => IqamaType.fromId(r['id_type'])!);

  /// Retrieves the user's current location.
  ///
  /// Returns a Location object with latitude and longitude,
  /// or null if location is not available or permission is not granted.
  Future<Location?> getUserLocation() {
    return _apiV1
        .getUserLocation()
        .then((r) => r['location'])
        .then((r) => r.isNotEmpty ? Location(latitude: r['latitude'] ?? 0.0, longitude: r['longitude'] ?? 0.0) : null);
  }

  /// Retrieves the user's marital status.
  ///
  /// Returns a MaritalStatus enum value (e.g., single, married, divorced).
  Future<MaritalStatus> getUserMaritalStatus() {
    return _apiV1.getUserMaritalStatus().then((r) => MaritalStatus.fromString(r['marital_status'] as String));
  }

  /// Retrieves the user's mobile phone number.
  ///
  /// Returns the phone number as a string, or null if not available.
  Future<String?> getUserMobileNumber() {
    return _apiV1.getUserMobileNumber().then((r) => r['mobile_number'] as String?);
  }

  /// Retrieves the user's registered national addresses.
  ///
  /// Returns a list of NationalAddress objects.
  /// Users may have multiple addresses (home, work, etc.).
  Future<List<NationalAddress>> getUserNationalAddress() {
    return _apiV1.getUserNationalAddress().then(
        (r) => (r['national_addresses'] as List).map((e) => NationalAddress.fromJson((e as Map).cast())).toList());
  }

  /// Retrieves the user's nationality as an ISO country code.
  ///
  /// Returns the ISO code (e.g., "SA" for Saudi Arabia), or null if not available.
  Future<String?> getUserNationalityIso() {
    return _apiV1.getUserNationalityIso().then((r) => r['nationality_iso'] as String?);
  }

  /// Retrieves the user's occupation/profession.
  ///
  /// Returns the occupation as a string, or null if not available.
  Future<String?> getUserOccupation() {
    return _apiV1.getUserOccupation().then((r) => r['occupation'] as String?);
  }

  /// Retrieves the user's paid traffic violations.
  ///
  /// Returns a list of Violation objects that have been paid.
  Future<List<Violation>> getUserPaidViolations() {
    return _apiV1
        .getUserPaidViolations()
        .then((r) => (r['violations'] as List).map((e) => Violation.fromJson((e as Map).cast())).toList());
  }

  /// Retrieves the user's passport information.
  ///
  /// Returns a PassportResponse containing:
  /// - User's own passports
  /// - Family members' passports
  Future<PassportResponse> getUserPassports() => _apiV1.getUserPassports().then((r) => PassportResponse.fromJson(r));

  /// Retrieves the user's profile photo.
  ///
  /// Returns the photo as a base64-encoded string, or null if not available.
  Future<String?> getUserProfilePhoto() {
    return _apiV1.getUserProfilePhoto().then((r) => r['profile_photo'] as String?);
  }

  /// Retrieves the user's type (citizen, resident, or visitor).
  ///
  /// Returns a UserType enum value.
  Future<UserType> getUserType() {
    return _apiV1.getUserType().then((r) => UserType.values[r['user_type'] as int]);
  }

  /// Retrieves the user's unpaid traffic violations.
  ///
  /// Returns a list of Violation objects that are pending payment.
  Future<List<Violation>> getUserUnPaidViolations() {
    return _apiV1
        .getUserUnPaidViolations()
        .then((r) => (r['violations'] as List).map((e) => Violation.fromJson((e as Map).cast())).toList());
  }

  /// Retrieves all vehicles registered under the user's name.
  ///
  /// Returns a list of Vehicle objects with complete registration details.
  Future<List<Vehicle>> getUserVehicles() {
    return _apiV1
        .getUserVehicles()
        .then((r) => (r['vehicles'] as List).map((e) => Vehicle.fromJson((e as Map).cast())).toList());
  }

  /// Performs liveness detection using the device camera.
  ///
  /// This method activates the camera for biometric liveness verification,
  /// ensuring the user is physically present (not a photo or video).
  ///
  /// Parameters:
  /// - [configurations]: Optional list of configuration parameters for the check
  ///
  /// Returns a map containing the liveness check results.
  Future<Map<String, dynamic>?> livenessCheckCamera({List<Map<String, dynamic>>? configurations}) {
    return _apiV1.livenessCheckCamera(configurations: configurations);
  }

  /// Performs liveness detection on images from files.
  ///
  /// Parameters:
  /// - [configurations]: Optional list of configuration parameters for the check
  ///
  /// Returns a map containing the liveness check results.
  Future<Map<String, dynamic>?> livenessCheckImageFromFiles({List<Map<String, dynamic>>? configurations}) {
    return _apiV1.livenessCheckImageFromFiles(configurations: configurations);
  }

  /// Performs liveness detection on images selected from the gallery.
  ///
  /// Parameters:
  /// - [configurations]: Optional list of configuration parameters for the check
  ///
  /// Returns a map containing the liveness check results.
  Future<Map<String, dynamic>?> livenessCheckImageFromGallery({List<Map<String, dynamic>>? configurations}) {
    return _apiV1.livenessCheckImageFromGallery(configurations: configurations);
  }

  /// Opens a specific screen in the Tawakkalna app.
  ///
  /// Allows mini apps to navigate to native Tawakkalna screens.
  ///
  /// Parameters:
  /// - [screenType]: The type/identifier of the screen to open
  /// - [params]: Optional parameters to pass to the screen
  Future<void> openScreen({required String screenType, Map<String, dynamic>? params}) {
    return _apiV1.openScreen(screenType: screenType, params: params);
  }

  /// Opens another service within the Tawakkalna app.
  ///
  /// Allows navigation between different mini apps and services.
  ///
  /// Parameters:
  /// - [serviceId]: The unique identifier of the service to open
  /// - [params]: Optional parameters to pass to the service
  Future<void> openService({required String serviceId, Map<String, dynamic>? params}) {
    return _apiV1.openService(serviceId: serviceId, params: params);
  }

  /// Opens a URL in a browser (internal or external).
  ///
  /// Parameters:
  /// - [url]: The URL to open
  /// - [urlType]: Whether to open in internal or external browser
  Future<void> openUrl({required String url, required UrlType urlType}) {
    return _apiV1.openUrl(
      url: url,
      urlType: urlType.value,
    );
  }

  /// Posts a card/action to the Tawakkalna feed or notification system.
  ///
  /// Parameters:
  /// - [actionType]: The type of action being posted
  /// - [payload]: The data payload for the card
  Future<void> postCard({required String actionType, required Map<String, dynamic> payload}) {
    return _apiV1.postCard(actionType: actionType, payload: payload);
  }

  /// Activates the QR/barcode scanner.
  ///
  /// Returns the scanned code as a string, or null if cancelled.
  Future<String?> scanCode() {
    return _apiV1.scanCode();
  }

  /// Configures payment callback URLs and pages.
  ///
  /// Sets up where users should be redirected after successful or failed payments.
  ///
  /// Parameters:
  /// - [callbackSuccessUrlList]: List of URLs to call on successful payment
  /// - [callbackFailureUrlList]: List of URLs to call on failed payment
  /// - [successPageName]: Name of the success page to display
  /// - [failurePageName]: Name of the failure page to display
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

  /// Shares a file using the device's share functionality.
  ///
  /// Parameters:
  /// - [fileName]: The name of the file to share
  /// - [content]: The file content (typically base64 encoded)
  /// - [mimeType]: The MIME type of the file (e.g., "image/png", "application/pdf")
  Future<void> share({required String fileName, required String content, required String mimeType}) {
    return _apiV1.share(fileName: fileName, content: content, mimeType: mimeType);
  }

  /// Captures and shares a screenshot of the current screen.
  ///
  /// Opens the device's share dialog with a screenshot of the mini app.
  Future<void> shareScreenShot() {
    return _apiV1.shareScreenShot();
  }

  /// Starts intercepting API calls for debugging/logging.
  ///
  /// When enabled, the Tawakkalna app will intercept HTTP requests
  /// made by the mini app for logging and debugging purposes.
  Future<void> startApiIntercept() {
    return _apiV1.startApiIntercept();
  }

  /// Updates an existing document in the user's repository.
  ///
  /// Parameters:
  /// - [documentName]: The new name for the document
  /// - [documentContent]: The new content for the document
  /// - [referenceNumber]: The reference number of the document to update
  /// - [categoryId]: The category ID of the document
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

  // ========== V2 API Methods ==========

  /// Generates an authentication token for API requests.
  ///
  /// Returns a token string that can be used to authenticate API calls.
  /// This is part of the V2 API which provides more structured responses.
  Future<String> generateToken() => _apiV2.generateToken().then((r) => r['token']);

  /// Retrieves the user's family members with optional filtering.
  ///
  /// This is the V2 API version with enhanced filtering capabilities.
  ///
  /// Parameters:
  /// - [minAge]: Optional minimum age filter
  /// - [maxAge]: Optional maximum age filter
  /// - [gender]: Optional gender filter
  ///
  /// Returns a list of FamilyMember objects matching the filters.
  ///
  /// Example:
  /// ```dart
  /// // Get all male family members between 18 and 60
  /// final members = await twk.getUserFamilyMembers(
  ///   minAge: 18,
  ///   maxAge: 60,
  ///   gender: Gender.male,
  /// );
  /// ```
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

  /// Retrieves the user's full name in both Arabic and English.
  ///
  /// Returns a FullName object with bilingual name data.
  /// This is the V2 API version with a cleaner response structure.
  Future<FullName> getUserFullName() => _apiV2.getUserFullName().then((json) => FullName.fromJson(json));

  /// Retrieves the user's nationality information.
  ///
  /// Returns a NationalityEntity object with complete nationality details,
  /// or null if not available.
  Future<NationalityEnity?> getUserNationality() =>
      _apiV2.getUserNationality().then((json) => NationalityEnity.fromJson(json));

  /// Retrieves the user's sponsors (kafeel) with optional filtering.
  ///
  /// For residents and visitors in Saudi Arabia, sponsors are required.
  /// This V2 API method provides enhanced filtering capabilities.
  ///
  /// Parameters:
  /// - [minAge]: Optional minimum age filter for sponsors
  /// - [maxAge]: Optional maximum age filter for sponsors
  /// - [gender]: Optional gender filter
  ///
  /// Returns a list of Sponsor objects matching the filters.
  ///
  /// Example:
  /// ```dart
  /// // Get all sponsors
  /// final sponsors = await twk.getUserSponsors();
  /// for (var sponsor in sponsors) {
  ///   print('Sponsor: ${sponsor.nameEn}');
  /// }
  /// ```
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
