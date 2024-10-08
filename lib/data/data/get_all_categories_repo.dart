import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../core/helper/app_url.dart';
import '../../core/helper/showerrorconnection.dart';
import '../model/categories.dart';
import '../model/clients_model.dart';
import '../model/profile.dart';

class GetCategoriesrepo {
  static getCategories({
    required BuildContext context,
    product_cat_id,
    search_name,
  }) async {
    List<CategoriesModel> categories;
    Map<String, dynamic> body = {
      "product_cat_id": product_cat_id,
      "search_name":search_name
    };
    var response = await http.post(
        Uri.parse(
            "${baseUrl}?do=categories"),
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      print(response.body);
      return categories = categoriesModelFromJson(response.body);

    } else {
      return showErrorConnection(context: context, error: "حدث خطأ");
    }
  }
}
