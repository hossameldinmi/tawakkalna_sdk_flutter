<h1 align="center">
  Tawakkalna - توكلنا
  
  SDK for Flutter
</h1>

<p align="center">
   <a href="https://github.com/hossameldinmi/tawakkalna_sdk_flutter/actions/workflows/build.yml">
    <img src="https://github.com/hossameldinmi/tawakkalna_sdk_flutter/actions/workflows/build.yml/badge.svg?branch=main" alt="Github action">
  </a>
  <a href="https://codecov.io/github/hossameldinmi/tawakkalna_sdk_flutter">
    <img src="https://codecov.io/github/hossameldinmi/tawakkalna_sdk_flutter/graph/badge.svg?token=JzTIIzoQOq" alt="Code Coverage">
  </a>
  <a href="https://pub.dev/packages/tawakkalna_sdk_flutter">
    <img alt="Pub Package" src="https://img.shields.io/pub/v/tawakkalna_sdk_flutter">
  </a>
   <a href="https://pub.dev/packages/tawakkalna_sdk_flutter">
    <img alt="Pub Points" src="https://img.shields.io/pub/points/tawakkalna_sdk_flutter">
  </a>
  <br/>
  <a href="https://opensource.org/licenses/MIT">
    <img alt="MIT License" src="https://img.shields.io/badge/License-MIT-blue.svg">
  </a>
  <img src="https://img.shields.io/badge/platform-web-blue" alt="Platforms">
</p>

---

> **⚠️ Disclaimer**: This is an **unofficial** SDK and is **not affiliated with or endorsed by** the official Tawakkalna team or the Saudi government. This library is currently maintained by individual contributors as an open-source community project.

> **🧪 Testing Notice**: Most API integrations in this SDK have been tested using the **Tawakkalna Developer Test Utility app**. While the APIs work correctly in the test environment, developers should verify all functionality in the **production Tawakkalna app** before releasing their mini apps to ensure complete compatibility and proper data handling.

A comprehensive Flutter SDK for integrating with **Tawakkalna**, Saudi Arabia's super app that unifies government services in one platform. Tawakkalna organizes services, information, documents, and posts to make them easier to use and improve the quality of life in Saudi Arabia in alignment with **Vision 2030** goals.

## 🇸🇦 About Tawakkalna

Tawakkalna is the official Saudi Arabian super app that provides citizens, residents, and visitors with:

- **Unified Government Services** - Access to multiple government services in one place
- **Digital Identity** - Secure digital ID and document management
- **Health Services** - COVID-19 status, vaccination records, and health information
- **Personal Data** - Centralized access to personal, family, and vehicle information
- **Document Management** - Passports, IDs, licenses, and official documents
- **Smart Integration** - Seamless connection between government entities

### Mini Apps Platform

Tawakkalna operates as a **super app platform** that hosts mini applications from various service providers. Developers can create mini apps (HTML/JS implementations) that run exclusively within the Tawakkalna app environment. These mini apps are distributed through Tawakkalna's portal store and have access to user data and services through the platform's JavaScript SDK.

### About This SDK

This Flutter SDK provides a **web-to-native bridge** that allows Flutter developers to:
- Build mini apps using Flutter Web that compile to HTML/JS
- Access Tawakkalna's JavaScript APIs through Dart interop
- Test and develop with mock data before deploying to the Tawakkalna platform
- Use strongly-typed Dart models instead of raw JavaScript objects

This SDK enables Flutter developers to integrate Tawakkalna's powerful features into their mini applications, providing users with secure, convenient access to their government data and services.

## 📸 Screenshots

<div align="center" style="overflow-x: auto; white-space: nowrap;">
  <img src="https://github.com/hossameldinmi/tawakkalna_sdk_flutter/raw/main/doc/screenshot-1.png" height="350" width:  alt="Example App - iOS Mobile View" style="display: inline-block; vertical-align: top;">
  <img src="https://github.com/hossameldinmi/tawakkalna_sdk_flutter/raw/main/doc/screenshot-2.png" height="350" alt="Example App - Web Landscape" style="display: inline-block; vertical-align: top;">
  <img src="https://github.com/hossameldinmi/tawakkalna_sdk_flutter/raw/main/doc/screenshot-3.png" height="350" alt="Example App - Logger View" style="display: inline-block; vertical-align: top;">
</div>

## ✨ Features

