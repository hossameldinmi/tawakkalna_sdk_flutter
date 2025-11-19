import 'dart:typed_data';
import 'package:tawakkalna_sdk_flutter/src/models/twk_file.dart';

/// Tawakkalna SDK Helper for V1 API
///
/// This class provides access to all V1 endpoints of the Tawakkalna SDK.
/// Most methods correspond to the JavaScript window.TWK.* functions.
abstract class TwkApiV1 {
  const TwkApiV1._();

  // ==================== Gallery & File Methods ====================

  /// Get raw data from a file
  /// Corresponds to: window.TWK.getRawData(file)
  Future<Uint8List> getRawData(TwkFile file);

  // ==================== User Data Methods ====================

  /// Get user's national ID
  /// Corresponds to: window.TWK.getUserId()
  Future<Map<String, dynamic>> getUserId();

  /// Get user's type (citizen, resident, visitor, etc.)
  /// Corresponds to: window.TWK.getUserType()
  Future<Map<String, dynamic>> getUserType();

  /// Get user's birth date
  /// Corresponds to: window.TWK.getUserBirthDate()
  Future<Map<String, dynamic>> getUserBirthDate();

  /// Get user's mobile number
  /// Corresponds to: window.TWK.getUserMobileNumber()
  Future<Map<String, dynamic>> getUserMobileNumber();

  /// Get user's gender
  /// Corresponds to: window.TWK.getUserGender()
  Future<Map<String, dynamic>> getUserGender();

  /// Get user's location
  /// Corresponds to: window.TWK.getUserLocation()
  Future<Map<String, dynamic>> getUserLocation();

  /// Get user's nationality name
  /// Corresponds to: window.TWK.getUserNationality()
  Future<Map<String, dynamic>> getUserNationality();

  /// Get user's nationality ISO code
  /// Corresponds to: window.TWK.getUserNationalityISO()
  Future<Map<String, dynamic>> getUserNationalityIso();

  /// Get user's full name (Arabic and English)
  /// Corresponds to: window.TWK.getUserFullName()
  Future<Map<String, String>> getUserFullName();

  /// Get user's marital status
  /// Corresponds to: window.TWK.getUserMaritalStatus()
  Future<Map<String, dynamic>> getUserMaritalStatus();

  /// Get user's health status
  /// Corresponds to: window.TWK.getUserHealthStatus()
  Future<Map<String, dynamic>> getUserHealthStatus();

  /// Get user's disability type
  /// Corresponds to: window.TWK.getUserDisabilityType()
  Future<Map<String, dynamic>> getUserDisabilityType();

  /// Get user's blood type
  /// Corresponds to: window.TWK.getUserBloodType()
  Future<Map<String, dynamic>> getUserBloodType();

  /// Get user's national address
  /// Corresponds to: window.TWK.getUserNationalAddress()
  Future<Map<String, dynamic>> getUserNationalAddress();

  /// Get user's degree/education type
  /// Corresponds to: window.TWK.getUserDegreeType()
  Future<Map<String, dynamic>> getUserDegreeType();

  /// Get user's occupation
  /// Corresponds to: window.TWK.getUserOccupation()
  Future<Map<String, dynamic>> getUserOccupation();

  /// Get user's family members with optional filters
  /// Corresponds to: window.TWK.getUserFamilyMembers(minage, maxage, gender)
  Future<Map<String, dynamic>> getUserFamilyMembers({
    int? minAge,
    int? maxAge,
    int? gender,
  });

  /// Get user's sponsors with optional filters
  /// Corresponds to: window.TWK.getUserSponsors(minage, maxage, gender)
  Future<Map<String, dynamic>> getUserSponsors({
    int? minAge,
    int? maxAge,
    int? gender,
  });

  /// Get user's unpaid violations
  /// Corresponds to: window.TWK.getUserUnPaidViolations()
  Future<Map<String, dynamic>> getUserUnPaidViolations();

  /// Get user's paid violations
  /// Corresponds to: window.TWK.getUserPaidViolations()
  Future<Map<String, dynamic>> getUserPaidViolations();

