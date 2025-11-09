enum Nationality {
  sa(0, 'SA'),
  ae(1, 'AE');

  const Nationality(this.key, this.isoCode);
  final int key;
  final String isoCode;

  static Nationality? fromIsoCode(String isoCode) {
    for (var nationality in Nationality.values) {
      if (nationality.isoCode.toLowerCase() == isoCode.toLowerCase()) {
        return nationality;
      }
    }
    return null;
  }
}
