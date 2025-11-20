/// Tawakkalna SDK Helper for V2 API
///
/// This class provides access to all V2 endpoints of the Tawakkalna SDK.
/// Most methods correspond to the JavaScript window.TWK.V2.* functions.
abstract class TwkApiV2 {
  const TwkApiV2._();

  // ==================== Authentication Methods ====================

  /// Generate authentication token (V2)
  /// Corresponds to: window.TWK.V2.generateToken()
  Future<Map<String, dynamic>> generateToken();

  // ==================== User Data Methods ====================

  /// Get user's full name (Arabic and English) - V2 version
  /// Corresponds to: window.TWK.V2.getUserFullName()
  Future<Map<String, String>> getUserFullName();

  /// Get user's family members with optional filters - V2 version
  /// Corresponds to: window.TWK.V2.getUserFamilyMembers(minage, maxage, gender)
  Future<Map<String, dynamic>> getUserFamilyMembers({
    int? minAge,
    int? maxAge,
    int? gender,
  });

  /// Get user's sponsors with optional filters - V2 version
  /// Corresponds to: window.TWK.V2.getUserSponsors(minage, maxage, gender)
  Future<Map<String, dynamic>> getUserSponsors({
    int? minAge,
    int? maxAge,
    int? gender,
  });

  /// Get user's nationality name - V2 version
  /// Corresponds to: window.TWK.V2.getUserNationality()
  Future<Map<String, dynamic>> getUserNationality();
}
