import 'package:core_control_panel/constants/utility.dart';

class Profile {
  late String? id;
  late String? username;
  late String? email;
  late String? phoneNo;
  late String? civilId;
  late String regNo;
  late String familyName;
  late String lastName;
  late String firstName;
  late String? profileImageUrl;
  late int? gender;
  late String birthDate;
  late int? isForeign;
  late String? aimagName;
  late String? sumName;
  late String? bagName;
  late String? addressDetail;
  late String? countryName;

  Profile(
      {this.id,
      this.username,
      this.email,
      this.phoneNo,
      this.civilId,
      required this.regNo,
      required this.familyName,
      required this.lastName,
      required this.firstName,
      this.profileImageUrl,
      this.gender,
      required this.birthDate,
      this.isForeign,
      this.aimagName,
      this.sumName,
      this.bagName,
      this.addressDetail,
      this.countryName});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    phoneNo = json['phone_no'];
    civilId = json['civil_id'];
    regNo = json['reg_no'];
    familyName = Constants.capitalize(json['family_name']);
    lastName = Constants.capitalize(json['last_name']);
    firstName = Constants.capitalize(json['first_name']);
    profileImageUrl = json['profile_image_url'];
    gender = json['gender'];
    birthDate = json['birth_date'];
    isForeign = json['is_foreign'];
    aimagName = json['aimag_name'];
    sumName = json['sum_name'];
    bagName = json['bag_name'];
    addressDetail = json['address_detail'];
    countryName = json['country_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['phone_no'] = phoneNo;
    data['civil_id'] = civilId;
    data['reg_no'] = regNo;
    data['family_name'] = familyName;
    data['last_name'] = lastName;
    data['first_name'] = firstName;
    data['profile_image_url'] = profileImageUrl;
    data['gender'] = gender;
    data['birth_date'] = birthDate;
    data['is_foreign'] = isForeign;
    data['aimag_name'] = aimagName;
    data['sum_name'] = sumName;
    data['bag_name'] = bagName;
    data['address_detail'] = addressDetail;
    data['country_name'] = countryName;
    return data;
  }
}
