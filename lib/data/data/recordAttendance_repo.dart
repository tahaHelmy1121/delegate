




import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../core/helper/app_url.dart';
import '../../core/helper/showerrorconnection.dart';
import '../model/recorde_attend.dart';


class RecordAttendanceRepo {
  static getrecordAttendance({
    required BuildContext context,
    user_id,
    lat,
    long
  }) async {
    Recordattendance? recordattendance;
    Map<String,dynamic> body = {
      'user_id': user_id,
      'lat': lat,
      'long':long,

    };
    var response = await http.post(Uri.parse(recordeAttendUrl),body: jsonEncode(body));
    if (response.statusCode == 200) {
      return recordattendance = recordattendanceFromJson(response.body);
    } else {
      return showErrorConnection(context: context, error: "حدث خطأ");
    }
  }
}
