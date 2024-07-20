import 'package:delegate/core/helper/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/helper/di.dart';

class LocaleProvider extends ChangeNotifier {
  BuildContext context;
  LocaleProvider({required this.context}){

  }
  Locale _locale = Locale('ar');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (locale == _locale) return;
    _locale = locale;
    saveLocale(locale);
    notifyListeners();
  }

  init() {
    getLocale().then((value) {
      _locale = value;
      notifyListeners();
    });
  }

  saveLocale(Locale locale) async {
    sl<CacheHelper>().saveData(key: "language", value: locale.languageCode);
    notifyListeners();
  }

  Future<Locale> getLocale() async {
    String languageCode = sl<CacheHelper>().getData(key: "language")??"ar";
    print(languageCode);
    return Locale(languageCode);

  }
}
