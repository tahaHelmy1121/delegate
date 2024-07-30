import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../core/helper/app_url.dart';
import '../../core/helper/showerrorconnection.dart';
import '../model/clients_model.dart';
import '../model/profile.dart';

class GetClientsRepo {
  static GetClient({
    required BuildContext context,
    user_id,
    search_name,
  }) async {
    List<ClientsModel> clientsModel;
    Map<String, dynamic> body = {
      "user_id": user_id,
      "search_name":search_name
    };
    var response = await http.post(
        Uri.parse(
            "${baseUrl}?do=clients"),
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      return clientsModel = ClientsFromJson(response.body);
    } else {
      return showErrorConnection(context: context, error: "حدث خطأ");
    }
  }
}
