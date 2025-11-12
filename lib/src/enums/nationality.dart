enum Nationality {
  sa(113, 'SA'),
  ae(1, 'AE');

  const Nationality(this.key, this.isoCode);
  final int key;
  final String isoCode;

  static Nationality? fromKey(int key) {
    for (var nationality in Nationality.values) {
      if (nationality.key == key) {
        return nationality;
      }
    }
    return null;
  }
}
