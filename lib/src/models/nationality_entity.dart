import 'package:equatable/equatable.dart';

import '../enums/nationality.dart';

class NationalityEnity extends Equatable {
  final Nationality nationality;
  final String nameAr;
  final String nameEn;

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
