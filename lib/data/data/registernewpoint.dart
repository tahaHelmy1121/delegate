import 'dart:convert';

import 'package:delegate/data/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../core/helper/app_url.dart';
import '../../core/helper/showerrorconnection.dart';
import '../model/register_new_point.dart';


class RegisterPoint {
  static getRegister({
    required BuildContext context,
    userId,
    clientareaid,
    shop_name,
    contact_number,
    shop_category,
    lat,
    lng,
  }) async {
    RegisterNewPoint? registerNewPoint;
    Map<String, dynamic> body = {
      'user_id': userId,
      'clientareaid': clientareaid,
       'shop_name': shop_name,
      'contact_number':contact_number,
      'shop_category':shop_category,
      'lat':lat,
      'long':lng,
    };

    var response = await http.post(
        Uri.parse(
            "${baseUrl}?do=registernewpointsale"), body: jsonEncode(body));
    if (response.statusCode == 200) {
print(body);
      return registerNewPoint = registerNewPointFromJson(response.body);
    } else {
      return showErrorConnection(context: context, error: "حدث خطأ");
    }
  }
}
