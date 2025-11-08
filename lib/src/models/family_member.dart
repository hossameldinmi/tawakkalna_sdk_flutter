class FamilyMember {
  final int nationalId;
  final String idExpiryDateHijri;
  final String idExpiryDateGregorian;
  final String nameAr;
  final String nameEn;
  final int gender;
  final String nationality;
  final String relation;
  final String passportNumber;
  final String dateOfBirth;
  final String birthCity;

  FamilyMember({
    required this.nationalId,
    required this.idExpiryDateHijri,
    required this.idExpiryDateGregorian,
    required this.nameAr,
    required this.nameEn,
    required this.gender,
    required this.nationality,
    required this.relation,
    required this.passportNumber,
    required this.dateOfBirth,
    required this.birthCity,
  });

  factory FamilyMember.fromJson(Map<String, dynamic> json) => FamilyMember(
        nationalId: json['national_id'],
        idExpiryDateHijri: json['id_expiry_date_hijri'],
        idExpiryDateGregorian: json['id_expiry_date_gregorian'],
        nameAr: json['name_ar'],
        nameEn: json['name_en'],
        gender: json['gender'],
        nationality: json['details']['nationality'],
        relation: json['details']['relation'],
        passportNumber: json['details']['passport_number'],
        dateOfBirth: json['details']['date_of_birth'],
        birthCity: json['details']['birth_city'],
      );

  bool isRelationShip(List<String> relations) {
    return relations.any((relation) => this.relation.toLowerCase().contains(relation.toLowerCase()));
  }

  String print() {
    return '''
    nameAr: $nameAr
    nameEn: $nameEn
    gender: $gender
    nationality: $nationality
    relation: $relation
    passportNumber: $passportNumber
    dateOfBirth: $dateOfBirth
    birthCity: $birthCity
    nationalId: $nationalId
    idExpiryDateHijri: $idExpiryDateHijri
    idExpiryDateGregorian: $idExpiryDateGregorian
    ''';
  }
}
