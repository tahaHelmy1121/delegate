import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/foundation.dart';
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

var imageBase;



  bool _loadData = false;

  bool get loadData => _loadData;

  set loadData(bool value) {
    _loadData = value;
    notifyListeners();
  }




  var x;
  File ?  diplayImage;
  uploadSingleImage() async {
    var pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      diplayImage =await File(pickedImage.path);
      print("vvvvvvvvvvvvvvvv");
      print(diplayImage);
      print("vvvvvvvvvvvvvvvv");
var bytes = await diplayImage!.readAsBytes();
print("xxxxxxxxxxxxxxxxxxxxx");
   x= base64Encode(bytes!);
      print("xxxxxxxxxxxxxxxxxxxxx");
      notifyListeners();
    } else {
      //CHANGE THIS WITH CHANGE NOTIFIER
      notifyListeners();
    }
  }

  // void clearPickedImage() {
  //   pickedImage = null;
  //   diplayImage = null;
  //   notifyListeners();
  // }

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
    print("xxxxxxxxxxxxxxxxxxxxxxxxx");
    print(x);
    print("xxxxxxxxxxxxxxxxxxxxxxxxx");
    startVisitModel = await StartVisitRepo.startVisitRepo(
      context: context,
      userId: user_id,
      visit_id: visit_id,
      start_lat: startLat,
      start_long: startLong,
      clientid: clientId,
      pickedImage: x,
    );

      print(startVisitModel!.reason);
    }

    notifyListeners();
  }

