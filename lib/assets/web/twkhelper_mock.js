//JS v1.10
//================

// Mock data loading
let mockData = {};
const ENABLELOG = false;
const TWKAPIBASE = "";
const SHAREDSECRET = "";

async function loadMockJson() {
  if (Object.keys(mockData).length > 0) return;
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

window.TWK = {
  version: "1.10",
  getRawData: function (file) {
    return {'data':'TWK Mock Raw Data'};
  },
  getRawData: function (file) {
    return Promise.resolve(httpHelper('/raw_data'));
  },
  getUserId: function () {
    return Promise.resolve({ success: true, result: { user_id: -161994 } });
  },
  // getUserId: function () {
  //   return Promise.resolve(httpHelper('/user_data/user_id'));
  // },
  getUserType: function () {
    return Promise.resolve(httpHelper('/user_data/user_type'));
  },
  getUserBirthDate: function () {
    return Promise.resolve(httpHelper('/user_data/birth_date'));
  },
  getUserMobileNumber: function () {
    return Promise.resolve(httpHelper('/user_data/mobile_number'));
  },
  getUserGender: function () {
    return Promise.resolve(httpHelper('/user_data/gender'));
  },
  getUserLocation: function () {
    return Promise.resolve(httpHelper('/user_data/user_location'));
  },
  getUserNationality: function () {
    return Promise.resolve(httpHelper('/user_data/nationality_name'));
  },
  getUserNationalityISO: function () {
    return Promise.resolve(httpHelper('/user_data/nationality_iso'));
  },
  getUserFullName: function () {
    return Promise.resolve(httpHelper('/user_data/full_name'));
  },
  getUserMaritalStatus: function () {
    return Promise.resolve(httpHelper('/user_data/marital_status'));
  },
  getUserHealthStatus: function () {
    return Promise.resolve(httpHelper('/user_data/health_status'));
  },
  getUserDisabilityType: function () {
    return Promise.resolve(httpHelper('/user_data/disability_type'));
  },
  getUserBloodType: function () {
    return Promise.resolve(httpHelper('/user_data/blood_type'));
  },
  getUserNationalAddress: function () {
    return Promise.resolve(httpHelper('/user_data/national_address'));
  },
  getUserDegreeType: function () {
    return Promise.resolve(httpHelper('/user_data/degree_type'));
  },
  getUserOccupation: function () {
    return Promise.resolve(httpHelper('/user_data/occupation'));
  },
  getUserFamilyMembers: function (minage, maxage, gender) {
    return Promise.resolve(httpHelper('/user_data/family_members'));
  },
  getUserSponsors: function (minage, maxage, gender) {
    return Promise.resolve(httpHelper('/user_data/sponsors'));
  },
  getUserUnPaidViolations: function () {
    return Promise.resolve(httpHelper('/user_data/violations/unpaid'));
  },
  getUserPaidViolations: function () {
    return Promise.resolve(httpHelper('/user_data/violations/paid'));
  },
  getUserVehicles: function () {
    return Promise.resolve(httpHelper('/user_data/vehicles'));
  },
  getUserProfilePhoto: function () {
    return Promise.resolve(httpHelper('/user_data/user_photo'));
  },
  getUserPassports: function () {
    return Promise.resolve(httpHelper('/user_data/passports'));
  },
  getDeviceInfo: function () {
    return Promise.resolve(httpHelper('/capabilities'));
  },
  getGallerySingle: function () {
    return Promise.resolve(httpHelper('/gallery/image/single'));
  },
  getGalleryMulti: function () {
    return Promise.resolve(httpHelper('/gallery/image/multi'));
  },
  getGallerySingleVideo: function () {
    return Promise.resolve(httpHelper('/gallery/video/single'));
  },
  getGalleryMultiVideo: function () {
    return Promise.resolve(httpHelper('/gallery/video/multi'));
  },
  getCameraPhoto: function () {
    return Promise.resolve(httpHelper('/camera/image'));
  },
  getCameraVideo: function () {
    return Promise.resolve(httpHelper('/camera/video'));
  },
  getFileBase64: function () {
    return Promise.resolve(httpHelper('/files/base64'));
  },
  getFileId: function () {
    return Promise.resolve(httpHelper('/files'));
  },
  askUserLocationPermission: function () {
    return Promise.resolve(httpHelper('/ask_permissions/location'));
  },
  askUserPreciseLocationPermission: function () {
    return Promise.resolve(httpHelper('/ask_permissions/precise_location'));
  },
  askCameraPermission: function () {
    return Promise.resolve(httpHelper('/ask_permissions/camera'));
  },
  askGalleryPermission: function () {
    return Promise.resolve(httpHelper('/ask_permissions/gallery'));
  },
  askPushNotificationPermission: function () {
    return Promise.resolve(httpHelper('/ask_permissions/push_notification'));
  },
  authenticateBiometric: function () {
    return Promise.resolve(httpHelper('/authenticate/biometric'));
  },
  shareScreenShot: function () {
    return Promise.resolve(httpHelper('/share/screenshot'));
  },
  openScreen: function (screenType, valuesParam) {
    return Promise.resolve(httpHelper('/open_screen'));
  },
  postCard: function (actionType, payload) {
    return Promise.resolve(httpHelper('/cards'));
  },
  generateToken: function () {
    return Promise.resolve(httpHelper('/authenticate/generatetoken'));
  },
  share: function (fileName, content, mimetype) {
    return Promise.resolve(httpHelper('/share/base64'));
  },
  scanCode: function () {
    return Promise.resolve(httpHelper('/scan_code'));
  },
  openService: function (serviceId, valuesParam) {
    return Promise.resolve(httpHelper('/open_service'));
  },
  getImage: function (nationalId) {
    return Promise.resolve(httpHelper('/user_data/image'));
  },
  setPaymentConfiguration: function (
    callbackSuccessUrlList,
    callbackFailureUrlList,
    successPageName,
    failurePageName
  ) {
    return Promise.resolve(httpHelper('/payment/configuration'));
  },
  generalLog: function (eventName, logType = LogType.info, logMessage) {
    return Promise.resolve(httpHelper('/logger/general_log'));
  },
  apiLog: function (
    url,
    methodType = MethodType.GET,
    requestBody = "{}",
    requestHeaders = "{}",
    requestDateTime = new Date(),
    responseBody = "{}",
    responseHeaders = "{}",
    responseDateTime = new Date(),
    responseCode
  ) {
    return Promise.resolve(httpHelper('/logger/api_log'));
  },
  addDocument: function (
    documentName,
    documentContent,
    referenceNumber,
    categoryId
  ) {
    return Promise.resolve(httpHelper('/documents/add'));
  },
  updateDocument: function (
    documentName,
    documentContent,
    referenceNumber,
    categoryId
  ) {
    return Promise.resolve(httpHelper('/documents/update'));
  },
  deleteDocument: function (referenceNumber, categoryId) {
    return Promise.resolve(httpHelper('/documents/delete'));
  },
  getUserIdExpiryDate: function () {
    return Promise.resolve(httpHelper('/user_data/id_expiry_date'));
  },
  startApiIntercept: function () {
    return Promise.resolve(httpHelper('/api/intercept'));
  },
  getUserDocumentNumber: function () {
    return Promise.resolve(httpHelper('/user_data/user_document_number'));
  },
  getUserBirthCity: function () {
    return Promise.resolve(httpHelper('/user_data/user_birth_city'));
  },
  openUrl: function (url, urlType) {
    return Promise.resolve(httpHelper('/actions/open_url'));
  },
  getUserEmail: function () {
    return Promise.resolve(httpHelper('/user_data/email'));
  },
  getUserIqamaType: function () {
    return Promise.resolve(httpHelper('/user_data/iqama_type'));
  },
  livenessCheckCamera: function (configurations = []) {
    return Promise.resolve(httpHelper('/actions/liveness_check/camera'));
  },
  livenessCheckImageFromGallery: function (configurations = []) {
    return Promise.resolve(httpHelper('/actions/liveness_check/image_from_gallery'));
  },
  livenessCheckImageFromFiles: function (configurations = []) {
    return Promise.resolve(httpHelper('/actions/liveness_check/image_from_files'));
  },
  getUserDocumentNumber: function () {
    return httpHelper("/user_data/user_document_number");
  },
  getUserBirthCity: function () {
    return httpHelper("/user_data/user_birth_city");
  },
  openUrl: function (url, urlType) {
    if (
      url === undefined ||
      (typeof url === "string" && url.trim().length === 0)
    ) {
      return new Promise((resolve) => {
        const ret = generateError("please provice the url");
        resolve(ret);
      });
    }
    if (urlType === undefined) {
      return new Promise((resolve) => {
        let ret = generateError("please provice the  url type");
        resolve(ret);
      });
    }
    if ((isNaN(urlType), Number(urlType) === false)) {
      return new Promise((resolve) => {
        const ret = generateError("invalid url type should be number");
        resolve(ret);
      });
    }
    if (
      Number(urlType) !== UrlType.http &&
      Number(urlType) !== UrlType.tel &&
      Number(urlType) !== UrlType.mailTo &&
      Number(urlType) !== UrlType.deepLink &&
      Number(urlType) !== UrlType.sms
    ) {
      return new Promise((resolve) => {
        const ret = generateError(
          "please provide the url Type and should be number please pass enum of type [UrlType] from twkHelper.js file "
        );
        resolve(ret);
      });
    }
    return new Promise((resolve) => {
      let httpRequest = new XMLHttpRequest();
      const address = TWKAPIBASE + "/actions/open_url";
      httpRequest.onreadystatechange = function loaded() {
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
          resolve(getReturn(httpRequest));
        }
      };

      let toSend = {
        url: url,
        url_type: Number(urlType),
      };
      httpRequest.responseType = "arraybuffer";
      httpRequest.open("POST", address);
      httpRequest.setRequestHeader("Content-type", "application/json");
      let messageBody = JSON.stringify(toSend);
      generateHttpHashHeaders(address, "POST", messageBody).then((headers) => {
        for (const [key, value] of Object.entries(headers)) {
          if (ENABLELOG == true) {
            console.log(key, value);
          }
          httpRequest.setRequestHeader(key, value);
        }
        httpRequest.send(JSON.stringify(toSend)); // Make sure to stringify
      });
    });
  },
  getUserEmail: function () {
    return httpHelper("/user_data/email");
  },
  getUserIqamaType: function () {
    return httpHelper("/user_data/iqama_type");
  },
    // please pass and array of LivenessCheckConfiguration item 
  livenessCheckCamera: function (configurations = []) {
    return new Promise((resolve) => {
      let httpRequest = new XMLHttpRequest();
      const address = TWKAPIBASE + "/actions/liveness_check/camera";
      httpRequest.onreadystatechange = function loaded() {
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
          resolve(getReturn(httpRequest));
        }
      };
      let toSend = {
        face_detection_enabled: true,
        face_detection_ratio: null,
        glasses_detection_enabled: true,
        glasses_detection_ratio: null,
        face_centeral_vertical_enabled: true,
        face_centeral_vertical_ratio: null,
        mouth_detection_enabled: true,
        mouth_detection_ratio: null,
        eyes_color_detection_enabled: true,
        eyes_color_detection_ratio: null,
        lightining_detection_enabled: true,
        lightining_detection_ratio: null,
        eyes_detection_enabled: true,
        eyes_detection_ratio: null,
        background_detection_enabled: true,
        background_detection_ratio: null,
        head_wear_check_enabled: true,
        is_female: true,
        allowed_photo_types: null,
        photo_width_in_px: null,
        photo_height_in_px: null,
        max_photo_size_in_kb: null,
      };

      configurations.forEach((configuration) => {
        const configurationType = Number(configuration.configurationType);
        const configurationValue = configuration.configurationValue;

        switch (configurationType) {
          case LivenessCheckConfigurationType.FACE_DETECTION_ENABLED:
            if (Boolean(configurationType) === undefined) {
              toSend.face_detection_enabled = true;
            } else {
              toSend.face_detection_enabled = Boolean(configurationValue);
            }
            break;
          case LivenessCheckConfigurationType.FACE_DETECTION_RATIO:
            toSend.face_detection_ratio = Number(configurationValue) || null;
            break;
          case LivenessCheckConfigurationType.GLASSES_DETECTION_ENABLED:
            if (Boolean(configurationType) === undefined) {
              toSend.glasses_detection_enabled = true;
            } else {
              toSend.glasses_detection_enabled = Boolean(configurationValue);
            }
           break;
          case LivenessCheckConfigurationType.GLASSES_DETECTION_RATIO:
            toSend.glasses_detection_ratio = Number(configurationValue) || null;
            break;
          case LivenessCheckConfigurationType.FACE_CENTRAL_VERTICAL_ENABLED:
              if (Boolean(configurationType) === undefined) {
                toSend.face_centeral_vertical_enabled = true;
              } else {
                toSend.face_centeral_vertical_enabled = Boolean(configurationValue);
              }
              break;
          case LivenessCheckConfigurationType.FACE_CENTRAL_VERTICAL_RATIO:
              toSend.face_centeral_vertical_ratio = Number(configurationValue) || null;
              break;
          case LivenessCheckConfigurationType.MOUTH_DETECTION_ENABLED:
            if (Boolean(configurationType) === undefined) {
              toSend.mouth_detection_enabled = true;
            } else {
              toSend.mouth_detection_enabled = Boolean(configurationValue);
            }
            break;
          case LivenessCheckConfigurationType.MOUTH_DETECTION_RATIO:
            toSend.mouth_detection_ratio = Number(configurationValue) || null;
            break;
          case LivenessCheckConfigurationType.EYES_COLOR_DETECTION_ENABLED:
            if (Boolean(configurationType) === undefined) {
              toSend.eyes_color_detection_enabled = true;
            } else {
              toSend.eyes_color_detection_enabled = Boolean(configurationValue);
            }
            break;
          case LivenessCheckConfigurationType.EYES_COLOR_DETECTION_RATIO:
            toSend.eyes_color_detection_ratio = Number(configurationValue) || null;
            break;
          case LivenessCheckConfigurationType.LIGHTNING_DETECTION_ENABLED:
            if (Boolean(configurationType) === undefined) {
              toSend.lightining_detection_enabled = true;
            } else {
              toSend.lightining_detection_enabled = Boolean(configurationValue);
            }
            break;
          case LivenessCheckConfigurationType.LIGHTNING_DETECTION_RATIO:
            toSend.lightining_detection_ratio = Number(configurationValue) || null;
            break;
          case LivenessCheckConfigurationType.EYES_DETECTION_ENABLED:
            if (Boolean(configurationType) === undefined) {
              toSend.eyes_detection_enabled = true;
            } else {
              toSend.eyes_detection_enabled = Boolean(configurationValue);
            }
            break;
          case LivenessCheckConfigurationType.EYES_DETECTION_RATIO:
            toSend.eyes_detection_ratio = Number(configurationValue) || null;
            break;
          case LivenessCheckConfigurationType.BACKGROUND_DETECTION_ENABLED:
            if (Boolean(configurationType) === undefined) {
              toSend.background_detection_enabled = true;
            } else {
              toSend.background_detection_enabled = Boolean(configurationValue);
            }
            break;
          case LivenessCheckConfigurationType.BACKGROUND_DETECTION_RATIO:
            toSend.background_detection_ratio = Number(configurationValue) || null;
            break;
         case LivenessCheckConfigurationType.HEAD_WEAR_CHECK_ENABLED:
          if (Boolean(configurationType) === undefined) {
            toSend.head_wear_check_enabled = true;
          } else {
            toSend.head_wear_check_enabled = Boolean(configurationValue);
          }
              break;
          case LivenessCheckConfigurationType.IS_FEMALE:
            if (Boolean(configurationType) === undefined) {
              toSend.is_female = null;
            } else {
              toSend.is_female = Boolean(configurationValue);
            }
            break;
            case LivenessCheckConfigurationType.ALLOWED_PHOTO_TYPES:
              toSend.allowed_photo_types = String(configurationValue) || null;
              break;
          case LivenessCheckConfigurationType.PHOTO_WIDTH_IN_PX:
            toSend.photo_width_in_px = Number(configurationValue) || null;
            break;
          case LivenessCheckConfigurationType.PHOTO_HEIGHT_IN_PX:
            toSend.photo_height_in_px = Number(configurationValue) || null;
            break;
          case LivenessCheckConfigurationType.MAX_PHOTO_SIZE_IN_KB:
            toSend.max_photo_size_in_kb = Number(configurationValue) || null;
            break;
          default:
            return new Promise((resolve) => {
              let ret = generateError("invalid configuration");
              resolve(ret);
            });
        }

      });

      httpRequest.responseType = "arraybuffer";
      httpRequest.open("POST", address);
      httpRequest.setRequestHeader("Content-type", "application/json");
      let messageBody = JSON.stringify(toSend);
      generateHttpHashHeaders(address, "POST", messageBody).then((headers) => {
        for (const [key, value] of Object.entries(headers)) {
          if (ENABLELOG == true) {
            console.log(key, value);
          }
          httpRequest.setRequestHeader(key, value);
        }
        httpRequest.send(JSON.stringify(toSend)); // Make sure to stringify
      });
    });
  },
  // please pass and array of LivenessCheckConfiguration item 
  livenessCheckImageFromGallery: function (configurations = []) {
    return new Promise((resolve) => {
      let httpRequest = new XMLHttpRequest();
      const address = TWKAPIBASE + "/actions/liveness_check/image_from_gallery";
      httpRequest.onreadystatechange = function loaded() {
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
          resolve(getReturn(httpRequest));
        }
      };
      let toSend = {
        face_detection_enabled: true,
        face_detection_ratio: null,
        glasses_detection_enabled: true,
        glasses_detection_ratio: null,
        face_centeral_vertical_enabled: true,
        face_centeral_vertical_ratio: null,
        mouth_detection_enabled: true,
        mouth_detection_ratio: null,
        eyes_color_detection_enabled: true,
        eyes_color_detection_ratio: null,
        lightining_detection_enabled: true,
        lightining_detection_ratio: null,
        eyes_detection_enabled: true,
        eyes_detection_ratio: null,
        background_detection_enabled: true,
        background_detection_ratio: null,
        head_wear_check_enabled: true,
        is_female: true,
        allowed_photo_types: null,
        photo_width_in_px: null,
        photo_height_in_px: null,
        max_photo_size_in_kb: null,
      };
      configurations.forEach((configuration) => {
        const configurationType = Number(configuration.configurationType);
        const configurationValue = configuration.configurationValue;

        switch (configurationType) {
          case LivenessCheckConfigurationType.FACE_DETECTION_ENABLED:
            if (Boolean(configurationType) === undefined) {
              toSend.face_detection_enabled = true;
            } else {
              toSend.face_detection_enabled = Boolean(configurationValue);
            }
            break;
          case LivenessCheckConfigurationType.FACE_DETECTION_RATIO:
            toSend.face_detection_ratio = Number(configurationValue) || null;
            break;
          case LivenessCheckConfigurationType.GLASSES_DETECTION_ENABLED:
            if (Boolean(configurationType) === undefined) {
              toSend.glasses_detection_enabled = true;
            } else {
              toSend.glasses_detection_enabled = Boolean(configurationValue);
            }
           break;
          case LivenessCheckConfigurationType.GLASSES_DETECTION_RATIO:
            toSend.glasses_detection_ratio = Number(configurationValue) || null;
            break;
          case LivenessCheckConfigurationType.FACE_CENTRAL_VERTICAL_ENABLED:
              if (Boolean(configurationType) === undefined) {
                toSend.face_centeral_vertical_enabled = true;
              } else {
                toSend.face_centeral_vertical_enabled = Boolean(configurationValue);
              }
              break;
          case LivenessCheckConfigurationType.FACE_CENTRAL_VERTICAL_RATIO:
              toSend.face_centeral_vertical_ratio = Number(configurationValue) || null;
              break;
          case LivenessCheckConfigurationType.MOUTH_DETECTION_ENABLED:
            if (Boolean(configurationType) === undefined) {
              toSend.mouth_detection_enabled = true;
            } else {
              toSend.mouth_detection_enabled = Boolean(configurationValue);
            }
            break;
          case LivenessCheckConfigurationType.MOUTH_DETECTION_RATIO:
            toSend.mouth_detection_ratio = Number(configurationValue) || null;
            break;
          case LivenessCheckConfigurationType.EYES_COLOR_DETECTION_ENABLED:
            if (Boolean(configurationType) === undefined) {
              toSend.eyes_color_detection_enabled = true;
            } else {
              toSend.eyes_color_detection_enabled = Boolean(configurationValue);
            }
            break;
          case LivenessCheckConfigurationType.EYES_COLOR_DETECTION_RATIO:
            toSend.eyes_color_detection_ratio = Number(configurationValue) || null;
            break;
          case LivenessCheckConfigurationType.LIGHTNING_DETECTION_ENABLED:
            if (Boolean(configurationType) === undefined) {
              toSend.lightining_detection_enabled = true;
            } else {
              toSend.lightining_detection_enabled = Boolean(configurationValue);
            }
            break;
          case LivenessCheckConfigurationType.LIGHTNING_DETECTION_RATIO:
            toSend.lightining_detection_ratio = Number(configurationValue) || null;
            break;
          case LivenessCheckConfigurationType.EYES_DETECTION_ENABLED:
            if (Boolean(configurationType) === undefined) {
              toSend.eyes_detection_enabled = true;
            } else {
              toSend.eyes_detection_enabled = Boolean(configurationValue);
            }
            break;
          case LivenessCheckConfigurationType.EYES_DETECTION_RATIO:
            toSend.eyes_detection_ratio = Number(configurationValue) || null;
            break;
          case LivenessCheckConfigurationType.BACKGROUND_DETECTION_ENABLED:
            if (Boolean(configurationType) === undefined) {
              toSend.background_detection_enabled = true;
            } else {
              toSend.background_detection_enabled = Boolean(configurationValue);
            }
            break;
          case LivenessCheckConfigurationType.BACKGROUND_DETECTION_RATIO:
            toSend.background_detection_ratio = Number(configurationValue) || null;
            break;
         case LivenessCheckConfigurationType.HEAD_WEAR_CHECK_ENABLED:
          if (Boolean(configurationType) === undefined) {
            toSend.head_wear_check_enabled = true;
          } else {
            toSend.head_wear_check_enabled = Boolean(configurationValue);
          }
              break;
          case LivenessCheckConfigurationType.IS_FEMALE:
            if (Boolean(configurationType) === undefined) {
              toSend.is_female = null;
            } else {
              toSend.is_female = Boolean(configurationValue);
            }
            break;
            case LivenessCheckConfigurationType.ALLOWED_PHOTO_TYPES:
              toSend.allowed_photo_types = String(configurationValue) || null;
              break;
          case LivenessCheckConfigurationType.PHOTO_WIDTH_IN_PX:
            toSend.photo_width_in_px = Number(configurationValue) || null;
            break;
          case LivenessCheckConfigurationType.PHOTO_HEIGHT_IN_PX:
            toSend.photo_height_in_px = Number(configurationValue) || null;
            break;
          case LivenessCheckConfigurationType.MAX_PHOTO_SIZE_IN_KB:
            toSend.max_photo_size_in_kb = Number(configurationValue) || null;
            break;
          default:
            return new Promise((resolve) => {
              let ret = generateError("invalid configuration");
              resolve(ret);
            });
        }

      });
      httpRequest.responseType = "arraybuffer";
      httpRequest.open("POST", address);
      httpRequest.setRequestHeader("Content-type", "application/json");
      let messageBody = JSON.stringify(toSend);
      generateHttpHashHeaders(address, "POST", messageBody).then((headers) => {
        for (const [key, value] of Object.entries(headers)) {
          if (ENABLELOG == true) {
            console.log(key, value);
          }
          httpRequest.setRequestHeader(key, value);
        }
        httpRequest.send(JSON.stringify(toSend)); // Make sure to stringify
      });
    });
  },
  livenessCheckImageFromFiles: function (configurations = []) {
    return new Promise((resolve) => {
      let httpRequest = new XMLHttpRequest();
      const address = TWKAPIBASE + "/actions/liveness_check/image_from_files";
      httpRequest.onreadystatechange = function loaded() {
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
          resolve(getReturn(httpRequest));
        }
      };
      let toSend = {
        face_detection_enabled: true,
        face_detection_ratio: null,
        glasses_detection_enabled: true,
        glasses_detection_ratio: null,
        face_centeral_vertical_enabled: true,
        face_centeral_vertical_ratio: null,
        mouth_detection_enabled: true,
        mouth_detection_ratio: null,
        eyes_color_detection_enabled: true,
        eyes_color_detection_ratio: null,
        lightining_detection_enabled: true,
        lightining_detection_ratio: null,
        eyes_detection_enabled: true,
        eyes_detection_ratio: null,
        background_detection_enabled: true,
        background_detection_ratio: null,
        head_wear_check_enabled: true,
        is_female: true,
        allowed_photo_types: null,
        photo_width_in_px: null,
        photo_height_in_px: null,
        max_photo_size_in_kb: null,
      };
      configurations.forEach((configuration) => {
        const configurationType = Number(configuration.configurationType);
        const configurationValue = configuration.configurationValue;

        switch (configurationType) {
          case LivenessCheckConfigurationType.FACE_DETECTION_ENABLED:
            if (Boolean(configurationType) === undefined) {
              toSend.face_detection_enabled = true;
            } else {
              toSend.face_detection_enabled = Boolean(configurationValue);
            }
            break;
          case LivenessCheckConfigurationType.FACE_DETECTION_RATIO:
            toSend.face_detection_ratio = Number(configurationValue) || null;
            break;
          case LivenessCheckConfigurationType.GLASSES_DETECTION_ENABLED:
            if (Boolean(configurationType) === undefined) {
              toSend.glasses_detection_enabled = true;
            } else {
              toSend.glasses_detection_enabled = Boolean(configurationValue);
            }
           break;
          case LivenessCheckConfigurationType.GLASSES_DETECTION_RATIO:
            toSend.glasses_detection_ratio = Number(configurationValue) || null;
            break;
          case LivenessCheckConfigurationType.FACE_CENTRAL_VERTICAL_ENABLED:
              if (Boolean(configurationType) === undefined) {
                toSend.face_centeral_vertical_enabled = true;
              } else {
                toSend.face_centeral_vertical_enabled = Boolean(configurationValue);
              }
              break;
          case LivenessCheckConfigurationType.FACE_CENTRAL_VERTICAL_RATIO:
              toSend.face_centeral_vertical_ratio = Number(configurationValue) || null;
              break;
          case LivenessCheckConfigurationType.MOUTH_DETECTION_ENABLED:
            if (Boolean(configurationType) === undefined) {
              toSend.mouth_detection_enabled = true;
            } else {
              toSend.mouth_detection_enabled = Boolean(configurationValue);
            }
            break;
          case LivenessCheckConfigurationType.MOUTH_DETECTION_RATIO:
            toSend.mouth_detection_ratio = Number(configurationValue) || null;
            break;
          case LivenessCheckConfigurationType.EYES_COLOR_DETECTION_ENABLED:
            if (Boolean(configurationType) === undefined) {
              toSend.eyes_color_detection_enabled = true;
            } else {
              toSend.eyes_color_detection_enabled = Boolean(configurationValue);
            }
            break;
          case LivenessCheckConfigurationType.EYES_COLOR_DETECTION_RATIO:
            toSend.eyes_color_detection_ratio = Number(configurationValue) || null;
            break;
          case LivenessCheckConfigurationType.LIGHTNING_DETECTION_ENABLED:
            if (Boolean(configurationType) === undefined) {
              toSend.lightining_detection_enabled = true;
            } else {
              toSend.lightining_detection_enabled = Boolean(configurationValue);
            }
            break;
          case LivenessCheckConfigurationType.LIGHTNING_DETECTION_RATIO:
            toSend.lightining_detection_ratio = Number(configurationValue) || null;
            break;
          case LivenessCheckConfigurationType.EYES_DETECTION_ENABLED:
            if (Boolean(configurationType) === undefined) {
              toSend.eyes_detection_enabled = true;
            } else {
              toSend.eyes_detection_enabled = Boolean(configurationValue);
            }
            break;
          case LivenessCheckConfigurationType.EYES_DETECTION_RATIO:
            toSend.eyes_detection_ratio = Number(configurationValue) || null;
            break;
          case LivenessCheckConfigurationType.BACKGROUND_DETECTION_ENABLED:
            if (Boolean(configurationType) === undefined) {
              toSend.background_detection_enabled = true;
            } else {
              toSend.background_detection_enabled = Boolean(configurationValue);
            }
            break;
          case LivenessCheckConfigurationType.BACKGROUND_DETECTION_RATIO:
            toSend.background_detection_ratio = Number(configurationValue) || null;
            break;
         case LivenessCheckConfigurationType.HEAD_WEAR_CHECK_ENABLED:
          if (Boolean(configurationType) === undefined) {
            toSend.head_wear_check_enabled = true;
          } else {
            toSend.head_wear_check_enabled = Boolean(configurationValue);
          }
              break;
          case LivenessCheckConfigurationType.IS_FEMALE:
            if (Boolean(configurationType) === undefined) {
              toSend.is_female = null;
            } else {
              toSend.is_female = Boolean(configurationValue);
            }
            break;
            case LivenessCheckConfigurationType.ALLOWED_PHOTO_TYPES:
              toSend.allowed_photo_types = String(configurationValue) || null;
              break;
          case LivenessCheckConfigurationType.PHOTO_WIDTH_IN_PX:
            toSend.photo_width_in_px = Number(configurationValue) || null;
            break;
          case LivenessCheckConfigurationType.PHOTO_HEIGHT_IN_PX:
            toSend.photo_height_in_px = Number(configurationValue) || null;
            break;
          case LivenessCheckConfigurationType.MAX_PHOTO_SIZE_IN_KB:
            toSend.max_photo_size_in_kb = Number(configurationValue) || null;
            break;
          default:
            return new Promise((resolve) => {
              let ret = generateError("invalid configuration");
              resolve(ret);
            });
        }

      });
      httpRequest.responseType = "arraybuffer";
      httpRequest.open("POST", address);
      httpRequest.setRequestHeader("Content-type", "application/json");
      let messageBody = JSON.stringify(toSend);
      generateHttpHashHeaders(address, "POST", messageBody).then((headers) => {
        for (const [key, value] of Object.entries(headers)) {
          if (ENABLELOG == true) {
            console.log(key, value);
          }
          httpRequest.setRequestHeader(key, value);
        }
        httpRequest.send(JSON.stringify(toSend)); // Make sure to stringify
      });
    });
  },
  // other properties
};

