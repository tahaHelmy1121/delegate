import 'dart:collection';

import 'package:delegate/screen/Customer%20Report/customer_report.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/data/get_clients_repo.dart';
import '../data/data/get_report_clients_repo.dart';
import '../data/model/clients_model.dart';
import '../data/model/report_model.dart';

class ClientProvider extends ChangeNotifier {
  BuildContext context;
 var clientId;
  ClientProvider({required this.context,this.clientId}) {
    fetchclient(context: context);
  }

  bool _load = false;

  bool get load => _load;

  set load(bool value) {
    _load = value;
    notifyListeners();
  }

  SharedPreferences? sharedPreferences;


  TextEditingController searchController = TextEditingController();



  bool _reportLoad = false;

  bool get reportLoad => _reportLoad;

  set reportLoad(bool value) {
    _reportLoad = value;
    notifyListeners();
  }

  List<CustomerReportModel> customerReport  = [];

  fetchclient({
    required BuildContext context,
  }) async {
    sharedPreferences = await SharedPreferences.getInstance();
    var user = sharedPreferences!.getString("user_id");
    customerReport = await GetReportRepo.GeReporttClient(
        context: context, user_id: user);
    reportLoad = true;
    notifyListeners();

  }



}
