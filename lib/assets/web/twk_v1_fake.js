

  let mockData = {};

  async function loadMockJson() {
    if (Object.keys(mockData).length > 0) return;
    // Try to fetch the mock JSON file
    try {
      const response = await fetch('assets/packages/tawakkalna_sdk_flutter/assets/mock_profile1.0.2.json');
      if (!response.ok) {
        console.error('Failed to fetch mock_profile1.0.2.json:', response.status, response.statusText);
        return;
      }
      const text = await response.text();
      if (!text || text.trim().length === 0) {
        console.error('mock_profile1.0.2.json is empty');
        return;
      }
      const json = JSON.parse(text);
      for (const endpoint of json.mock_endpoints) {
        mockData[endpoint.path] = endpoint.return;
      }
      console.log('Successfully loaded mock data with', Object.keys(mockData).length, 'endpoints');
    } catch (e) {
      console.error('Failed to load mock_profile1.0.2.json', e);
    }
  }

  function getMock(path) {
    return mockData[path] ?? {};
  }


  function alertAndReturn(name, value) {
    alert(name);
    return value;
  }

  async function getRawDataJs(file) {
    await loadMockJson();
    return alertAndReturn('getRawDataJs', getMock('/user_data/raw_data'));
  }
  async function getUserIdJs() {
    await loadMockJson();
    return alertAndReturn('getUserIdJs', getMock('/user_data/user_id'));
  }
  async function getUserTypeJs() {
    await loadMockJson();
    return alertAndReturn('getUserTypeJs', getMock('/user_data/user_type'));
  }
  async function getUserBirthDateJs() {
    await loadMockJson();
    return alertAndReturn('getUserBirthDateJs', getMock('/user_data/birth_date'));
  }
  async function getUserMobileNumberJs() {
    await loadMockJson();
    return alertAndReturn('getUserMobileNumberJs', getMock('/user_data/mobile_number'));
  }
  async function getUserGenderJs() {
    await loadMockJson();
    return alertAndReturn('getUserGenderJs', getMock('/user_data/gender'));
  }
  async function getUserLocationJs() {
    await loadMockJson();
    return alertAndReturn('getUserLocationJs', getMock('/user_data/user_location'));
  }
  async function getUserNationalityJs() {
    await loadMockJson();
    return alertAndReturn('getUserNationalityJs', getMock('/user_data/nationality_name'));
  }
  async function getUserNationalityIsoJs() {
    await loadMockJson();
    return alertAndReturn('getUserNationalityIsoJs', getMock('/user_data/nationality_iso'));
  }
  async function getUserFullNameJs() {
    await loadMockJson();
    return alertAndReturn('getUserFullNameJs', getMock('/user_data/full_name'));
  }
  async function getUserMaritalStatusJs() {
    await loadMockJson();
    return alertAndReturn('getUserMaritalStatusJs', getMock('/user_data/marital_status'));
  }
  async function getUserHealthStatusJs() {
    await loadMockJson();
    return alertAndReturn('getUserHealthStatusJs', getMock('/user_data/health_status'));
  }
  async function getUserDisabilityTypeJs() {
    await loadMockJson();
    return alertAndReturn('getUserDisabilityTypeJs', getMock('/user_data/disability_type'));
  }
  async function getUserBloodTypeJs() {
    await loadMockJson();
    return alertAndReturn('getUserBloodTypeJs', getMock('/user_data/blood_type'));
  }
  async function getUserNationalAddressJs() {
    await loadMockJson();
    return alertAndReturn('getUserNationalAddressJs', getMock('/user_data/national_address'));
  }
  async function getUserDegreeTypeJs() {
    await loadMockJson();
    return alertAndReturn('getUserDegreeTypeJs', getMock('/user_data/degree_type'));
  }
  async function getUserOccupationJs() {
    await loadMockJson();
    return alertAndReturn('getUserOccupationJs', getMock('/user_data/occupation'));
  }
  async function getUserFamilyMembersJs(minage, maxage, gender) {
    await loadMockJson();
    return alertAndReturn('getUserFamilyMembersJs', getMock('/user_data/family_members'));
  }
  async function getUserSponsorsJs(minage, maxage, gender) {
    await loadMockJson();
    return alertAndReturn('getUserSponsorsJs', getMock('/user_data/sponsors'));
  }
  async function getUserUnPaidViolationsJs() {
    await loadMockJson();
    return alertAndReturn('getUserUnPaidViolationsJs', getMock('/user_data/violations/unpaid'));
  }
  async function getUserPaidViolationsJs() {
    await loadMockJson();
    return alertAndReturn('getUserPaidViolationsJs', getMock('/user_data/violations/paid'));
  }
  async function getUserVehiclesJs() {
    await loadMockJson();
    return alertAndReturn('getUserVehiclesJs', getMock('/user_data/vehicles'));
  }
  async function getUserProfilePhotoJs() {
    await loadMockJson();
    return alertAndReturn('getUserProfilePhotoJs', getMock('/user_data/profile_photo'));
  }
  async function getUserPassportsJs() {
    await loadMockJson();
    return alertAndReturn('getUserPassportsJs', getMock('/user_data/passports'));
  }
  async function getDeviceInfoJs() {
    await loadMockJson();
    return alertAndReturn('getDeviceInfoJs', getMock('/user_data/device_info'));
  }
  async function getGallerySingleJs() {
    await loadMockJson();
    return alertAndReturn('getGallerySingleJs', getMock('/user_data/gallery_single'));
  }
  async function getGalleryMultiJs() {
    await loadMockJson();
    return alertAndReturn('getGalleryMultiJs', getMock('/user_data/gallery_multi'));
  }
  async function getGallerySingleVideoJs() {
    await loadMockJson();
    return alertAndReturn('getGallerySingleVideoJs', getMock('/user_data/gallery_single_video'));
  }
  async function getGalleryMultiVideoJs() {
    await loadMockJson();
    return alertAndReturn('getGalleryMultiVideoJs', getMock('/user_data/gallery_multi_video'));
  }
  async function getCameraPhotoJs() {
    await loadMockJson();
    return alertAndReturn('getCameraPhotoJs', getMock('/user_data/camera_photo'));
  }
  async function getCameraVideoJs() {
    await loadMockJson();
    return alertAndReturn('getCameraVideoJs', getMock('/user_data/camera_video'));
  }
  async function getFileBase64Js() {
    await loadMockJson();
    return alertAndReturn('getFileBase64Js', getMock('/user_data/file_base64'));
  }
  async function getFileIdJs() {
    await loadMockJson();
    return alertAndReturn('getFileIdJs', getMock('/user_data/file_id'));
  }
  async function askUserLocationPermissionJs() {
    await loadMockJson();
    return alertAndReturn('askUserLocationPermissionJs', getMock('/user_data/location_permission'));
  }
  async function askUserPreciseLocationPermissionJs() {
    await loadMockJson();
    return alertAndReturn('askUserPreciseLocationPermissionJs', getMock('/user_data/precise_location_permission'));
  }
  async function askCameraPermissionJs() {
    await loadMockJson();
    return alertAndReturn('askCameraPermissionJs', getMock('/user_data/camera_permission'));
  }
  async function askGalleryPermissionJs() {
    await loadMockJson();
    return alertAndReturn('askGalleryPermissionJs', getMock('/user_data/gallery_permission'));
  }
  async function askPushNotificationPermissionJs() {
    await loadMockJson();
    return alertAndReturn('askPushNotificationPermissionJs', getMock('/user_data/push_notification_permission'));
  }
  async function authenticateBiometricJs() {
    await loadMockJson();
    return alertAndReturn('authenticateBiometricJs', getMock('/authenticate/biometric'));
  }
  async function shareScreenShotJs() {
    await loadMockJson();
    return alertAndReturn('shareScreenShotJs', getMock('/user_data/share_screenshot'));
  }
  async function openScreenJs(screenType, valuesParam) {
    await loadMockJson();
    return alertAndReturn('openScreenJs', getMock('/user_data/open_screen'));
  }
  async function postCardJs(actionType, payload) {
    await loadMockJson();
    return alertAndReturn('postCardJs', getMock('/user_data/post_card'));
  }
  async function generateTokenJs() {
    await loadMockJson();
    return alertAndReturn('generateTokenJs', getMock('/authenticate/generatetoken'));
  }
  async function shareJs(fileName, content, mimetype) {
    await loadMockJson();
    return alertAndReturn('shareJs', getMock('/user_data/share'));
  }
  async function scanCodeJs() {
    await loadMockJson();
    return alertAndReturn('scanCodeJs', getMock('/user_data/scan_code'));
  }
  async function openServiceJs(serviceId, valuesParam) {
    await loadMockJson();
    return alertAndReturn('openServiceJs', getMock('/user_data/open_service'));
  }
  async function getImageJs(nationalId) {
    await loadMockJson();
    return alertAndReturn('getImageJs', getMock('/user_data/image'));
  }
  async function setPaymentConfigurationJs(callbackSuccessUrlList, callbackFailureUrlList, successPageName, failurePageName) {
    await loadMockJson();
    return alertAndReturn('setPaymentConfigurationJs', getMock('/user_data/set_payment_configuration'));
  }
  async function generalLogJs(eventName, logType, logMessage) {
    await loadMockJson();
    return alertAndReturn('generalLogJs', getMock('/user_data/general_log'));
  }
  async function apiLogJs(url, methodType, requestBody, requestHeaders, requestDateTime, responseBody, responseHeaders, responseDateTime, responseCode) {
    await loadMockJson();
    return alertAndReturn('apiLogJs', getMock('/user_data/api_log'));
  }
  async function addDocumentJs(documentName, documentContent, referenceNumber, categoryId) {
    await loadMockJson();
    return alertAndReturn('addDocumentJs', getMock('/user_data/add_document'));
  }
  async function updateDocumentJs(documentName, documentContent, referenceNumber, categoryId) {
    await loadMockJson();
    return alertAndReturn('updateDocumentJs', getMock('/user_data/update_document'));
  }
  async function deleteDocumentJs(referenceNumber, categoryId) {
    await loadMockJson();
    return alertAndReturn('deleteDocumentJs', getMock('/user_data/delete_document'));
  }
  async function getUserIdExpiryDateJs() {
    await loadMockJson();
    return alertAndReturn('getUserIdExpiryDateJs', getMock('/user_data/id_expiry_date'));
  }
  async function startApiInterceptJs() {
    await loadMockJson();
    return alertAndReturn('startApiInterceptJs', getMock('/user_data/start_api_intercept'));
  }
  async function getUserDocumentNumberJs() {
    await loadMockJson();
    return alertAndReturn('getUserDocumentNumberJs', getMock('/user_data/user_document_number'));
  }
  async function getUserBirthCityJs() {
    await loadMockJson();
    return alertAndReturn('getUserBirthCityJs', 'No fake data');
  }
  async function openUrlJs(url, urlType) {
    await loadMockJson();
    return alertAndReturn('openUrlJs', getMock('/user_data/open_url'));
  }
  async function getUserEmailJs() {
    await loadMockJson();
    return alertAndReturn('getUserEmailJs', getMock('/user_data/email'));
  }
  async function getUserIqamaTypeJs() {
    await loadMockJson();
    return alertAndReturn('getUserIqamaTypeJs', getMock('/user_data/iqama_type'));
  }
  async function livenessCheckCameraJs(configurations) {
    await loadMockJson();
    return alertAndReturn('livenessCheckCameraJs', getMock('/user_data/liveness_check_camera'));
  }
  async function livenessCheckImageFromGalleryJs(configurations) {
    await loadMockJson();
    return alertAndReturn('livenessCheckImageFromGalleryJs', getMock('/user_data/liveness_check_image_gallery'));
  }
  async function livenessCheckImageFromFilesJs(configurations) {
    await loadMockJson();
    return alertAndReturn('livenessCheckImageFromFilesJs', getMock('/user_data/liveness_check_image_files'));
  }

