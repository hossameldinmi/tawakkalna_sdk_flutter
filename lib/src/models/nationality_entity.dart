import '../enums/nationality.dart';

class NationalityEnity {
  final Nationality nationality;
  final String nameAr;
  final String nameEn;

  NationalityEnity({required this.nationality, required this.nameAr, required this.nameEn});

  factory NationalityEnity.fromJson(Map<String, dynamic> json) {
    return NationalityEnity(
      nationality: Nationality.fromKey(json['nationality_code'])!,
      nameAr: json['nationality_name_ar'] as String,
      nameEn: json['nationality_name_en'] as String,
    );
  }
}