window.TWK.V2 = {
  generateToken: function () {
    return httpHelper("/v2/authenticate/generatetoken");
  },
  getUserFullName: function () {
    return httpHelper("/v2/user_data/full_name");
  },
  getUserFamilyMembers: function (minage, maxage, gender) {
    if (minage > 0 && maxage > 0) {
      return httpHelper(
        "/v2/user_data/family_members?age=" +
          minage +
          "-" +
          maxage +
          "&gender=" +
          gender
      );
    } else return httpHelper("v2/user_data/family_members");
  },
  getUserSponsors: function (minage, maxage, gender) {
    if (minage > 0 && maxage > 0) {
      return httpHelper(
        "/v2/user_data/sponsors?age=" +
          minage +
          "-" +
          maxage +
          "&gender=" +
          gender
      );
    } else return httpHelper("v2/user_data/sponsors");
  },
  getUserNationality: function () {
    return httpHelper("/v2/user_data/nationality_name");
  },
};

const UrlType = {
  http: 1,
  tel: 2,
  mailTo: 3,
  deepLink: 4,
  sms: 5,
};

const LogType = {
  info: 1,
  warning: 2,
  error: 3,
  debug: 4,
};

const MethodType = {
  GET: 1,
  POST: 2,
  PUT: 3,
  DELETE: 4,
  PATCH: 5,

  getMethodTypeOfString: function (str) {
    if (str === "POST") {
      return MethodType.POST;
    }
    if (str === "GET") {
      return MethodType.GET;
    }
    if (str === "PUT") {
      return MethodType.PUT;
    }
    if (str === "DELETE") {
      return MethodType.DELETE;
    }
    if (str === "PATCH") {
      return MethodType.PATCH;
    }
    return 0;
  },
};

