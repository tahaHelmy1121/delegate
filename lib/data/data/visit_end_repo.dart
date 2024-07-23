

import 'dart:convert';

import 'package:delegate/data/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../core/helper/app_url.dart';
import '../../core/helper/showerrorconnection.dart';


class EndVisit {
  static endtVisit({
    required BuildContext context,
    var
    user_id,
    visit_id,
    clientid,
    end_lat,
    end_long,
    imageendvisit,
  }) async {
    LoginModel? login;
    Map<String,dynamic> body = {
      'user_id': user_id,
      'visit_id': visit_id,
      'clientid': clientid,
      'end_lat': end_lat,
      'end_long': end_long,
      'imageendvisit': imageendvisit,
    };
    var response = await http.post(Uri.parse(startEnd),body: jsonEncode(body));
    if (response.statusCode == 200) {
      return login = loginModelFromJson(response.body);
    } else {
      return showErrorConnection(context: context, error: "حدث خطأ");
    }
  }
}
