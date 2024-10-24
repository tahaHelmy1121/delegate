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
    List<CustomerReportModel> reportModel ;
    Map<String, dynamic> body = {
      "user_id": user_id,
    };
    var response = await http.post(
        Uri.parse(
            "https://erp.gt4it.com/acc2022/controllers/visitsApi.php?do=clientReports2"),
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      return reportModel = customerReportModelFromJson(response.body);
    } else {
      return showErrorConnection(context: context, error: "حدث خطأ");
    }
  }
}