const LivenessCheckConfigurationType = {
  FACE_DETECTION_ENABLED: 1,
  FACE_DETECTION_RATIO: 2,
  GLASSES_DETECTION_ENABLED: 3,
  GLASSES_DETECTION_RATIO: 4,
  FACE_CENTRAL_VERTICAL_ENABLED: 5,
  FACE_CENTRAL_VERTICAL_RATIO: 6,
  MOUTH_DETECTION_ENABLED: 7,
  MOUTH_DETECTION_RATIO: 8,
  EYES_COLOR_DETECTION_ENABLED: 9,
  EYES_COLOR_DETECTION_RATIO: 10,
  LIGHTNING_DETECTION_ENABLED: 11,
  LIGHTNING_DETECTION_RATIO: 12,
  EYES_DETECTION_ENABLED: 13,
  EYES_DETECTION_RATIO: 14,
  BACKGROUND_DETECTION_ENABLED: 15,
  BACKGROUND_DETECTION_RATIO: 16,
  HEAD_WEAR_CHECK_ENABLED: 17,
  ALLOWED_PHOTO_TYPES: 18,
  IS_FEMALE: 19,
  PHOTO_WIDTH_IN_PX: 20,
  PHOTO_HEIGHT_IN_PX: 21,
  MAX_PHOTO_SIZE_IN_KB: 22,
};