  /// Get user's vehicles
  /// Corresponds to: window.TWK.getUserVehicles()
  Future<Map<String, dynamic>> getUserVehicles();

  /// Get user's profile photo
  /// Corresponds to: window.TWK.getUserProfilePhoto()
  Future<Map<String, dynamic>> getUserProfilePhoto();

  /// Get user's passports
  /// Corresponds to: window.TWK.getUserPassports()
  Future<Map<String, dynamic>> getUserPassports();

  /// Get user's ID expiry date
  /// Corresponds to: window.TWK.getUserIdExpiryDate()
  Future<Map<String, dynamic>> getUserIdExpiryDate();

  /// Get user's document number
  /// Corresponds to: window.TWK.getUserDocumentNumber()
  Future<Map<String, dynamic>> getUserDocumentNumber();

  /// Get user's birth city
  /// Corresponds to: window.TWK.getUserBirthCity()
  Future<Map<String, dynamic>> getUserBirthCity();

  /// Get user's email
  /// Corresponds to: window.TWK.getUserEmail()
  Future<Map<String, dynamic>> getUserEmail();

  /// Get user's iqama type
  /// Corresponds to: window.TWK.getUserIqamaType()
  Future<Map<String, dynamic>> getUserIqamaType();

  /// Get image by national ID
  /// Corresponds to: window.TWK.getImage(nationalId)
  Future<Uint8List?> getImage(String nationalId);

  // ==================== Device & Capabilities Methods ====================

  /// Get device information and capabilities
  /// Corresponds to: window.TWK.getDeviceInfo()
  Future<Map<String, dynamic>> getDeviceInfo();

  // ==================== Gallery Methods ====================

  /// Get single image from gallery
  /// Corresponds to: window.TWK.getGallerySingle()
  Future<Map<String, dynamic>?> getGallerySingle();

  /// Get multiple images from gallery
  /// Corresponds to: window.TWK.getGalleryMulti()
  Future<List<Map<String, dynamic>>> getGalleryMulti();

  /// Get single video from gallery
  /// Corresponds to: window.TWK.getGallerySingleVideo()
  Future<Map<String, dynamic>?> getGallerySingleVideo();

  /// Get multiple videos from gallery
  /// Corresponds to: window.TWK.getGalleryMultiVideo()
  Future<List<Map<String, dynamic>>> getGalleryMultiVideo();

  // ==================== Camera Methods ====================

  /// Capture photo using camera
  /// Corresponds to: window.TWK.getCameraPhoto()
  Future<Map<String, dynamic>?> getCameraPhoto();

  /// Capture video using camera
  /// Corresponds to: window.TWK.getCameraVideo()
  Future<Map<String, dynamic>?> getCameraVideo();

  // ==================== File Methods ====================

  /// Get file as base64 string
  /// Corresponds to: window.TWK.getFileBase64()
  Future<String?> getFileBase64();

  /// Get file ID
  /// Corresponds to: window.TWK.getFileId()
  Future<String?> getFileId();

  // ==================== Permission Methods ====================

  /// Ask user for location permission
  /// Corresponds to: window.TWK.askUserLocationPermission()
  Future<Map<String, dynamic>> askUserLocationPermission();

  /// Ask user for precise location permission
  /// Corresponds to: window.TWK.askUserPreciseLocationPermission()
  Future<Map<String, dynamic>> askUserPreciseLocationPermission();

  /// Ask user for camera permission
  /// Corresponds to: window.TWK.askCameraPermission()
  Future<Map<String, dynamic>> askCameraPermission();

  /// Ask user for gallery permission
  /// Corresponds to: window.TWK.askGalleryPermission()
  Future<Map<String, dynamic>> askGalleryPermission();

  /// Ask user for push notification permission
  /// Corresponds to: window.TWK.askPushNotificationPermission()
  Future<Map<String, dynamic>> askPushNotificationPermission();

  // ==================== Authentication Methods ====================

  /// Authenticate using biometric
  /// Corresponds to: window.TWK.authenticateBiometric()
  Future<Map<String, dynamic>> authenticateBiometric();

  /// Generate authentication token
  /// Corresponds to: window.TWK.generateToken()
  Future<Map<String, dynamic>> generateToken();

