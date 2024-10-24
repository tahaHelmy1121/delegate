import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../core/helper/app_url.dart';
import '../../core/helper/showerrorconnection.dart';
import '../model/profile.dart';

class ProfileRepo {
  static GetProfile({
    required BuildContext context,
    user_id,
  }) async {
    ProfileModel profileModel;
    Map<String, dynamic> body = {
      "user_id": user_id,
    };
    var response = await http.post(
        Uri.parse(
            "${baseUrl}?do=profile"),
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      return profileModel = profileModelFromJson(response.body);
    } else {
      return showErrorConnection(context: context, error: "حدث خطأ");
    }
  }
}
