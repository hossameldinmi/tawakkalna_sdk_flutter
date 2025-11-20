// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class BirthCity extends Equatable {
  final String nameAr;
  final String nameEn;

  const BirthCity({
    required this.nameAr,
    required this.nameEn,
  });

  factory BirthCity.fromJson(Map<String, dynamic> map) {
    return BirthCity(
      nameAr: map['birth_city_ar'] as String,
      nameEn: map['birth_city_en'] as String,
    );
  }

  @override
  List<Object> get props => [nameAr, nameEn];
}
