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
      final parts = dateString.split('/');
      if (parts.length == 3) {
        dateTime = DateTime(int.parse(parts[0]), int.parse(parts[1]), int.parse(parts[2]));
      }
    }
    return dateTime;
  }
}
