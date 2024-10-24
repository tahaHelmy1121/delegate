

import 'dart:convert';

import 'package:delegate/data/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../core/helper/app_url.dart';
import '../../core/helper/showerrorconnection.dart';


class LoginRepo {
  static getLogin({
    required BuildContext context,
    var
    userName,
    password,
  }) async {
    LoginModel? login;
    Map<String,dynamic> body = {
      'username': userName,
      'password': password,

    };
    var response = await http.post(Uri.parse(loginUrl),body: jsonEncode(body));
    if (response.statusCode == 200) {
      return login = loginModelFromJson(response.body);
    } else {
      return showErrorConnection(context: context, error: "حدث خطأ");
    }
  }
}