### Core Capabilities
- 🔐 **Dual API Support** - Both V1 (comprehensive) and V2 (modern) APIs
- 👤 **User Information** - Full name, ID, gender, birth date, nationality, contact details
- 📄 **Document Access** - Passports, IDs, Iqama, expiry dates, document numbers
- 🏥 **Health Data** - Blood type, health status, disability information
- 👨‍👩‍👧‍👦 **Family & Sponsors** - Family members and sponsor details with filtering
- 🚗 **Vehicles & Violations** - Vehicle information, paid/unpaid traffic violations
- 📍 **Location Services** - GPS location and national address details
- 🎓 **Education & Career** - Degree type and occupation information
- 📸 **Media Access** - Gallery, camera, and file management
- 🔒 **Permissions** - Location, camera, storage, and notification permissions
- 📱 **Device Info** - Device capabilities and information
- 🔍 **Scanner Integration** - QR/Barcode scanning capabilities

### Developer Experience
- 🧪 **Mock Implementation** - Built-in demo data with realistic JSON fixtures
- 🔒 **Type-Safe** - Full Dart type safety with strongly-typed models and enums
- 📝 **Well Documented** - Comprehensive API documentation and examples
- 🎨 **Example App** - Complete demo with 50+ interactive API examples
- 🪵 **Built-in Logger** - Debug logging with UI viewer and memory management
- ✅ **Tested** - Unit tests for all implementations
- 🌐 **Web Support** - JavaScript interop for web platform

## 📦 Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  tawakkalna_sdk_flutter: ^0.0.4-alpha.4
```

Then run:

```bash
flutter pub get
```

### Web Platform Setup

For **Flutter Web** projects, you **must** include the appropriate JavaScript bridge file in your `web/index.html`:

#### For Development/Testing (Mock Data)

Add this script tag to your `web/index.html` before the closing `</body>` tag:

```html
<!-- For development and testing with mock data -->
<script src="assets/packages/tawakkalna_sdk_flutter/assets/web/twkhelper_mock.js"></script>
```

#### For Production (Tawakkalna App Deployment)

When deploying your mini app to the Tawakkalna platform, use the production JavaScript file:

```html
<!-- For production deployment to Tawakkalna app -->
<script src="assets/packages/tawakkalna_sdk_flutter/assets/web/twkhelper.js"></script>
```

> **Important**: Choose the correct JavaScript file based on your environment:
> - `twkhelper_mock.js` - Development/testing with mock data
> - `twkhelper.js` - Production deployment to Tawakkalna app
>
> The SDK will not work on web without the appropriate JavaScript bridge file.

> **Production Build Optimization**: When building for production (`flutter build web --release`), remove unnecessary JavaScript files and mock data from your build output to reduce bundle size:
> ```bash
> # After building, remove the unused mock files
> rm -f build/web/assets/packages/tawakkalna_sdk_flutter/assets/web/twkhelper_mock.js
> rm -f build/web/assets/assets/mock_profile1.0.2.json
> ```
> Similarly, if you used mock for development, remove `twkhelper.js` from development builds to avoid confusion.

## 🚀 Quick Start

```dart
import 'package:tawakkalna_sdk_flutter/tawakkalna_sdk_flutter.dart';

