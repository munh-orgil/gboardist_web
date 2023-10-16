import 'dart:convert';

class System {
  final String code;
  final String name;
  final String createdDate;

  System({
    required this.code,
    required this.name,
    required this.createdDate,
  });

  System copyWith({
    String? code,
    String? name,
    String? createdDate,
  }) {
    return System(
      code: code ?? this.code,
      name: name ?? this.name,
      createdDate: createdDate ?? this.createdDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'created_date': createdDate,
    };
  }

  factory System.fromMap(Map<String, dynamic> map) {
    return System(
      code: map['code'] ?? '',
      name: map['name'] ?? '',
      createdDate: map['created_date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory System.fromJson(String source) => System.fromMap(json.decode(source));

  @override
  String toString() =>
      'System(code: $code, name: $name, createdDate: $createdDate)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is System &&
        other.code == code &&
        other.name == name &&
        other.createdDate == createdDate;
  }

  @override
  int get hashCode => code.hashCode ^ name.hashCode ^ createdDate.hashCode;
}

class Token {
  final int id;
  final String systemCode;
  final String token;
  final String description;
  final int expireDay;
  final String createdDate;

  Token({
    required this.id,
    required this.systemCode,
    required this.token,
    required this.description,
    required this.expireDay,
    required this.createdDate,
  });

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      id: json['id'],
      systemCode: json['system_code'],
      token: json['token'],
      description: json['description'],
      expireDay: json['expire_day'],
      createdDate: json['created_date'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['system_code'] = systemCode;
    data['token'] = token;
    data['description'] = description;
    data['expire_day'] = expireDay;
    data['created_date'] = createdDate;
    return data;
  }
}

class RoleMatrixModel {
  int? id;
  String? systemCode;
  String? roleCode;
  String? asigned;
  String? roleName;
  String? asignedBy;
  String? type;
  String? createdDate;

  RoleMatrixModel({
    this.id,
    this.systemCode,
    this.roleCode,
    this.asigned,
    this.asignedBy,
    this.roleName,
    this.type,
    this.createdDate,
  });

  RoleMatrixModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    systemCode = json['system_code'];
    roleCode = json['role_code'];
    asigned = json['asigned'];
    asignedBy = json['asigned_by'];
    type = json['type'];
    createdDate = json['created_date'];
    roleName = json['role_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['system_code'] = systemCode;
    data['role_code'] = roleCode;
    data['asigned'] = asigned;
    data['asigned_by'] = asignedBy;
    data['type'] = type;
    data['created_date'] = createdDate;
    data['role_name'] = roleName;
    return data;
  }
}
