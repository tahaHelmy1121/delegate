import 'package:delegate/data/data/get_all_categories_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/model/categories.dart';

class CategoryProvider extends ChangeNotifier {
  BuildContext context;

  CategoryProvider({required this.context}) {
    getAllCategories();
  }

  bool _reportLoad = false;

  bool get reportLoad => _reportLoad;

  set reportLoad(bool value) {
    _reportLoad = value;
    notifyListeners();
  }

  List<CategoriesModel> _categories = [];

  List<CategoriesModel> get categories => _categories;

  set categories(List<CategoriesModel> value) {
    _categories = value;
    notifyListeners();
  }

  TextEditingController _searchController = TextEditingController();

  TextEditingController get searchController => _searchController;

  set searchController(TextEditingController value) {
    _searchController = value;
    notifyListeners();
  }

  var _categorySelected;

  get categorySelected => _categorySelected;

  set categorySelected(value) {
    _categorySelected = value;
    notifyListeners();
  }

  getAllCategories({product_id, search_name}) async {
    categories = await GetCategoriesrepo.getCategories(
        context: context,
        product_cat_id: product_id,
        search_name: search_name);
    if (categories!.isNotEmpty) {
      categorySelected = categories!.first.productCatId;
    }
    reportLoad = true;
    notifyListeners();
  }

}
