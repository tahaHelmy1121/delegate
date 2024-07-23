

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/data/visits_repo.dart';
import '../data/model/visits.dart';



class VisitsProvider extends ChangeNotifier {
  BuildContext context;
  VisitsProvider({required this.context}){
    getVisitsRepo(context: context);
  }

  List<VisitsModel>? _visits;

  List<VisitsModel>? get visits => _visits;

  set visits(List<VisitsModel>? value) {
    _visits = value;
    notifyListeners();
  }

  bool _loadData =false;

  bool get loadData => _loadData;

  set loadData(bool value) {
    _loadData = value;
    notifyListeners();
  }

  getVisitsRepo({required BuildContext context})async{
    SharedPreferences? sharedPreferences = await SharedPreferences.getInstance();
    var user_id = sharedPreferences!.getString('user_id');
    visits =await VisitsRepo.GetVisit(context: context,user_id: user_id);
    loadData=true;
    notifyListeners();
  }
}