import 'package:equatable/equatable.dart';

class UserFullName extends Equatable {
  final String nameAr;
  final String nameEn;

  const UserFullName({
    required this.nameAr,
    required this.nameEn,
  });

  factory UserFullName.fromJson(Map<String, dynamic> json) => UserFullName(
        nameAr: json['full_name_ar'] as String,
        nameEn: json['full_name_en'] as String,
      );

  @override
  List<Object?> get props => [nameAr, nameEn];
}
