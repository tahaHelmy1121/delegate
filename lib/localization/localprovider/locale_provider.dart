import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', locale.languageCode);
    notifyListeners();
  }

  Future<Locale> getLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString('language') ?? 'ar';
    print(languageCode);
    return Locale(languageCode);

  }
}
