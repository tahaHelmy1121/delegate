

import 'dart:convert';

import 'package:delegate/data/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../core/helper/app_url.dart';
import '../../core/helper/showerrorconnection.dart';
import '../model/visit_end_model.dart';


class EndVisit {
  static endtVisit({
    required BuildContext context,
    var
    user_id,
    visit_id,
    clientid,
    end_lat,
    end_long,
    visitcaseid,
    note,
  }) async {
    EndVisitModel endVisitModel;
    Map<String,dynamic> body = {
      'user_id': user_id,
      'visit_id': visit_id,
      'clientid': clientid,
      'end_lat': end_lat,
      'end_long': end_long,
      'visitcaseid':visitcaseid,
      'note':note,

    };
    var response = await http.post(Uri.parse("${baseUrl}?do=visitEnd"),body: jsonEncode(body));
    if (response.statusCode == 200) {
      return endVisitModel = endVisitModelFromJson(response.body);
    } else {
      return showErrorConnection(context: context, error: "حدث خطأ");
    }
  }
}
