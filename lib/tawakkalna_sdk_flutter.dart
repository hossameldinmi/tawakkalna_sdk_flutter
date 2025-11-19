/// Tawakkalna SDK for Flutter
///
/// A comprehensive Flutter SDK for integrating with Tawakkalna, Saudi Arabia's super app
/// that unifies government services in one platform.
///
/// This SDK provides:
/// - Access to user data (personal info, documents, health, family, vehicles)
/// - Strongly-typed Dart models and enums
/// - Mock implementation for testing
/// - JavaScript interop for Flutter Web
/// - Built-in logging and debugging tools
///
/// Example usage:
/// ```dart
/// import 'package:tawakkalna_sdk_flutter/tawakkalna_sdk_flutter.dart';
///
/// final twk = TwkHelper();
/// final fullName = await twk.getUserFullName();
/// print('Name: ${fullName.en} / ${fullName.ar}');
/// ```
library;

// Enumerations
export 'package:tawakkalna_sdk_flutter/src/enums/blood_type.dart';
export 'package:tawakkalna_sdk_flutter/src/enums/eqama_type.dart';
export 'package:tawakkalna_sdk_flutter/src/enums/gender.dart';
export 'package:tawakkalna_sdk_flutter/src/enums/nationality.dart';
export 'package:tawakkalna_sdk_flutter/src/enums/relation.dart';
export 'package:tawakkalna_sdk_flutter/src/enums/user_type.dart';

// Data Models
export 'package:tawakkalna_sdk_flutter/src/models/family_member.dart';
export 'package:tawakkalna_sdk_flutter/src/models/full_name.dart';
export 'package:tawakkalna_sdk_flutter/src/models/nationality_entity.dart';
export 'package:tawakkalna_sdk_flutter/src/models/sponsor.dart';
export 'package:tawakkalna_sdk_flutter/src/models/twk_file.dart';
export 'package:tawakkalna_sdk_flutter/src/models/user_details.dart';

// API Interfaces
export 'package:tawakkalna_sdk_flutter/src/apis/v1/twk_api_v1.dart';
export 'package:tawakkalna_sdk_flutter/src/apis/v2/twk_api_v2.dart';

// Core Utilities
export 'package:tawakkalna_sdk_flutter/src/core/json_util.dart';
export 'package:tawakkalna_sdk_flutter/src/core/logger.dart';

// Mock Implementations
export 'package:tawakkalna_sdk_flutter/src/apis/v1/twk_api_v1_demo_json_impl.dart';
export 'package:tawakkalna_sdk_flutter/src/apis/v2/twk_api_v2_demo_json_impl.dart';

// Main Helper Class
export 'package:tawakkalna_sdk_flutter/src/twk_helper.dart';
