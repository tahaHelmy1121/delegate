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
    fetchClients(context: context);
    getReport();
  }

  bool _load = false;

  bool get load => _load;

  set load(bool value) {
    _load = value;
    notifyListeners();
  }

  SharedPreferences? sharedPreferences;
  List<ClientsModel>? _client;

  List<ClientsModel>? get client => _client;

  set client(List<ClientsModel>? value) {
    _client = value;
    notifyListeners();
  }

  var _visitsClientSelcted;

  get visitsClientSelcted => _visitsClientSelcted;

  set visitsClientSelcted(value) {
    _visitsClientSelcted = value;
    notifyListeners();
  }

  TextEditingController searchController = TextEditingController();
  List<ReportModel>?search;
  fetchClientsSeacrh({
    required BuildContext context,
  }) async {
    sharedPreferences = await SharedPreferences.getInstance();
    var user = sharedPreferences!.getString("user_id");
    search = await GetClientsRepo.GetClient(
        context: context, user_id: user, search_name: searchController.text);
    print("aaaaaaaaaaaaaa");
    print(search!.length);
    print("aaaaaaaaaaaaaa");
    load = true;
    notifyListeners();
  }

  fetchClients({
    required BuildContext context,
  }) async {
    sharedPreferences = await SharedPreferences.getInstance();
    var user = sharedPreferences!.getString("user_id");
    client = await GetClientsRepo.GetClient(
        context: context, user_id: user, search_name: searchController.text);
    load = true;
    notifyListeners();

  }

  bool _reportLoad = false;

  bool get reportLoad => _reportLoad;

  set reportLoad(bool value) {
    _reportLoad = value;
    notifyListeners();
  }

  ReportModel? reportModel;




  getReport() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var user = sharedPreferences!.getString("user_id");
    reportModel = await GetReportRepo.GeReporttClient(
        context: context, user_id: user, client_id: clientId);
    print(reportModel!.lastsellbilldate);
    reportLoad = true;
    notifyListeners();
  }
}
