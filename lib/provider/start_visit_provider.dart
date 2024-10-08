import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:delegate/custom_widget/drewnavbar.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/helper/awesomedialog.dart';
import '../data/data/start_visit_repo.dart';
import '../data/model/start_visit.dart';

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
    var pickedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 40,
    );
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

  Future<File> resizeImage(File file, int width, int height) async {
    final originalImage = img.decodeImage(file.readAsBytesSync());
    final resizedImage = img.copyResize(originalImage!, width: width, height: height);
    final resizedFile = File('${file.path}_resized.jpg'); // Replace with desired output path
    resizedFile.writeAsBytesSync(img.encodeJpg(resizedImage));
    return resizedFile;
  }
  Future<void> pickAndResizeImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera,);
    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);
      diplayImage = imageFile;
      notifyListeners();
    final resizedImage = await resizeImage(imageFile, 800, 400); //
      var bytes = await resizedImage.readAsBytes();//
      x = base64Encode(bytes);// Adjust width and height as needed
    print(resizedImage);
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
    print("zzzzzzzzz");
   print(x);
    print("zzzzzzzzz");
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
      drewAwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          describe: startVisitModel!.reason)
        ..show().then((value) {
          Navigator.pop(context);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => DrewNavigationBar()));

        });
      diplayImage=null;

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
