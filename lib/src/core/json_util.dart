class JsonUtil {
  static Iterable<T>? deserializeList<T>(List json, T Function(int) fromValue) {
    if (json.isNotEmpty) {
      return json.map((item) => fromValue(item as int));
    }
    return null;
  }

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