  // ==================== Share Methods ====================

  /// Share screenshot
  /// Corresponds to: window.TWK.shareScreenShot()
  Future<void> shareScreenShot();

  /// Share file with base64 content
  /// Corresponds to: window.TWK.share(fileName, content, mimetype)
  Future<void> share({
    required String fileName,
    required String content,
    required String mimeType,
  });

  // ==================== Navigation Methods ====================

  /// Open screen with parameters
  /// Corresponds to: window.TWK.openScreen(screenType, valuesParam)
  Future<void> openScreen({
    required String screenType,
    Map<String, dynamic>? params,
  });

  /// Open service by ID with parameters
  /// Corresponds to: window.TWK.openService(serviceId, valuesParam)
  Future<void> openService({
    required String serviceId,
    Map<String, dynamic>? params,
  });

  /// Open URL with specified type
  /// Corresponds to: window.TWK.openUrl(url, urlType)
  Future<void> openUrl({
    required String url,
    required int urlType,
  });

  // ==================== Card Methods ====================

  /// Post card with action type and payload
  /// Corresponds to: window.TWK.postCard(actionType, payload)
  Future<void> postCard({
    required String actionType,
    required Map<String, dynamic> payload,
  });

  // ==================== Scanner Methods ====================

  /// Scan QR/Barcode
  /// Corresponds to: window.TWK.scanCode()
  Future<String?> scanCode();

  // ==================== Payment Methods ====================

  /// Set payment configuration
  /// Corresponds to: window.TWK.setPaymentConfiguration(callbackSuccessUrlList, callbackFailureUrlList, successPageName, failurePageName)
  Future<void> setPaymentConfiguration({
    required List<String> callbackSuccessUrlList,
    required List<String> callbackFailureUrlList,
    required String successPageName,
    required String failurePageName,
  });

  // ==================== Logging Methods ====================

  /// General log with event name, log type, and message
  /// Corresponds to: window.TWK.generalLog(eventName, logType, logMessage)
  Future<void> generalLog({
    required String eventName,
    required int logType,
    required String logMessage,
  });

  /// API log with detailed request/response information
  /// Corresponds to: window.TWK.apiLog(url, methodType, requestBody, requestHeaders, requestDateTime, responseBody, responseHeaders, responseDateTime, responseCode)
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
  });

  /// Start API interceptor to automatically log API calls
  /// Corresponds to: window.TWK.startApiIntercept()
  Future<void> startApiIntercept();

  // ==================== Document Methods ====================

  /// Add document to user's storage
  /// Corresponds to: window.TWK.addDocument(documentName, documentContent, referenceNumber, categoryId)
  Future<void> addDocument({
    required String documentName,
    required String documentContent,
    required String referenceNumber,
    required int categoryId,
  });

  /// Update existing document
  /// Corresponds to: window.TWK.updateDocument(documentName, documentContent, referenceNumber, categoryId)
  Future<void> updateDocument({
    required String documentName,
    required String documentContent,
    required String referenceNumber,
    required int categoryId,
  });

  /// Delete document
  /// Corresponds to: window.TWK.deleteDocument(referenceNumber, categoryId)
  Future<void> deleteDocument({
    required String referenceNumber,
    required int categoryId,
  });

  // ==================== Liveness Check Methods ====================

  /// Liveness check using camera with configurations
  /// Corresponds to: window.TWK.livenessCheckCamera(configurations)
  Future<Map<String, dynamic>?> livenessCheckCamera({
    List<Map<String, dynamic>>? configurations,
  });

  /// Liveness check from gallery image with configurations
  /// Corresponds to: window.TWK.livenessCheckImageFromGallery(configurations)
  Future<Map<String, dynamic>?> livenessCheckImageFromGallery({
    List<Map<String, dynamic>>? configurations,
  });

  /// Liveness check from file image with configurations
  /// Corresponds to: window.TWK.livenessCheckImageFromFiles(configurations)
  Future<Map<String, dynamic>?> livenessCheckImageFromFiles({
    List<Map<String, dynamic>>? configurations,
  });
}
