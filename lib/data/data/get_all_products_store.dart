import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../core/helper/app_url.dart';
import '../../core/helper/showerrorconnection.dart';
import '../model/categories.dart';
import '../model/clients_model.dart';
import '../model/products_store.dart';
import '../model/profile.dart';

class GetProductsStore {
  static getProductsStore({
    required BuildContext context,
    user_id,
    product_cat_id,
  }) async {
    List<ProductsStore> productsStore;
    Map<String, dynamic> body = {
      "product_cat_id": product_cat_id,
      "user_id":user_id
    };
    var response = await http.post(
        Uri.parse(
            "${baseUrl}?do=productStore"),
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      return productsStore = productsStoreFromJson(response.body);
    } else {
      return showErrorConnection(context: context, error: "حدث خطأ");
    }
  }
}
