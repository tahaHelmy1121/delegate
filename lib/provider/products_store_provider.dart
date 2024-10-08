import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/data/get_all_products_store.dart';
import '../data/model/products_store.dart';

class ProductsStoreProvider extends ChangeNotifier {
  BuildContext context;
  var productCategoryId;

  ProductsStoreProvider({required this.context, this.productCategoryId}) {
    getAllProductsStore();
  }

  bool _reportLoad = false;

  bool get reportLoad => _reportLoad;

  set reportLoad(bool value) {
    _reportLoad = value;
    notifyListeners();
  }

  List<ProductsStore> _products = [];

  List<ProductsStore> get products => _products;

  set products(List<ProductsStore> value) {
    _products = value;
    notifyListeners();
  }

  SharedPreferences? sharedPreferences;

  getAllProductsStore({search_name}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    var customerId = sharedPreferences!.getString("user_id");
    products = await GetProductsStore.getProductsStore(
        context: context,
        product_cat_id: productCategoryId,
        user_id: customerId);

    reportLoad = true;
    notifyListeners();
  }
}
