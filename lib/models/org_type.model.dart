class OrganizationType {
  late int id;
  late String name;

  OrganizationType({
    required this.id,
    required this.name,
  });

  factory OrganizationType.fromJson(Map<String, dynamic> data) {
    return OrganizationType(
      id: data['id'],
      name: data['name'],
    );
  }
}
