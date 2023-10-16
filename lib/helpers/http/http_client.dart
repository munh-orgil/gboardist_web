import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:core_control_panel/widgets/notice/notice.dart';
import 'package:http/http.dart' as http;
import 'package:core_control_panel/helpers/storage/storage.dart';

class ApiResponse {
  late String message;

  ApiResponse(this.message);
  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(json['message']);
  }
}

class HttpClient {
  late Map<String, String> headers;
  final BuildContext context;

  HttpClient(
    this.context,
  ) {
    headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
  }

  dynamic send({
    required String fullUrl,
    String method = "post",
    Map<String, dynamic>? data,
    Map<String, dynamic>? customerHeaders,
    bool isShowError = true,
  }) async {
    headers['Authorization'] = "Bearer ${await StorageService.get('token')}";

    if (customerHeaders != null) {
      customerHeaders.forEach((key, value) {
        headers[key] = value;
      });
    }
    var uri = Uri.parse(fullUrl);
    switch (method) {
      case "get":
        return await httpGet(uri, isShowError);
      case "post":
        return await httpPost(uri, data, isShowError);
      case "put":
        return await httpPut(uri, data, isShowError);
      case "delete":
        return await httpDelete(uri, data, isShowError);
      default:
        return null;
    }
  }

  Future<dynamic> httpGet(Uri uri, bool isShowError) async {
    try {
      final http.Response response = await http.get(
        uri,
        headers: headers,
      );

      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes));
      } else {
        if (response.statusCode == 401) {
          // ignore: use_build_context_synchronously
          throwToLogin(context);
        }
        final ApiResponse res =
            ApiResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        if (isShowError) {
          throw res.message;
        }
      }
    } catch (err) {
      showSnackbar(err.toString(), context);
      return null;
    }
  }

  Future<dynamic> httpPost(
      Uri uri, Map<String, dynamic>? data, bool isShowError) async {
    try {
      final http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes));
      } else {
        if (response.statusCode == 401) {
          // ignore: use_build_context_synchronously
          throwToLogin(context);
        }
        final ApiResponse res =
            ApiResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        if (isShowError) {
          throw res.message;
        }
      }
    } catch (err) {
      showSnackbar(err.toString(), context);
      return null;
    }
  }

  Future<dynamic> httpPut(
      Uri uri, Map<String, dynamic>? data, bool isShowError) async {
    try {
      final http.Response response = await http.put(
        uri,
        headers: headers,
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes));
      } else {
        if (response.statusCode == 401) {
          // ignore: use_build_context_synchronously
          throwToLogin(context);
        }
        final ApiResponse res =
            ApiResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        if (isShowError) {
          throw res.message;
        }
      }
    } catch (err) {
      showSnackbar(err.toString(), context);
      return null;
    }
  }

  Future<dynamic> httpDelete(
      Uri uri, Map<String, dynamic>? data, bool isShowError) async {
    try {
      final http.Response response = await http.delete(
        uri,
        headers: headers,
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes));
      } else {
        if (response.statusCode == 401) {
          // ignore: use_build_context_synchronously
          throwToLogin(context);
        }
        final ApiResponse res =
            ApiResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        if (isShowError) {
          throw res.message;
        }
      }
    } catch (err) {
      showSnackbar(err.toString(), context);
      return null;
    }
  }

  showSnackbar(String msg, BuildContext context) {
    return Notice(context).error(msg);
  }

  throwToLogin(BuildContext context) {
    Navigator.pushNamed(context, '/login');
    StorageService.clear();
  }
}