class LivenessCheckConfiguration {
  // *configyrationType: is an enum of type LivenessCheckConfigurationType
  constructor(configurationType, configurationValue) {
    this.configurationType = configurationType;
    this.configurationValue = configurationValue;
  }
}

function getPropListOfObject(obj) {
  let propList = [];
  let requestHeadersObj = obj;
  if (typeof obj === "string" && isValidJSON(obj)) {
    requestHeadersObj = JSON.parse(requestHeadersObj);
  }
  if (requestHeadersObj !== undefined) {
    Object.keys(requestHeadersObj).forEach((key) => {
      const header = {
        header_name: key,
        header_value: String(requestHeadersObj[key]),
      };
      propList.push(header);
    });
  }

  return propList;
}

function isValidJSON(jsonString) {
  try {
    JSON.parse(jsonString);
    return true;
  } catch (e) {
    return false;
  }
}

function convertStringToBase64(str) {
  // Encode the string as a UTF-8 byte array
  const utf8Encoder = new TextEncoder();
  const utf8Bytes = utf8Encoder.encode(str);
  // Convert the byte array to Base64
  const base64String = btoa(String.fromCharCode.apply(null, utf8Bytes));
  return base64String;
}

function generateError(errorMessage) {
  return {
    success: false,
    result: {
      error: errorMessage,
    },
  };
}

