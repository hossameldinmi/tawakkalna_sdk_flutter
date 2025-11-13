# tawakkalna_sdk_flutter

A Flutter plugin for integrating with the Tawakkalna SDK, providing access to user data and services through both V1 and V2 APIs.

## Features

- 🔐 **V2 API Support** - Modern API with structured data models
- 📱 **V1 API Support** - Comprehensive user data access
- 🧪 **Mock Implementation** - Built-in demo data for testing
- 🔒 **Type-Safe** - Full Dart type safety with enums and models
- 📝 **Well Documented** - Complete API documentation

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  tawakkalna_sdk_flutter: ^1.0.0
```

## Quick Start

```dart
import 'package:tawakkalna_sdk_flutter/twk.dart';

// Initialize SDK (uses demo implementation by default)
final twk = Twk();

// V2 API - Get user's full name
final fullName = await twk.v2.getUserFullName();
print('Name: ${fullName.en} / ${fullName.ar}');

// V1 API - Get user info
final userId = await twk.v1.getUserId();
final userType = await twk.v1.getUserType();
print('User ID: $userId, Type: $userType');
```

## Example App

A complete example demonstrating all V1 and V2 methods is available in the `/example` directory.

Run it with:
```bash
cd example
flutter run
```

The example app features:
- Single scrollable screen with all API methods
- Expandable cards showing detailed results
- Mock data for easy testing
- Clean Material Design 3 UI

See [example/EXAMPLE_GUIDE.md](example/EXAMPLE_GUIDE.md) for detailed documentation.

## API Overview

### V2 API (Modern)

```dart
// Authentication
final token = await twk.v2.generateToken();

// User Information
final fullName = await twk.v2.getUserFullName();
final nationality = await twk.v2.getUserNationality();

// Family & Sponsors
final familyMembers = await twk.v2.getUserFamilyMembers();
final filteredMembers = await twk.v2.getUserFamilyMembers(
  minAge: 18,
  maxAge: 30,
  gender: Gender.female,
);
final sponsors = await twk.v2.getUserSponsors();
```

### V1 API (Comprehensive)

```dart
// Personal Information
final id = await twk.v1.getUserId();
final name = await twk.v1.getUserFullName();
final gender = await twk.v1.getUserGender();
final birthDate = await twk.v1.getUserBirthDate();
final mobile = await twk.v1.getUserMobileNumber();
final email = await twk.v1.getUserEmail();

// Location & Address
final location = await twk.v1.getUserLocation();
final addresses = await twk.v1.getUserNationalAddress();

// Documents & IDs
final passports = await twk.v1.getUserPassports();
final idExpiry = await twk.v1.getUserIdExpiryDate();
final docNumber = await twk.v1.getUserDocumentNumber();
final iqamaType = await twk.v1.getUserIqamaType();

// Vehicles & Violations
final vehicles = await twk.v1.getUserVehicles();
final unpaidViolations = await twk.v1.getUserUnPaidViolations();
final paidViolations = await twk.v1.getUserPaidViolations();

// Health & Personal Details
final bloodType = await twk.v1.getUserBloodType();
final healthStatus = await twk.v1.getUserHealthStatus();
final maritalStatus = await twk.v1.getUserMaritalStatus();

// Education & Career
final degree = await twk.v1.getUserDegreeType();
final occupation = await twk.v1.getUserOccupation();

// Device Information
final deviceInfo = await twk.v1.getDeviceInfo();
```

## Models & Enums

The SDK includes strongly-typed models and enums:

### Models
- `FullName` - Bilingual name (Arabic/English)
- `Nationality` - Nationality with ISO code
- `FamilyMember` - Family member details
- `Sponsor` - Sponsor information
- `Vehicle` - Vehicle details
- `Violation` - Traffic violation
- `Passport` - Passport information
- `Location` - GPS coordinates
- `NationalAddress` - Address details
- `DeviceInfo` - Device capabilities

### Enums
- `Gender` - Male, Female
- `UserType` - Citizen, Resident, Visitor, etc.
- `BloodType` - Blood types
- `IqamaType` - Iqama categories
- `Relation` - Family relations

## Testing

The SDK includes comprehensive unit tests:

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/twk_helper_v1_impl_test.dart
flutter test test/twk_helper_v2_impl_test.dart
```

## Mock/Demo Implementation

The SDK includes mock implementations for testing without actual Tawakkalna integration:

```dart
// Automatic (default)
final twk = Twk();

// Explicit
final twk = Twk(
  v1Api: TwkApiV1DemoJsonImpl(),
  v2Api: TwkApiV2DemoJsonImpl(),
);
```

Mock data is loaded from `assets/mock_profile1.0.2.json`.

## Custom Implementation

To use your own implementation:

```dart
class MyTwkApiV1 extends TwkApiV1 {
  @override
  Future<String> getUserId() async {
    // Your implementation
  }
  // ... implement other methods
}

final twk = Twk(
  v1Api: MyTwkApiV1(),
  v2Api: MyTwkApiV2(),
);
```

## Platform Support

- ✅ Android
- ✅ iOS  
- ✅ Web (with JS interop)
- ✅ macOS
- ✅ Windows
- ✅ Linux

## Documentation

- [Example App Guide](example/EXAMPLE_GUIDE.md)
- [API Reference](https://pub.dev/documentation/tawakkalna_sdk_flutter/latest/)
- [Changelog](CHANGELOG.md)

## Contributing

Contributions are welcome! Please read our contributing guidelines before submitting PRs.

## License

See [LICENSE](LICENSE) file for details.
