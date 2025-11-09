import 'package:tawakkalna_sdk_flutter/src/enums/gender.dart';
import 'package:tawakkalna_sdk_flutter/src/models/family_member.dart';
import 'package:tawakkalna_sdk_flutter/src/models/full_name.dart';
import 'package:tawakkalna_sdk_flutter/src/models/nationality.dart';
import 'package:tawakkalna_sdk_flutter/src/models/sponsor.dart';

/// Tawakkalna SDK Helper for V2 API
///
/// This class provides access to all V2 endpoints of the Tawakkalna SDK.
/// Most methods correspond to the JavaScript window.TWK.V2.* functions.
abstract class TwkHelperV2 {
  // ==================== Authentication Methods ====================

  /// Generate authentication token (V2)
  /// Corresponds to: window.TWK.V2.generateToken()
  Future<String> generateToken();

  // ==================== User Data Methods ====================

  /// Get user's full name (Arabic and English) - V2 version
  /// Corresponds to: window.TWK.V2.getUserFullName()
  Future<FullName> getUserFullName();

  /// Get user's family members with optional filters - V2 version
  /// Corresponds to: window.TWK.V2.getUserFamilyMembers(minage, maxage, gender)
  Future<List<FamilyMember>> getUserFamilyMembers({
    int? minAge,
    int? maxAge,
    Gender? gender,
  });

  /// Get user's sponsors with optional filters - V2 version
  /// Corresponds to: window.TWK.V2.getUserSponsors(minage, maxage, gender)
  Future<List<Sponsor>> getUserSponsors({
    int? minAge,
    int? maxAge,
    Gender? gender,
  });

  /// Get user's nationality name - V2 version
  /// Corresponds to: window.TWK.V2.getUserNationality()
  Future<Nationality?> getUserNationality();
}
