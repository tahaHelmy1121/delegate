import 'package:delegate/data/data/visits_casess.dart';
import 'package:delegate/data/model/visitcases_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/helper/massage.dart';
import '../custom_widget/drewnavbar.dart';
import '../data/data/visit_end_repo.dart';
import '../data/model/visit_end_model.dart';

class FinishProvider extends ChangeNotifier {
  BuildContext context;

  FinishProvider({required this.context}) {
    fetchCasess(context: context);
  }

  List<VisitsCasess>? _visitsCasess;

  List<VisitsCasess>? get visitsCasess => _visitsCasess;

  set visitsCasess(List<VisitsCasess>? value) {
    _visitsCasess = value;
    notifyListeners();
  }

  var _visitsCasessSelcted;

  get visitsCasessSelcted => _visitsCasessSelcted;

  set visitsCasessSelcted(value) {
    _visitsCasessSelcted = value;
    notifyListeners();
  }

  bool _load = false;

  bool get load => _load;

  set load(bool value) {
    _load = value;
    notifyListeners();
  }

  SharedPreferences? sharedPreferences;

  fetchCasess({
    required BuildContext context,
  }) async {
    sharedPreferences = await SharedPreferences.getInstance();
    var user = sharedPreferences!.getString("user_id");
    visitsCasess =
        await VisitsCasesRepo.GetVisitCases(context: context, user_id: user);
    if (visitsCasess!.isNotEmpty) {
      visitsCasessSelcted = visitsCasess!.first.id;
    }
    load = true;
    notifyListeners();
  }

  EndVisitModel? endVisitModel;
  TextEditingController noteController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  finishFromRepo(
      {
        visit_id,
      clientid,
      endlat,
 endlong}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    var user = sharedPreferences!.getString("user_id");
    endVisitModel =await EndVisit.endtVisit(
      context: context,
      user_id: user,
      visit_id: visit_id,
      note: noteController.text,
      visitcaseid: visitsCasessSelcted,
      clientid: clientid,
      end_lat:endlat ,
      end_long: endlong,
    );

   if(endVisitModel!.status==1){
      MassageApp.snackBar(endVisitModel!.reason.toString(), context);
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => DrewNavigationBar()));
    } else {
      MassageApp.snackBar(endVisitModel!.reason.toString(), context);
    }
    }
  }

