import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/helper/awesomedialog.dart';
import '../core/helper/navigator.dart';
import '../data/data/recordAttendance_repo.dart';
import '../data/model/recorde_attend.dart';
import '../screen/Visit history/Visit history_view.dart';

class RecordAttendanceProvider extends ChangeNotifier {
  BuildContext context;

  RecordAttendanceProvider({required this.context}) {}

  Recordattendance? recordattendance;
  bool _loadData = false;

  bool get loadData => _loadData;

  set loadData(bool value) {
    _loadData = value;
    notifyListeners();
  }

  SharedPreferences? sharedPreferences;

  GetRecordAttendance({lat, long}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    var user_id = sharedPreferences!.getString('user_id');
    recordattendance = await RecordAttendanceRepo.getrecordAttendance(
        context: context, user_id: user_id, lat: lat, long: long);
    loadData = true;
    if (recordattendance!.status == 1) {
      return drewAwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              describe: "تم تسجيل الحضور")
          .show()
          .then((value) {
        navigatorToScreen(
            context: context, removeStack: true, widget: VisitHistoryView());
      });
    } else {
      drewAwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          describe: recordattendance!.reason)
        ..show();
      loadData = false;
    }
    notifyListeners();
  }
}