void main() async {
  // Initialize SDK (uses demo implementation by default for testing)
  final twk = TwkHelper();

  // Get user information
  final fullName = await twk.getUserFullName();
  print('Name: ${fullName.en} / ${fullName.ar}');
  
  final nationality = await twk.getUserNationality();
  print('Nationality: ${nationality.en} (${nationality.isoCode})');

  // Get user ID and details
  final userId = await twk.getUserId();
  final userType = await twk.getUserType();
  final birthDate = await twk.getUserBirthDate();
  print('User: $userId, Type: $userType, Born: $birthDate');
  
  // Family members with filtering
  final adults = await twk.getUserFamilyMembers(
    minAge: 18,
    gender: Gender.male,
  );
  print('Adult male family members: ${adults.length}');
  
  // Vehicle information
  final vehicles = await twk.getUserVehicles();
  print('Registered vehicles: ${vehicles.length}');
}
```

## 📱 Example App

A comprehensive example app demonstrating all SDK capabilities is available in the `/example` directory with **50+ interactive API examples**.

### Running the Example

```bash
cd example
flutter run -d chrome  # For web
flutter run            # For mobile/desktop
```

### Example App Features

- ✅ **Complete API Coverage** - All V1 (45+ methods) and V2 (5 methods) endpoints
- 🎨 **Modern UI** - Material Design 3 with organized sections
- 📊 **Real-time Results** - Live display of API responses with error handling
- 🪵 **Integrated Logger** - View SDK logs with statistics and filtering
- 📸 **Image Preview** - Visual gallery for image/file responses
- 🎯 **Categorized** - Organized into 14 sections:
  - Personal Information (8 methods)
  - Contact & Location (4 methods)
  - Documents & IDs (5 methods)
  - Health Information (4 methods)
  - Education & Career (2 methods)
  - Family & Sponsors (3 methods)
  - Vehicles & Violations (3 methods)
  - Gallery & Camera (6 methods)
  - File Management (2 methods)
  - Permissions (5 methods)
  - Authentication (2 methods)
  - Scanner (1 method)
  - Device Info (1 method)
  - V2 API (5 methods)

See [example/EXAMPLE_GUIDE.md](example/EXAMPLE_GUIDE.md) for detailed documentation.

## 📚 API Overview

### Structured Data Models

The SDK provides strongly-typed models with bilingual support:

```dart
final twk = TwkHelper();

// Authentication Token
final token = await twk.generateToken();
print('Token: $token');

// User Full Name (Bilingual)
final fullName = await twk.getUserFullName();
print('English: ${fullName.en}');
print('Arabic: ${fullName.ar}');

// Nationality with ISO Code
final nationality = await twk.getUserNationality();
print('${nationality.en} / ${nationality.ar}');
print('ISO Code: ${nationality.isoCode}');

// Family Members (with optional filtering)
final allFamily = await twk.getUserFamilyMembers();
final femaleMembersOver18 = await twk.getUserFamilyMembers(
  minAge: 18,
  gender: Gender.female,
);
final children = await twk.getUserFamilyMembers(
  maxAge: 17,
);

// Sponsors Information
final sponsors = await twk.getUserSponsors();
for (var sponsor in sponsors) {
  print('Sponsor: ${sponsor.name.en}');
}
```

### User Data Access

Extensive access to user data across multiple categories:

#### Personal Information

```dart
final twk = TwkHelper();

// Basic Identity
final id = await twk.getUserId();              // National/Iqama ID
final type = await twk.getUserType();          // Citizen/Resident/Visitor
final name = await twk.getUserFullName();      // Full name
final gender = await twk.getUserGender();      // Male/Female
final birthDate = await twk.getUserBirthDate(); // Birth date
final nationality = await twk.getUserNationality(); // Nationality
final nationalityIso = await twk.getUserNationalityIso(); // ISO code

// Personal Details
final maritalStatus = await twk.getUserMaritalStatus();
final bloodType = await twk.getUserBloodType();
final healthStatus = await twk.getUserHealthStatus();
final disabilityType = await twk.getUserDisabilityType();
```

#### Contact & Location

```dart
// Contact Information
final mobile = await twk.getUserMobileNumber();
final email = await twk.getUserEmail();

// Location Data
final location = await twk.getUserLocation();
print('Lat: ${location.latitude}, Lng: ${location.longitude}');

final addresses = await twk.getUserNationalAddress();
for (var address in addresses) {
  print('${address.buildingNumber}, ${address.street}');
  print('${address.district}, ${address.city} ${address.postalCode}');
}
```

#### Documents & IDs

```dart
final passportResponse = await twk.getUserPassports();
for (var passport in passportResponse.passports) {
  print('Passport: ${passport.number}');
  print('Expires: ${passport.expiryDate}');
}

final idExpiry = await twk.getUserIdExpiryDate();
final docNumber = await twk.getUserDocumentNumber();
final iqamaType = await twk.getUserIqamaType();
```

#### Vehicles & Traffic Violations

```dart
// Vehicle Information
final vehicles = await twk.getUserVehicles();
for (var vehicle in vehicles) {
  print('${vehicle.make} ${vehicle.model} - ${vehicle.plateNumber}');
  print('Year: ${vehicle.year}, Color: ${vehicle.color}');
}

