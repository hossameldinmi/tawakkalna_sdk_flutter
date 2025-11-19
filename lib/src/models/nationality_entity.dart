import 'package:equatable/equatable.dart';

import '../enums/nationality.dart';

/// Represents a person's nationality with bilingual names.
///
/// Contains the nationality enum value and both Arabic and English names.
///
/// Example:
/// ```dart
/// final nationality = await twk.getUserNationality();
/// if (nationality != null) {
///   print('Nationality: ${nationality.nameEn} / ${nationality.nameAr}');
/// }
/// ```
class NationalityEnity extends Equatable {
  /// The nationality enum value
  final Nationality nationality;

  /// Nationality name in Arabic
  final String nameAr;

  /// Nationality name in English
  final String nameEn;

  /// Creates a new NationalityEntity instance.
  const NationalityEnity({required this.nationality, required this.nameAr, required this.nameEn});

  factory NationalityEnity.fromJson(Map<String, dynamic> json) {
    return NationalityEnity(
      nationality: Nationality.fromKey(json['nationality_code'])!,
      nameAr: json['nationality_name_ar'] as String,
      nameEn: json['nationality_name_en'] as String,
    );
  }

  @override
  List<Object?> get props => [nationality, nameAr, nameEn];
}
