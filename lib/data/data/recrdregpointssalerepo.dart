

import 'dart:convert';

import 'package:delegate/data/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../core/helper/app_url.dart';
import '../../core/helper/showerrorconnection.dart';
import '../model/recordepoint.dart';


class Recrdregpointssalerepo {
  static  recrdregpoint({
    required BuildContext context,
    var
    user_id,
    regpointssaleid,
  }) async {
    RecordePoint? record;
    Map<String,dynamic> body = {
      'user_id': user_id,
      'regpointssaleid': regpointssaleid,

    };
    var response = await http.post(Uri.parse("${baseUrl}?do=recordregpointssale"),body: jsonEncode(body));
    if (response.statusCode == 200) {
      return record = recordFromJson(response.body);
    } else {
      return showErrorConnection(context: context, error: "حدث خطأ");
    }
  }
}
