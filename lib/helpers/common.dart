import 'package:core_control_panel/helpers/storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/auth/login.model.dart';

showLoading(BuildContext context, bool loading) {
  if (loading) {
    showDialog(
      context: context,
      builder: (_) => const Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
  } else {
    Navigator.pop(context);
  }
}

bool validateOtp(String value) {
  RegExp regex = RegExp(r'\b\d{6}\b');
  if (value.isEmpty) {
    return false;
  } else {
    if (value.length < 6 || !regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }
}

bool validateEmail(String value) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value);
}

bool validatePhone(String value) {
  return RegExp(r'\b\d{8}\b').hasMatch(value);
}

bool validateRegister(String value) {
  return RegExp(r'^[а-яА-ЯөӨүҮ]{2}[0-9]{8}$').hasMatch(value);
}

bool validatePastYear(int year) {
  final currentYear = DateTime.now().year;
  if (year > currentYear) {
    return false;
  }
  return true;
}

bool validatePastMonth(int year, int month) {
  final currentYear = DateTime.now().year;
  final currentMonth = DateTime.now().month;
  if (year > currentYear) return false;
  if (year == currentYear && month > currentMonth) return false;
  if (month == 0 || month > 12) return false;
  return true;
}

bool validatePastDay(int year, int month, int day) {
  final currentYear = DateTime.now().year;
  final currentMonth = DateTime.now().month;
  final currentDay = DateTime.now().day;
  if (year > currentYear) return false;
  if (year == currentYear && month > currentMonth) return false;
  if (month == 0 || month > 12) return false;
  if (year == currentYear && month == currentMonth && day > currentDay) {
    return false;
  }
  if (year % 4 == 0 && month == 2 && day > 29) return false;
  if (year % 4 != 0 && month == 2 && day > 28) return false;
  if ((month == 2 || month == 4 || month == 6 || month == 9 || month == 11) &&
      day > 30) return false;
  if (day > 31) return false;
  return true;
}

bool validateMonth(int year, int month) {
  if (month == 0 || month > 12) return false;
  return true;
}

bool validateDay(int year, int month, int day) {
  if (month == 0 || month > 12) return false;
  if (year % 4 == 0 && month == 2 && day > 29) return false;
  if (year % 4 != 0 && month == 2 && day > 28) return false;
  if ((month == 2 || month == 4 || month == 6 || month == 9 || month == 11) &&
      day > 30) return false;
  if (day > 31) return false;
  return true;
}

Future<Map<String, dynamic>> tokenParser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Object? token = prefs.get('token');
  Map<String, dynamic> tokenBody = Jwt.parseJwt(token.toString());
  return tokenBody;
}

setOrgValues(SelectOrganizationModel org) async {
  await StorageService.setInt('selected_org_id', org.id);
  await StorageService.set('selected_org_name', org.name);
  await StorageService.setInt('selected_org_type_id', org.typeId!);
  await StorageService.set('selected_org_type_name', org.typeName!);
}

mixin FormValidationsMixin {
  String? emptyValidation(String? value) {
    if (value == null || value.toString().trim().isEmpty) {
      return 'Шаардлагатай';
    }
    return null;
  }

  String? passwordvalidation(String? value) {
    if (value == null || value.toString().trim().isEmpty) {
      return 'Шаардлагатай';
    }
    if (value.toString().length < 4) {
      return 'Нууц үг хамгийн багадаа 4 тэмдэгт байх ёстой';
    }
    return null;
  }

  String? emailValidation(String? value) {
    if (value == null || value.toString().trim().isEmpty) {
      return 'Шаардлагатай';
    }
    if (RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[\w-]{2,}$',
            caseSensitive: false)
        .hasMatch(value.toString())) {
      return 'Имэйл хаяг биш байна';
    }
    return null;
  }
}
