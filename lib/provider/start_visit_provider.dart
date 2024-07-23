import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../core/helper/awesomedialog.dart';
import '../core/helper/navigator.dart';
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

  var _imageBase;

  get imageBase => _imageBase;

  set imageBase(value) {
    _imageBase = value;
    notifyListeners();
  }

  bool _loadData = false;

  bool get loadData => _loadData;

  set loadData(bool value) {
    _loadData = value;
    notifyListeners();
  }

  final picker = ImagePicker();
  File? _image;
  var _isImageValid = true;

  bool _isInit = true;

  File? diplayImage;
  XFile? pickedImage;

  void uploadSingleImage() async {
    var pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      diplayImage = File(pickedImage.path);
      imageBase = base64Encode(diplayImage!.readAsBytesSync());
 debugPrint("imageBase : $imageBase");
      this.pickedImage = pickedImage;
//CHANGE THIS WITH CHANGE NOTIFIER
      notifyListeners();
    } else {
      //CHANGE THIS WITH CHANGE NOTIFIER
      notifyListeners();
    }
  }

  void clearPickedImage() {
    pickedImage = null;
    diplayImage = null;
    notifyListeners();
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
      pickedImage: diplayImage!,
    );
    if (startVisitModel!.status == 1) {
      return drewAwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          describe: startVisitModel!.reason)
          .show()
          .then((value) {
        navigatorToScreen(
            context: context, removeStack: true, widget: VisitHistoryView());
        print(diplayImage);
      });
    } else {
      drewAwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          describe: startVisitModel!.reason)
        ..show();
      loadData = false;
    }

    notifyListeners();
  }
}