// Traffic Violations
final unpaidViolations = await twk.getUserUnPaidViolations();
final paidViolations = await twk.getUserPaidViolations();
print('Unpaid: ${unpaidViolations.length}, Paid: ${paidViolations.length}');
```

#### Education & Career

```dart
final degree = await twk.getUserDegreeType();
final occupation = await twk.getUserOccupation();
```

#### Family & Sponsors

```dart
// All family members
final family = await twk.getUserFamilyMembers();

// Filtered queries
final adults = await twk.getUserFamilyMembers(minAge: 18);
final females = await twk.getUserFamilyMembers(gender: Gender.female);
final adultMales = await twk.getUserFamilyMembers(
  minAge: 18,
  gender: Gender.male,
);

// Sponsors with filtering
final sponsors = await twk.getUserSponsors();
final activeSponsors = await twk.getUserSponsors(minAge: 25, maxAge: 65);
```

#### Gallery, Camera & Files

```dart
// Gallery Access
final singleImage = await twk.getGallerySingle();
final multipleImages = await twk.getGalleryMulti();
final singleVideo = await twk.getGallerySingleVideo();
final multipleVideos = await twk.getGalleryMultiVideo();

// Camera
final photo = await twk.getCameraPhoto();
final video = await twk.getCameraVideo();

// File Management
final fileBase64 = await twk.getFileBase64();
final fileId = await twk.getFileId();
```

#### Permissions

```dart
// Request Permissions
await twk.askUserLocationPermission();
await twk.askCameraPermission();
await twk.askGalleryPermission();
await twk.askPushNotificationPermission();
await twk.askUserPreciseLocationPermission();
```

#### Authentication & Security

```dart
final authenticated = await twk.authenticateBiometric();
print('User authenticated: $authenticated');
```

#### Scanner & Device

```dart
// QR/Barcode Scanner
final scanResult = await twk.scanCode();
print('Scanned: $scanResult');

// Device Information
final deviceInfo = await twk.getDeviceInfo();
print('Platform: ${deviceInfo?.platform}');
print('Version: ${deviceInfo?.version}');
```

## ✅ Testing

The SDK includes comprehensive unit tests for all implementations:

### Run All Tests

```bash
flutter test
```

### Run Specific Test File

```bash
# Run the main test suite
flutter test test/twk_test.dart
```

### Test Coverage

```bash
# Generate coverage report
flutter test --coverage

# View coverage (requires lcov)
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

### What's Tested

- ✅ All V1 API methods (45+ methods)
- ✅ All V2 API methods (5 methods)
- ✅ Mock data parsing and serialization
- ✅ Type safety and model validation
- ✅ Edge cases and error handling
- ✅ Enum conversions
- ✅ File handling and binary data

### Example Test

```dart
test('getUserFullName returns correct bilingual name', () async {
  final api = TwkApiV2DemoJsonImpl();
  final fullName = await api.getUserFullName();
  
  expect(fullName.en, isNotEmpty);
  expect(fullName.ar, isNotEmpty);
  expect(fullName, isA<FullName>());
});
```

## 🧪 Mock/Demo Implementation

The SDK includes a comprehensive mock implementation for testing and development without actual Tawakkalna integration:

### Automatic (Default)

```dart
// Automatically uses mock implementation
final twk = TwkHelper();
```

### Explicit Configuration

```dart
import 'package:tawakkalna_sdk_flutter/tawakkalna_sdk_flutter.dart';

// Explicitly set mock implementations
final twk = TwkHelper(
  v1Api: TwkApiV1DemoJsonImpl(),
  v2Api: TwkApiV2DemoJsonImpl(),
);
```

### Mock Data Source

Mock data is loaded from `assets/mock_profile1.0.2.json` which contains:
- Realistic user profiles with Saudi Arabian data
- Multiple family members with diverse demographics
- Vehicle registrations and traffic violations
- Passport and document information
- National addresses in Saudi format
- Health and education data

### Benefits

- ✅ **No Authentication Required** - Test without real credentials
- 🚦 **Predictable Data** - Consistent responses for testing
- 🚀 **Fast Development** - No network latency
- 📝 **Documentation** - See example data structures
- 🧵 **Edge Cases** - Test various data scenarios

## 🔧 Custom Implementation

To integrate with actual Tawakkalna services or create your own data source:

