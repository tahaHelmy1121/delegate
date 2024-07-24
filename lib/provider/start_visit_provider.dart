import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:delegate/custom_widget/drewnavbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/helper/awesomedialog.dart';
import '../data/data/start_visit_repo.dart';
import '../data/model/start_visit.dart';
import '../screen/Visit history/Visit history_view.dart';

class StartVisitProvider extends ChangeNotifier {
  BuildContext context;

  StartVisitProvider({required this.context}) {}
  File? _file;

  File? get file => _file;

  set file(File? value) {
    _file = value;
  }

  var imageBase;

  bool _loadData = false;

  bool get loadData => _loadData;

  set loadData(bool value) {
    _loadData = value;
    notifyListeners();
  }

  var x;
  File? diplayImage;

  uploadSingleImage() async {
    var pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      diplayImage = await File(pickedImage.path);

      print(diplayImage);

      var bytes = await diplayImage!.readAsBytes();

      x = base64Encode(bytes!);

      notifyListeners();
    } else {
      notifyListeners();
    }
  }

  SharedPreferences? sharedPreferences;
  StartVisitModel? startVisitModel;

  getSatrtVisit(
      {required BuildContext context,
      startLat,
      startLong,
      clientId,
      userId,
      visit_id,
      image}) async {
    SharedPreferences? sharedPreferences =
        await SharedPreferences.getInstance();
    var user_id = sharedPreferences!.getString('user_id');
    loadData = true;

    startVisitModel = await StartVisitRepo.startVisitRepo(
      context: context,
      userId: user_id,
      visit_id: visit_id,
      start_lat: startLat,
      start_long: startLong,
      clientid: clientId,
      pickedImage: x,
    );
    if (startVisitModel!.status == 1) {
      return Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => DrewNavigationBar()));
    } else {
      drewAwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          describe: startVisitModel!.reason)
        ..show();
      loadData = false;
    }
  }

  notifyListeners();
}
