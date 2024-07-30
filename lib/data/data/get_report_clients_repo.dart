import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../core/helper/app_url.dart';
import '../../core/helper/showerrorconnection.dart';
import '../model/clients_model.dart';
import '../model/profile.dart';
import '../model/report_model.dart';

class GetReportRepo {
  static GeReporttClient({
    required BuildContext context,
    user_id,
    client_id,
  }) async {
    ReportModel reportModel ;
    Map<String, dynamic> body = {
      "user_id": user_id,
      "client_id":client_id,
    };
    var response = await http.post(
        Uri.parse(
            "${baseUrl}?do=clientReports"),
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      return reportModel = reportModelFromJson(response.body);
    } else {
      return showErrorConnection(context: context, error: "حدث خطأ");
    }
  }
}
