

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../core/helper/app_url.dart';
import '../../core/helper/showerrorconnection.dart';
import '../model/start_visit.dart';
import '../model/visits.dart';


class VisitsRepo {
  static GetVisit({
    required BuildContext context,
    user_id,
  }) async {
    List<VisitsModel>? visitsModel;
    Map<String,dynamic> body = {
      "user_id": user_id,
    };
    var response = await http.post(Uri.parse(visits),body: jsonEncode(body));
    if (response.statusCode == 200) {
      return visitsModel = visitsFromJson(response.body);
    } else {
      return showErrorConnection(context: context, error: "حدث خطأ");
    }
  }
}
