import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../core/helper/showerrorconnection.dart';
import '../model/clients_model.dart';
import '../model/profile.dart';

class GetClientsRepo {
  static GetClient({
    required BuildContext context,
    user_id,
  }) async {
    List<ClientsModel> clientsModel;
    Map<String, dynamic> body = {
      "user_id": user_id,
    };
    var response = await http.post(
        Uri.parse(
            "https://erp.gt4it.com/taha2024/controllers/visitsApi.php?do=clients"),
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      return clientsModel = ClientsFromJson(response.body);
    } else {
      return showErrorConnection(context: context, error: "حدث خطأ");
    }
  }
}