function fileToBase64(file) {
  return new Promise((resolve, reject) => {
    // Check if the file is provided
    if (!file) {
      reject("No file provided");
      return;
    }

    // Create a new FileReader
    const reader = new FileReader();

    // Set up onload event
    reader.onload = () => {
      // Get the base64-encoded string from the data URL
      const base64String = reader.result.split(",")[1];
      resolve(base64String);
    };

    // Set up onerror event
    reader.onerror = () => {
      reject("Error occurred while reading the file");
    };

    // Read the file as a data URL
    reader.readAsDataURL(file);
  });
}

function encodeBase64(array) {
  return new Promise((resolve) => {
    const blob = new Blob([array]);
    const reader = new FileReader();

    reader.onload = (event) => {
      const dataUrl = event.target.result;
      const [_, base64] = dataUrl.split(",");
      resolve(base64);
    };
    reader.readAsDataURL(blob);
  });
}

async function getReturn(httpRequest, rawForce) {
  var textDecoder = new TextDecoder("utf-8");
  if (ENABLELOG == true) {
    console.log("rawforce " + rawForce);
  }
  var ret = {};
  if (httpRequest.readyState === XMLHttpRequest.DONE) {
    if (ENABLELOG == true) {
      console.log("httpRequest.status " + httpRequest.status);
    }
    try {
      var isRaw = false;
      var contentType = httpRequest.getResponseHeader("content-type");
      const buffer = httpRequest.response;
      const byteArray = new Uint8Array(buffer);

      if (rawForce) {
        isRaw = true;
      }
      if (ENABLELOG == true) {
        console.log(" contentType " + contentType + " " + isRaw);
      }
      var textContent = "";
      if (!isRaw) {
        if (ENABLELOG == true) {
          console.log("bytearray " + byteArray.length);
          console.log("bytearray " + byteArray.length);
        }
        textContent = textDecoder.decode(byteArray);
        if (ENABLELOG == true) {
          console.log("textContent " + textContent);
        }
      }

      if (isRaw) {
        if (httpRequest.status === 200) {
          ret.success = true;
          ret.result = {};
          ret.result.type = "file";
          ret.result.mime_type = contentType;
          ret.result.data = await encodeBase64(byteArray);
        }
      } else if (httpRequest.status == 200) {
        ret.success = true;
        ret.result = JSON.parse(textContent);
      } else {
        ret.success = false;
        try {
          ret.result = JSON.parse(textContent);
        } catch (error) {
          ret.result = textContent;
        }
      }
    } catch (error) {
      if (ENABLELOG == true) {
        console.log(error);
      }
      ret.success = false;
      ret.result = {
        error: error,
      };
    }
  }
  return ret;
}

