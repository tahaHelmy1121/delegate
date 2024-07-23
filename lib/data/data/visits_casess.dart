import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../core/helper/showerrorconnection.dart';
import '../model/visitcases_model.dart';

class VisitsCasesRepo {
  static GetVisitCases({
    required BuildContext context,
    user_id,
  }) async {
    List<VisitsCasess>? visitsCasess;
    Map<String, dynamic> body = {
      "user_id": user_id,
    };
    var response = await http.post(
        Uri.parse(
            "https://erp.gt4it.com/taha2024/controllers/visitsApi.php?do=visitcases"),
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      return visitsCasess = visitsCasessFromJson(response.body);
    } else {
      return showErrorConnection(context: context, error: "حدث خطأ");
    }
  }
}
