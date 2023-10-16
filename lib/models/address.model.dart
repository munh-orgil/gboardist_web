class Address {
  late int id;
  late String name;

  Address({
    required this.id,
    required this.name,
  });

  factory Address.fromJson(Map<String, dynamic> data) {
    return Address(
      id: data['id'],
      name: data['name'],
    );
  }
}
