class User {
  late String id;
  late String username;
  late String email;
  late String phoneNo;
  late String regNo;
  late String firstName;
  late String lastName;
  late String profileImage;
  late String password;
  late String familyName;
  late String birthDate;
  late int gender;
  late String address;
  late String aimagCode;
  late String aimagName;
  late String bagCode;
  late String bagName;
  late String sumCode;
  late String sumName;
  late int isForeign;

  User({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.profileImage,
  });

  String displayName() {
    return "${firstName[0].toUpperCase()}${firstName.substring(1)}";
  }

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
      id: data["id"],
      username: data['username'],
      firstName: data['first_name'],
      lastName: data['last_name'],
      profileImage: data['profile_image'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'first_name': firstName,
        'last_name': lastName,
        'profile_image': profileImage,
      };
}

class Organization {
  late String id;
  late String name;
  late String typeId;
  late String typeName;
  Organization({
    required this.id,
    required this.name,
    required this.typeId,
    required this.typeName,
  });

  factory Organization.fromJson(Map<String, dynamic> data) {
    return Organization(
      id: data['id'],
      name: data['name'],
      typeId: data['type_id'],
      typeName: data['type_name'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type_id': typeId,
        'type_name': typeName,
      };
}

class Authorization {
  late String userId;
  late String? orgId;
  late String token;
  late String expires;
  late int expiresIn;

  Authorization({
    required this.token,
    required this.userId,
    required this.orgId,
    required this.expires,
    required this.expiresIn,
  });

  factory Authorization.fromJson(Map<String, dynamic> json) {
    return Authorization(
      token: json['token'],
      userId: json['user_id'],
      orgId: json['org_id'],
      expires: json['expires'],
      expiresIn: json['expires_in'],
    );
  }
}
