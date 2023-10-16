class Location {
  int id;
  String name;
  int aimagId;
  String aimagName;
  int sumId;
  String sumName;
  int bagId;
  String bagName;
  String detailText;
  String createdDate;

  Location({
    required this.id,
    required this.name,
    required this.aimagId,
    required this.aimagName,
    required this.sumId,
    required this.sumName,
    required this.bagId,
    required this.bagName,
    required this.detailText,
    required this.createdDate,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      name: json['name'],
      aimagId: json['aimag_id'],
      aimagName: json['aimag_name'],
      sumId: json['sum_id'],
      sumName: json['sum_name'],
      bagId: json['bag_id'],
      bagName: json['bag_name'],
      detailText: json['detail_text'],
      createdDate: json['created_date'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'aimag_id': aimagId,
        'aimag_name': aimagName,
        'sum_id': sumId,
        'sum_name': sumName,
        'bag_id': bagId,
        'bag_name': bagName,
        'detail_text': detailText,
        'created_date': createdDate,
      };
}