```dart
import 'package:tawakkalna_sdk_flutter/tawakkalna_sdk_flutter.dart';

// Implement V1 API
class MyTwkApiV1 extends TwkApiV1 {
  @override
  Future<Map<String, dynamic>> getUserId() async {
    // Your implementation - e.g., REST API call
    final response = await http.get('https://api.example.com/user/id');
    return jsonDecode(response.body);
  }
  
  @override
  Future<Map<String, dynamic>> getUserFullName() async {
    // Your implementation
    return {'en': 'John Doe', 'ar': 'جون دو'};
  }
  
  // Implement all other required methods...
}

// Implement V2 API
class MyTwkApiV2 extends TwkApiV2 {
  @override
  Future<FullName> getUserFullName() async {
    // Your implementation
    return FullName(en: 'John Doe', ar: 'جون دو');
  }
  
  // Implement all other required methods...
}

// Use custom implementation
void main() {
  final twk = TwkHelper(
    v1Api: MyTwkApiV1(),
    v2Api: MyTwkApiV2(),
  );
}
```

## 🪵 Debugging & Logging

The SDK includes a built-in logger for debugging and monitoring:

### Enable Logging

```dart
import 'package:tawakkalna_sdk_flutter/tawakkalna_sdk_flutter.dart';

void main() {
  // Enable logging
  TwkLogger.instance.setEnabled(true);
  
  // Listen to log events
  TwkLogger.instance.addListener(() {
    final logs = TwkLogger.instance.logs;
    print('Total logs: ${logs.length}');
  });
  
  // Your app code...
}
```

### Logger Features

- 📋 **Automatic Logging** - All API calls logged with request/response data
- 📈 **Statistics** - Track total logs, errors, warnings, and info messages
- 🔍 **Filtering** - Filter logs by level (error, warning, info)
- 💾 **Memory Management** - Automatic cleanup at 1000 log limit
- 🔇 **Toggle On/Off** - Enable/disable logging at runtime
- 📱 **UI Integration** - Built-in log viewer in example app

### Log Viewer (Example App)

The example app includes an integrated log viewer:
- Real-time log display with color coding
- Statistics dashboard (total, errors, warnings, info)
- Search and filter capabilities
- Copy logs to clipboard
- Clear logs functionality

```dart
// In your UI
ElevatedButton(
  onPressed: () {
    // Disable logging to prevent memory issues in production
    TwkLogger.instance.setEnabled(false);
  },
  child: Text('Disable Logs'),
);
```

### Disable Logging in Production

```dart
void main() {
  // Disable in production builds
  if (kReleaseMode) {
    TwkLogger.instance.setEnabled(false);
  }
}
```

## 📱 Platform Support

| Platform  | Support | Real Data Support | Implementation | Use Case |
| --------- | ------- | ----------------- | -------------- | -------- |
| 🌐 Web     | ✅ Full  | ❌ Mock Only | JS Interop Mock/Mock | Development/Testing |
| 🌐 Web(Tawakkalna App)     | ✅ Full  | ✅ (Tawakkalna App Only) | SDK/Mock | **Primary Target** |
| 🤖 Android | ✅ Full  |❌ Mock Only  | Mock | Development/Testing |
| 🍎 iOS     | ✅ Full  | ❌ Mock Only  | Mock | Development/Testing |
| 💻 macOS   | ✅ Full  | ❌ Mock Only      | Mock     | Development/Testing |
| 💻 Windows | ✅ Full  | ❌ Mock Only      | Mock     | Development/Testing |
| 🐧 Linux   | ✅ Full  | ❌ Mock Only      | Mock     | Development/Testing |

> **Important**: This SDK is designed for building **mini apps** that run inside the Tawakkalna super app. Mini apps are HTML/JavaScript applications built with Flutter Web. Real data access is only available when your compiled Flutter Web app runs within the official Tawakkalna mobile app (Android/iOS) through their mini apps platform. Desktop platforms are provided for development and testing with mock data only.

### Web Platform Considerations

For web platform, the SDK uses JavaScript interop. Choose the appropriate JavaScript file based on your use case:

#### For Development/Testing (Mock Data)

```html
<!-- Add to your index.html for development with mock data -->
<script src="assets/packages/tawakkalna_sdk_flutter/assets/web/twkhelper_mock.js"></script>
```

#### For Production (Tawakkalna App)

```html
<!-- Add to your index.html for production deployment to Tawakkalna -->
<script src="assets/packages/tawakkalna_sdk_flutter/assets/web/twkhelper.js"></script>
```

