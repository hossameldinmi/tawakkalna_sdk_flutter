import '../enums/nationality.dart' as nat_enum;

class Nationality {
  final nat_enum.Nationality nationality;
  final String nameAr;
  final String nameEn;

  Nationality({required this.nationality, required this.nameAr, required this.nameEn});

  factory Nationality.fromJson(Map<String, dynamic> json) {
    return Nationality(
      nationality: nat_enum.Nationality.fromKey(json['nationality_code'])!,
      nameAr: json['nationality_name_ar'] as String,
      nameEn: json['nationality_name_en'] as String,
    );
  }
}
