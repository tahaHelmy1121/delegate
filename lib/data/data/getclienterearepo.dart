

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../core/helper/app_url.dart';
import '../../core/helper/showerrorconnection.dart';
import '../model/get_client_erea.dart';
import '../model/profile.dart';

class Getclienterearepo {
  static Geterea({
    required BuildContext context,
    user_id,
  }) async {
    List<GetClientErea>?clientErea;

    var response = await http.post(
        Uri.parse(
            "${baseUrl}?do=getclientarea"));

    if (response.statusCode == 200) {
      print("xxxxxxxxxxxxx");
      print(response.body);
      print("xxxxxxxxxxxxx");

      return clientErea = getClientEreaFromJson(response.body);

    } else {
      return showErrorConnection(context: context, error: "حدث خطأ");
    }
  }
}