The JavaScript bridge provides:
- **Mock Mode** (`twkhelper_mock.js`): Mock data for local testing and development
- **Production Mode** (`twkhelper.js`): Real data access when running in Tawakkalna app
- Type-safe communication between Dart and JavaScript
- Support for all SDK features on web

### Minimum Requirements

- **Dart SDK**: ≥ 3.0.4
- **Flutter SDK**: ≥ 3.3.0
- **Android**: API 21+ (Android 5.0 Lollipop)
- **iOS**: iOS 12.0+
- **Web**: Modern browsers (Chrome, Firefox, Safari, Edge)

## 💡 Best Practices

### 1. Use Mock Implementation for Development

```dart
// Development
final twk = TwkHelper(); // Uses mock by default

// Production
final twk = TwkHelper(
  v1Api: TwkApiV1ProductionImpl(),
  v2Api: TwkApiV2ProductionImpl(),
);
```

### 2. Handle Errors Gracefully

```dart
try {
  final fullName = await twk.getUserFullName();
  print('User: ${fullName.en}');
} catch (e) {
  print('Error fetching user data: $e');
  // Show user-friendly error message
}
```

### 3. Cache Frequently Accessed Data

```dart
class UserService {
  final TwkHelper twk = TwkHelper();
  FullName? _cachedName;
  DateTime? _cacheTime;
  
  Future<FullName> getUserFullName() async {
    // Cache for 5 minutes
    if (_cachedName != null && 
        _cacheTime != null &&
        DateTime.now().difference(_cacheTime!) < Duration(minutes: 5)) {
      return _cachedName!;
    }
    
    _cachedName = await twk.getUserFullName();
    _cacheTime = DateTime.now();
    return _cachedName!;
  }
}
```

### 4. Disable Logging in Production

```dart
import 'package:flutter/foundation.dart';

void main() {
  if (kReleaseMode) {
    TwkLogger.instance.setEnabled(false);
  }
  runApp(MyApp());
}
```

### 5. Use Type-Safe Enums

```dart
// Good - Type safe
final males = await twk.getUserFamilyMembers(
  gender: Gender.male,  // Enum
);

// Avoid - Hardcoded values (not supported)
// Always use the Gender enum for type safety
```

## 🔧 Troubleshooting

### Issue: "No data returned from API"

**Solution**: Ensure you're using the correct implementation:

```dart
// For testing/development
final twk = TwkHelper(); // Uses mock data

// For production
final twk = TwkHelper();
```

### Issue: "Type mismatch errors"

**Solution**: All methods return strongly-typed models:

```dart
// Returns typed FullName model
final FullName name = await twk.getUserFullName();

// Returns int
final int userId = await twk.getUserId();

// Returns list of typed objects
final List<Vehicle> vehicles = await twk.getUserVehicles();
```

### Issue: "Logger consuming too much memory"

**Solution**: Disable logger when not needed:

```dart
TwkLogger.instance.setEnabled(false);
```

### Issue: "Web platform not working"

**Solution**: Ensure you've completed the [Web Platform Setup](#web-platform-setup) by adding the required JavaScript bridge file to your `web/index.html`. The SDK requires either `twkhelper.js` (production) or `twkhelper_mock.js` (development) to be loaded for web platform support.

## 📜 API Reference

Detailed API documentation is available:

### Complete Method List

