class SelectOrganizationModel {
  late int id;
  late String name;
  int? typeId;
  String? typeName;

  SelectOrganizationModel({
    required this.id,
    required this.name,
    this.typeId,
    this.typeName,
  });

  SelectOrganizationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    typeId = json['type_id'];
    typeName = json['type_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type_id'] = typeId;
    data['type_name'] = typeName;
    return data;
  }
}
