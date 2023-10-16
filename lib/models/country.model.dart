class Country {
  late String code;
  late String isoAlphaCode2;
  late String commonName;
  late String fullName;
  late String enName;

  Country({
    required this.code,
    required this.isoAlphaCode2,
    required this.commonName,
    required this.fullName,
    required this.enName,
  });

  factory Country.fromJson(Map<String, dynamic> data) {
    return Country(
      code: data['code'],
      isoAlphaCode2: data['iso_alpha_code_2'],
      commonName: data['common_name'],
      fullName: data['full_name'],
      enName: data['en_name'],
    );
  }
}
