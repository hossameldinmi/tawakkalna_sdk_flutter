import 'package:equatable/equatable.dart';

/// Represents a bilingual full name with Arabic and English versions.
///
/// This model is used throughout the SDK to represent names in both
/// Arabic and English, supporting the bilingual nature of Saudi Arabian
/// government services.
///
/// Example:
/// ```dart
/// final name = FullName(
///   ar: 'محمد أحمد',
///   en: 'Mohammed Ahmed',
/// );
/// ```
class FullName extends Equatable {
  /// The full name in Arabic
  final String ar;

  /// The full name in English
  final String en;

  /// Creates a new FullName instance.
  ///
  /// Both [ar] and [en] are required to ensure bilingual support.
  const FullName({
    required this.ar,
    required this.en,
  });

  /// Creates a FullName from a JSON map.
  ///
  /// Expects the JSON to have 'full_name_ar' and 'full_name_en' keys.
  factory FullName.fromJson(Map<String, dynamic> json) => FullName(
        ar: json['full_name_ar'] as String,
        en: json['full_name_en'] as String,
      );

  @override
  List<Object?> get props => [ar, en];
}
