/// Utility class for JSON parsing and data type conversions.
///
/// Provides helper methods for deserializing lists and parsing date strings
/// in various formats commonly used by the Tawakkalna API.
class JsonUtil {
  /// Deserializes a JSON list into a typed iterable.
  ///
  /// Parameters:
  /// - [json]: The JSON list to deserialize
  /// - [fromValue]: Function to convert each item to type T
  ///
  /// Returns:
  /// - An iterable of type T if the list is not empty
  /// - null if the list is empty
  static Iterable<T>? deserializeList<T>(List json, T Function(int) fromValue) {
    if (json.isNotEmpty) {
      return json.map((item) => fromValue(item as int));
    }
    return null;
  }

  /// Parses a date string into a DateTime object.
  ///
  /// Supports multiple date formats:
  /// - ISO 8601 format (yyyy-MM-dd)
  /// - Date with slashes (dd/MM/yyyy or yyyy/MM/dd)
  ///
  /// The method automatically detects the format and parses accordingly.
  ///
  /// Parameters:
  /// - [dateString]: The date string to parse
  ///
  /// Returns:
  /// - A DateTime object if parsing succeeds
  /// - null if the string is null, empty, or cannot be parsed
  static DateTime? parseDateTime(String? dateString) {
    if (dateString == null || dateString.isEmpty) {
      return null;
    }
    late DateTime? dateTime;
    try {
      dateTime = DateTime.parse(dateString);
    } catch (_) {
      bool reversed = false;
      final parts = dateString.split('/');
      if (int.parse(parts[0]) < 1900) {
        reversed = true;
      }
      if (parts.length == 3) {
        final year = int.parse(reversed ? parts[2] : parts[0]);
        final month = int.parse(parts[1]);
        final day = int.parse(reversed ? parts[0] : parts[2]);
        dateTime = DateTime(year, month, day);
      }
    }
    return dateTime;
  }
}
