

import 'dart:convert';

import 'package:delegate/data/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../core/helper/app_url.dart';
import '../../core/helper/showerrorconnection.dart';
import '../model/update_ptofile.dart';


class UpdateProfileRepo {
  static getProfileRepo({
    required BuildContext context,
    var
    user_id,
    password,
  }) async {
    UpdateProfile? updateProfile;
    Map<String,dynamic> body = {
      'user_id': user_id,
      'password': password,

    };
    var response = await http.post(Uri.parse("${baseUrl}?do=updateProfile"),body: jsonEncode(body));
    if (response.statusCode == 200) {
      return updateProfile = updateProfileFromJson(response.body);
    } else {
      return showErrorConnection(context: context, error: "حدث خطأ");
    }
  }
}
