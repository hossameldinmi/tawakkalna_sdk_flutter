class FullName {
  final String ar;
  final String en;

  FullName({
    required this.ar,
    required this.en,
  });

  factory FullName.fromJson(Map<String, dynamic> json) => FullName(
        ar: json['full_name_ar'] as String,
        en: json['full_name_en'] as String,
      );
}
