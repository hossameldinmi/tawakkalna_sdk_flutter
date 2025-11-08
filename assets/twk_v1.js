
  async function getRawDataJs(file) {
    var response = await window.TWK.getRawData(file);
    return JSON.stringify(response.result, null, 2);
  }

  async function getUserIdJs() {
    var response = await window.TWK.getUserId();
    return JSON.stringify(response.result, null, 2);
  }

  async function getUserTypeJs() {
    var response = await window.TWK.getUserType();
    return JSON.stringify(response.result, null, 2);
  }

  async function getUserBirthDateJs() {
    var response = await window.TWK.getUserBirthDate();
    return JSON.stringify(response.result, null, 2);
  }

  async function getUserMobileNumberJs() {
    var response = await window.TWK.getUserMobileNumber();
    return JSON.stringify(response.result, null, 2);
  }

  async function getUserGenderJs() {
    var response = await window.TWK.getUserGender();
    return JSON.stringify(response.result, null, 2);
  }

  async function getUserLocationJs() {
    var response = await window.TWK.getUserLocation();
    return JSON.stringify(response.result, null, 2);
  }

  async function getUserNationalityJs() {
    var response = await window.TWK.getUserNationality();
    return JSON.stringify(response.result, null, 2);
  }

  async function getUserNationalityIsoJs() {
    var response = await window.TWK.getUserNationalityISO();
    return JSON.stringify(response.result, null, 2);
  }

  async function getUserFullNameJs() {
    var response = await window.TWK.getUserFullName();
    return JSON.stringify(response.result, null, 2);
  }

  async function getUserMaritalStatusJs() {
    var response = await window.TWK.getUserMaritalStatus();
    return JSON.stringify(response.result, null, 2);
  }

  async function getUserHealthStatusJs() {
    var response = await window.TWK.getUserHealthStatus();
    return JSON.stringify(response.result, null, 2);
  }

  async function getUserDisabilityTypeJs() {
    var response = await window.TWK.getUserDisabilityType();
    return JSON.stringify(response.result, null, 2);
  }

  async function getUserBloodTypeJs() {
    var response = await window.TWK.getUserBloodType();
    return JSON.stringify(response.result, null, 2);
  }

  async function getUserNationalAddressJs() {
    var response = await window.TWK.getUserNationalAddress();
    return JSON.stringify(response.result, null, 2);
  }

  async function getUserDegreeTypeJs() {
    var response = await window.TWK.getUserDegreeType();
    return JSON.stringify(response.result, null, 2);
  }

  async function getUserOccupationJs() {
    var response = await window.TWK.getUserOccupation();
    return JSON.stringify(response.result, null, 2);
  }

  async function getUserFamilyMembersJs(minage, maxage, gender) {
    var response = await window.TWK.getUserFamilyMembers(minage, maxage, gender);
    return JSON.stringify(response.result, null, 2);
  }

  async function getUserSponsorsJs(minage, maxage, gender) {
    var response = await window.TWK.getUserSponsors(minage, maxage, gender);
    return JSON.stringify(response.result, null, 2);
  }

  async function getUserUnPaidViolationsJs() {
    var response = await window.TWK.getUserUnPaidViolations();
    return JSON.stringify(response.result, null, 2);
  }

  async function getUserPaidViolationsJs() {
    var response = await window.TWK.getUserPaidViolations();
    return JSON.stringify(response.result, null, 2);
  }

  async function getUserVehiclesJs() {
    var response = await window.TWK.getUserVehicles();
    return JSON.stringify(response.result, null, 2);
  }

  async function getUserProfilePhotoJs() {
    var response = await window.TWK.getUserProfilePhoto();
    return JSON.stringify(response.result, null, 2);
  }

  async function getUserPassportsJs() {
    var response = await window.TWK.getUserPassports();
    return JSON.stringify(response.result, null, 2);
  }

  async function getDeviceInfoJs() {
    var response = await window.TWK.getDeviceInfo();
    return JSON.stringify(response.result, null, 2);
  }

  async function getGallerySingleJs() {
    var response = await window.TWK.getGallerySingle();
    return JSON.stringify(response.result, null, 2);
  }

  async function getGalleryMultiJs() {
    var response = await window.TWK.getGalleryMulti();
    return JSON.stringify(response.result, null, 2);
  }

  async function getGallerySingleVideoJs() {
    var response = await window.TWK.getGallerySingleVideo();
    return JSON.stringify(response.result, null, 2);
  }

  async function getGalleryMultiVideoJs() {
    var response = await window.TWK.getGalleryMultiVideo();
    return JSON.stringify(response.result, null, 2);
  }

  async function getCameraPhotoJs() {
    var response = await window.TWK.getCameraPhoto();
    return JSON.stringify(response.result, null, 2);
  }

  async function getCameraVideoJs() {
    var response = await window.TWK.getCameraVideo();
    return JSON.stringify(response.result, null, 2);
  }

  async function getFileBase64Js() {
    var response = await window.TWK.getFileBase64();
    return JSON.stringify(response.result, null, 2);
  }

  async function getFileIdJs() {
    var response = await window.TWK.getFileId();
    return JSON.stringify(response.result, null, 2);
  }

  async function askUserLocationPermissionJs() {
    var response = await window.TWK.askUserLocationPermission();
    return JSON.stringify(response.result, null, 2);
  }

  async function askUserPreciseLocationPermissionJs() {
    var response = await window.TWK.askUserPreciseLocationPermission();
    return JSON.stringify(response.result, null, 2);
  }

  async function askCameraPermissionJs() {
    var response = await window.TWK.askCameraPermission();
    return JSON.stringify(response.result, null, 2);
  }

  async function askGalleryPermissionJs() {
    var response = await window.TWK.askGalleryPermission();
    return JSON.stringify(response.result, null, 2);
  }

  async function askPushNotificationPermissionJs() {
    var response = await window.TWK.askPushNotificationPermission();
    return JSON.stringify(response.result, null, 2);
  }

  async function authenticateBiometricJs() {
    var response = await window.TWK.authenticateBiometric();
    return JSON.stringify(response.result, null, 2);
  }

  async function shareScreenShotJs() {
    var response = await window.TWK.shareScreenShot();
    return JSON.stringify(response.result, null, 2);
  }

  async function openScreenJs(screenType, valuesParam) {
    var response = await window.TWK.openScreen(screenType, valuesParam);
    return JSON.stringify(response.result, null, 2);
  }

  async function postCardJs(actionType, payload) {
    var response = await window.TWK.postCard(actionType, payload);
    return JSON.stringify(response.result, null, 2);
  }

  async function generateTokenJs() {
    var response = await window.TWK.generateToken();
    return JSON.stringify(response.result, null, 2);
  }

  async function shareJs(fileName, content, mimetype) {
    var response = await window.TWK.share(fileName, content, mimetype);
    return JSON.stringify(response.result, null, 2);
  }

  async function scanCodeJs() {
    var response = await window.TWK.scanCode();
    return JSON.stringify(response.result, null, 2);
  }

  async function openServiceJs(serviceId, valuesParam) {
    var response = await window.TWK.openService(serviceId, valuesParam);
    return JSON.stringify(response.result, null, 2);
  }

  async function getImageJs(nationalId) {
    var response = await window.TWK.getImage(nationalId);
    return JSON.stringify(response.result, null, 2);
  }

  async function setPaymentConfigurationJs(callbackSuccessUrlList, callbackFailureUrlList, successPageName, failurePageName) {
    var response = await window.TWK.setPaymentConfiguration(callbackSuccessUrlList, callbackFailureUrlList, successPageName, failurePageName);
    return JSON.stringify(response.result, null, 2);
  }

  async function generalLogJs(eventName, logType, logMessage) {
    var response = await window.TWK.generalLog(eventName, logType, logMessage);
    return JSON.stringify(response.result, null, 2);
  }

  async function apiLogJs(url, methodType, requestBody, requestHeaders, requestDateTime, responseBody, responseHeaders, responseDateTime, responseCode) {
    var response = await window.TWK.apiLog(url, methodType, requestBody, requestHeaders, requestDateTime, responseBody, responseHeaders, responseDateTime, responseCode);
    return JSON.stringify(response.result, null, 2);
  }

  async function addDocumentJs(documentName, documentContent, referenceNumber, categoryId) {
    var response = await window.TWK.addDocument(documentName, documentContent, referenceNumber, categoryId);
    return JSON.stringify(response.result, null, 2);
  }

  async function updateDocumentJs(documentName, documentContent, referenceNumber, categoryId) {
    var response = await window.TWK.updateDocument(documentName, documentContent, referenceNumber, categoryId);
    return JSON.stringify(response.result, null, 2);
  }

  async function deleteDocumentJs(referenceNumber, categoryId) {
    var response = await window.TWK.deleteDocument(referenceNumber, categoryId);
    return JSON.stringify(response.result, null, 2);
  }

  async function getUserIdExpiryDateJs() {
    var response = await window.TWK.getUserIdExpiryDate();
    return JSON.stringify(response.result, null, 2);
  }

  async function startApiInterceptJs() {
    var response = await window.TWK.startApiIntercept();
    return JSON.stringify(response.result, null, 2);
  }

  async function getUserDocumentNumberJs() {
    var response = await window.TWK.getUserDocumentNumber();
    return JSON.stringify(response.result, null, 2);
  }

  async function getUserBirthCityJs() {
    var response = await window.TWK.getUserBirthCity();
    return JSON.stringify(response.result, null, 2);
  }

  async function openUrlJs(url, urlType) {
    var response = await window.TWK.openUrl(url, urlType);
    return JSON.stringify(response.result, null, 2);
  }

  async function getUserEmailJs() {
    var response = await window.TWK.getUserEmail();
    return JSON.stringify(response.result, null, 2);
  }

  async function getUserIqamaTypeJs() {
    var response = await window.TWK.getUserIqamaType();
    return JSON.stringify(response.result, null, 2);
  }

  async function livenessCheckCameraJs(configurations) {
    var response = await window.TWK.livenessCheckCamera(configurations);
    return JSON.stringify(response.result, null, 2);
  }

  async function livenessCheckImageFromGalleryJs(configurations) {
    var response = await window.TWK.livenessCheckImageFromGallery(configurations);
    return JSON.stringify(response.result, null, 2);
  }

  async function livenessCheckImageFromFilesJs(configurations) {
    var response = await window.TWK.livenessCheckImageFromFiles(configurations);
    return JSON.stringify(response.result, null, 2);
  }