function fileEndpointHelper() {
  return new Promise((resolveTop) => {
    httpHelper("/files").then((fileIdFetch) => {
      if (ENABLELOG == true) {
        console.log(fileIdFetch);
      }
      if (fileIdFetch.success) {
        TWK.getRawData(fileIdFetch.result.data).then((fileFetch) => {
          resolveTop(fileFetch);
        });
      } else {
        var ret = {};
        ret.success = false;
        ret.result = {};
        resolveTop(ret);
      }
    });
  });
}
function httpHelper(endpoint, rawForce) {
  return new Promise(async (resolve) => {
    await loadMockJson();
    const mockResult = getMock(endpoint);
    const ret = {
      success: true,
      result: mockResult
    };
    resolve(ret);
  });
}

function generateSignatureFromParams(signatureParams, sharedSecret) {
  return new Promise((resolve) => {
    resolve(generateSignatureFromParamsHelper(signatureParams, sharedSecret));
  });
}
async function generateSignatureFromParamsHelper(
  signatureParams,
  sharedSecret
) {
  try {
    // Convert the message and key to ArrayBuffer
    const encoder = new TextEncoder();
    const encodedKey = encoder.encode(sharedSecret);
    const encodedMessage = encoder.encode(signatureParams);
    const keyBuffer = await crypto.subtle.importKey(
      "raw",
      encodedKey,
      { name: "HMAC", hash: { name: "SHA-256" } },
      false,
      ["sign"]
    );

    const signatureBuffer = await crypto.subtle.sign(
      "HMAC",
      keyBuffer,
      encodedMessage
    );

    // Convert the signature buffer to a hexadecimal string
    const signatureArray = Array.from(new Uint8Array(signatureBuffer));
    const signatureHex = signatureArray
      .map((byte) => byte.toString(16).padStart(2, "0"))
      .join("");
    return btoa(signatureHex);
  } catch (error) {
    console.error("Error calculating HMAC:", error);
    return null;
  }
}

