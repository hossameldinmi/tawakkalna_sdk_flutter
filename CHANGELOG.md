# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.0.1-alpha.1] - 2025-11-19

### Added

#### Core Features
- Initial release of Tawakkalna SDK for Flutter
- Support for V1 API with 50+ methods covering:
  - Personal information (ID, name, gender, birth date, nationality, contact)
  - Documents (passports, ID expiry, document numbers, Iqama)
  - Health data (blood type, health status, disability information)
  - Family & sponsors with filtering capabilities
  - Vehicles and traffic violations (paid/unpaid)
  - Location services (GPS and national addresses)
  - Education & career information
  - Gallery, camera, and file management
  - Permissions management (location, camera, gallery, notifications)
  - Authentication (biometric)
  - QR/Barcode scanner
  - Device information
- Support for V2 API with 5 methods:
  - Token generation
  - User full name (bilingual)
  - User nationality (bilingual with ISO code)
  - Family members (with filtering)
  - Sponsors (with filtering)

#### Development Tools
- Mock/Demo implementation with realistic Saudi Arabian test data
- Built-in logger with UI integration and memory management
- Comprehensive example app with 50+ interactive API demos
- Type-safe Dart models for all data structures
- Strongly-typed enums for gender, user types, blood types, etc.
- JavaScript interop for Flutter Web (primary target platform)
- Mock and production JavaScript bridge files

#### Platform Support
- Web (primary target for Tawakkalna mini apps)
- Android, iOS (for testing with mock data)
- macOS, Windows, Linux (for development/testing)

#### Documentation
- Comprehensive README with API examples
- Developer guide with best practices
- Troubleshooting section
- Links to official Tawakkalna developer documentation
- Complete API methods checklist with implementation status

#### Example App
- Interactive demo with 50+ API examples
- Organized sections matching README API Methods Checklist structure
- Real-time results display with error handling
- Integrated logger with statistics and filtering

### Notes
- This is an **unofficial** SDK maintained by individual contributors
- Real data access only available when running inside the official Tawakkalna mobile app
- Designed for building mini apps (HTML/JS) using Flutter Web
- All platforms support mock data for development and testing

[0.0.1-alpha.1]: https://github.com/hossameldinmi/tawakkalna_sdk_flutter/releases/tag/v0.0.1-alpha.1