See the following documentation resources:
- [This SDK's API Documentation](https://pub.dev/documentation/tawakkalna_sdk_flutter/latest/) - Detailed Dart/Flutter method signatures and parameters
- [Official Tawakkalna Developer Documentation](https://partners.tawakkalna.sa/devdocs) - Official developer guide for Tawakkalna mini apps platform

### TwkHelper API Methods Checklist

**Authentication**

| Method | Description | Memory Mock | JS Mock | SDK |
|--------|-------------|:-----------:|:-------:|:---:|
| `generateToken()` | Generate authentication token | ✅ | ✅ | ✅ |
| `authenticateBiometric()` | Authenticate with biometrics | ✅ | ✅ | ✅ |

**Personal Information**

| Method | Description | Memory Mock | JS Mock | SDK |
|--------|-------------|:-----------:|:-------:|:---:|
| `getUserId()` | Get user's national/Iqama ID | ✅ | ✅ | ✅ |
| `getUserType()` | Get user type (citizen/resident/visitor) | ✅ | ✅ | ✅ |
| `getUserFullName()` | Get full name | ✅ | ✅ | ✅ |
| `getUserGender()` | Get user's gender | ✅ | ✅ | ✅ |
| `getUserBirthDate()` | Get user's birth date | ✅ | ✅ | ✅ |
| `getUserBirthCity()` | Get user's birth city | ✅ | ✅ | ✅ |
| `getUserNationality()` | Get nationality | ✅ | ✅ | ✅ |
| `getUserNationalityIso()` | Get nationality ISO code | ✅ | ✅ | ✅ |

**Contact Information**

| Method | Description | Memory Mock | JS Mock | SDK |
|--------|-------------|:-----------:|:-------:|:---:|
| `getUserMobileNumber()` | Get user's mobile number | ✅ | ✅ | ✅ |
| `getUserEmail()` | Get user's email address | ✅ | ✅ | ✅ |
| `getUserLocation()` | Get GPS location | ✅ | ✅ | ✅ |
| `getUserNationalAddress()` | Get national address(es) | ✅ | ✅ | ✅ |

**Documents**

| Method | Description | Memory Mock | JS Mock | SDK |
|--------|-------------|:-----------:|:-------:|:---:|
| `getUserPassports()` | Get passport information | ✅ | ✅ | ✅ |
| `getUserIdExpiryDate()` | Get ID expiry date | ✅ | ✅ | ✅ |
| `getUserDocumentNumber()` | Get document number | ✅ | ✅ | ✅ |
| `getUserIqamaType()` | Get Iqama type | ✅ | ✅ | ✅ |
| `getUserProfilePhoto()` | Get user's profile photo | ⬜ | ⬜ | ⬜ |

**Health & Status**

| Method | Description | Memory Mock | JS Mock | SDK |
|--------|-------------|:-----------:|:-------:|:---:|
| `getUserBloodType()` | Get blood type | ✅ | ✅ | ✅ |
| `getUserHealthStatus()` | Get health status | ✅ | ✅ | ✅ |
| `getUserDisabilityType()` | Get disability type | ✅ | ✅ | ✅ |
| `getUserMaritalStatus()` | Get marital status | ✅ | ✅ | ✅ |

**Education & Career**

| Method | Description | Memory Mock | JS Mock | SDK |
|--------|-------------|:-----------:|:-------:|:---:|
| `getUserDegreeType()` | Get education degree type | ✅ | ✅ | ✅ |
| `getUserOccupation()` | Get occupation | ✅ | ✅ | ✅ |

**Family & Relationships**

| Method | Description | Memory Mock | JS Mock | SDK |
|--------|-------------|:-----------:|:-------:|:---:|
| `getUserFamilyMembers()` | Get family members (with filtering) | ✅ | ✅ | ✅ |
| `getUserSponsors()` | Get sponsors (with filtering) | ✅ | ✅ | ✅ |

**Vehicles & Violations**

| Method | Description | Memory Mock | JS Mock | SDK |
|--------|-------------|:-----------:|:-------:|:---:|
| `getUserVehicles()` | Get registered vehicles | ✅ | ✅ | ✅ |
| `getUserUnPaidViolations()` | Get unpaid traffic violations | ✅ | ✅ | ✅ |
| `getUserPaidViolations()` | Get paid traffic violations | ✅ | ✅ | ✅ |

**Gallery**

| Method | Description | Memory Mock | JS Mock | SDK |
|--------|-------------|:-----------:|:-------:|:---:|
| `getGallerySingle()` | Select single image from gallery | ✅ | ✅ | ❌ |
| `getGalleryMulti()` | Select multiple images from gallery | ✅ | ✅| ❌ |
| `getGallerySingleVideo()` | Select single video from gallery | ⬜ | ⬜ | ⬜ |
| `getGalleryMultiVideo()` | Select multiple videos from gallery | ⬜ | ⬜ | ⬜ |

**Camera**

| Method | Description | Memory Mock | JS Mock | SDK |
|--------|-------------|:-----------:|:-------:|:---:|
| `getCameraPhoto()` | Capture photo with camera | ⬜ | ⬜ | ⬜ |
| `getCameraVideo()` | Record video with camera | ⬜ | ⬜ | ⬜ |

**Files**

| Method | Description | Memory Mock | JS Mock | SDK |
|--------|-------------|:-----------:|:-------:|:---:|
| `getFileBase64()` | Get file as base64 string | ⬜ | ⬜ | ⬜ |
| `getFileId()` | Get file ID | ⬜ | ⬜ | ⬜ |

**Permissions**

| Method | Description | Memory Mock | JS Mock | SDK |
|--------|-------------|:-----------:|:-------:|:---:|
| `askUserLocationPermission()` | Request location permission | ✅ | ✅ | ✅ |
| `askUserPreciseLocationPermission()` | Request precise location permission | ✅ | ✅ | ✅ |
| `askCameraPermission()` | Request camera permission | ✅ | ✅ | ✅ |
| `askGalleryPermission()` | Request gallery permission | ✅ | ✅ | ✅ |
| `askPushNotificationPermission()` | Request notification permission | ✅ | ✅ | ✅ |

**Scanner**

| Method | Description | Memory Mock | JS Mock | SDK |
|--------|-------------|:-----------:|:-------:|:---:|
| `scanCode()` | Scan QR/Barcode | ⬜ | ⬜ | ⬜ |

**Device Info**

| Method | Description | Memory Mock | JS Mock | SDK |
|--------|-------------|:-----------:|:-------:|:---:|
| `getDeviceInfo()` | Get device information | ✅ | ✅ | ✅ |

**Legend:**
- ✅ = Implemented and tested
- ❌ = Error or not working
- ⬜ = Not yet implemented/tested
- **Memory Mock** = In-memory mock implementation (TwkApiV1DemoJsonImpl / TwkApiV2DemoJsonImpl)
- **JS Mock** = JavaScript bridge mock (twkhelper_mock.js)
- **SDK** = Production SDK implementation (twkhelper.js)

## 🛣️ Roadmap

### Planned Features

- [ ] **Test Coverage** - Increase test coverage to be 100%
- [ ] **Integration Testing** - Integration testing on Tawakkalna Developer Test App

### Version History

- **0.0.1-alpha.1** - Initial release with V1 and V2 APIs, bug fixes, and comprehensive documentation

## 🤝 Contributing

Contributions are welcome! We appreciate:

### How to Contribute

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/amazing-feature`
3. **Make your changes**
4. **Add tests** for new functionality
5. **Run tests**: `flutter test`
6. **Commit your changes**: `git commit -m 'Add amazing feature'`
7. **Push to branch**: `git push origin feature/amazing-feature`
8. **Open a Pull Request**

### Contribution Guidelines

- Follow existing code style and conventions
- Add tests for new features
- Update documentation (README, code comments)
- Ensure all tests pass
- Keep commits atomic and well-described

### Areas for Contribution

- 🐛 Bug fixes
- ✨ New features
- 📝 Documentation improvements
- 🎨 UI/UX enhancements
- ⚡ Performance optimizations
- 🌐 Translations
- ✅ Test coverage

## 💬 Support & Community

- **Issues**: [GitHub Issues](https://github.com/hossameldinmi/tawakkalna_sdk_flutter/issues)
- **Discussions**: [GitHub Discussions](https://github.com/hossameldinmi/tawakkalna_sdk_flutter/discussions)
- **Official Tawakkalna Docs**: [Developer Documentation](https://partners.tawakkalna.sa/devdocs)
- **Email**: [Contact Maintainer](mailto:hossameldinmi@example.com)

## ⚖️ License

This project is licensed under the terms specified in the [LICENSE](LICENSE) file.

## 🚀 About Vision 2030

This SDK supports Saudi Arabia's Vision 2030 initiative by:

- 🏛️ **Digital Government** - Enabling seamless digital services
- 📱 **Smart Solutions** - Mobile-first approach to government services
- 🔒 **Data Security** - Secure access to personal information
- 🌐 **Accessibility** - Making services available to all residents
- 🚀 **Innovation** - Fostering digital transformation

Learn more about [Saudi Vision 2030](https://www.vision2030.gov.sa/).

---

<p align="center">Made with ❤️ for Saudi Arabia's Digital Future</p>
<p align="center">
  <a href="https://github.com/hossameldinmi/tawakkalna_sdk_flutter">GitHub</a> •
  <a href="https://pub.dev/packages/tawakkalna_sdk_flutter">pub.dev</a> •
  <a href="https://github.com/hossameldinmi/tawakkalna_sdk_flutter/issues">Report Bug</a> •
  <a href="https://github.com/hossameldinmi/tawakkalna_sdk_flutter/issues">Request Feature</a>
</p>
