import 'package:equatable/equatable.dart';

class FullName extends Equatable {
  final String ar;
  final String en;

  const FullName({
    required this.ar,
    required this.en,
  });

  factory FullName.fromJson(Map<String, dynamic> json) => FullName(
        ar: json['full_name_ar'] as String,
        en: json['full_name_en'] as String,
      );

  @override
  List<Object?> get props => [ar, en];
}
