

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../core/helper/app_url.dart';
import '../../core/helper/showerrorconnection.dart';
import '../model/get_register_client.dart';
import '../model/profile.dart';

class FilterRepo {
  static Getfilter({
    required BuildContext context,
    clientareaid,
  }) async {
    List<GetRegisterNewPoint>?getRegisterNewPoint=[];
    Map<String, dynamic> body = {
      "clientareaid": clientareaid,
    };
    var response = await http.post(
        Uri.parse(
            "${baseUrl}?do=getregisternewpointsale"),
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      return getRegisterNewPoint = getRegisterNewPointFromJson(response.body);
    } else {
      return showErrorConnection(context: context, error: "حدث خطأ");
    }
  }
}