//Function to create a SHA-256 digest for a given message
function createDigest(message) {
  return new Promise((resolve) => {
    resolve(createDigestHelper(message));
  });
}
async function createDigestHelper(message) {
  var buffer = new TextEncoder("utf-8").encode(message);
  return await crypto.subtle.digest("SHA-256", buffer).then(function (hash) {
    const digestArray = Array.from(new Uint8Array(hash));
    const digestHex = digestArray
      .map((byte) => byte.toString(16).padStart(2, "0"))
      .join("");
    return btoa(digestHex);
  });
}

// Generates a signature header using HMAC for all the headers (including the body digest)
function generateHttpHashHeaders(path, method, messageBody) {
  return new Promise((resolve) => {
    createDigest(messageBody).then((response) => {
      let digest = response;
      let requestTarget = `${method.toLowerCase()} ${path}`;
      let headers = {
        Digest: `SHA-256=${digest}`,
        "Date-Time": new Date().toUTCString(),
        "Host-Name": "localhost",
        "Request-Target": requestTarget,
      };

      var signatureParams = "";
      for (const [key, value] of Object.entries(headers)) {
        signatureParams += `${key}: ${value},`;
        if (ENABLELOG == true) {
          console.log(key + ":" + value);
        }
      }
      if (ENABLELOG == true) {
        console.log(signatureParams);
      }
      generateSignatureFromParams(signatureParams, SHAREDSECRET).then(
        (response) => {
          let signature = response;
          let sigend_headers = Object.keys(headers);
          let signatureHeader = `Signature: algorithm="HMAC-SHA256",headers="${sigend_headers}",signature="${signature}"`;
          // Add signature to header
          headers["Signature"] = signatureHeader;
          if (ENABLELOG == true) {
            console.log("Digest", digest);
            console.log("Signature Params", signatureParams);
            console.log("Generated Signature:", signature);
            console.log("signature Header:", signatureHeader);
            console.log("headers:", headers);
          }
          resolve(headers);
        }
      );
    });
  });
}
