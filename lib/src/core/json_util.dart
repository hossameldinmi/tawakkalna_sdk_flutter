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
    try {
      return DateTime.tryParse(dateString);
    } catch (_) {
      final parts = dateString.split('/');
      if (parts.length == 3) {
        return DateTime(int.parse(parts[0]), int.parse(parts[1]), int.parse(parts[2]));
      }
    }
    return null;
  }
}
