
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../core/helper/app_url.dart';
import '../../core/helper/showerrorconnection.dart';
import '../model/start_visit.dart';

import 'dart:io';

class StartVisitRepo {
  static startVisitRepo({
    required BuildContext context,
    userId,
    visit_id,
    clientid,
    start_lat,
    start_long,

    required File pickedImage,
  }) async {
    StartVisitModel? startVisitModel;


    var uri = Uri.parse(startVisit); // Replace with your API endpoint
    var request = http.MultipartRequest('POST', uri);

    request.fields['user_id'] = userId.toString();
    request.fields['visit_id'] = visit_id.toString();
    request.fields['clientid'] = clientid.toString();
    request.fields['start_lat'] = start_lat.toString();
    request.fields['start_long'] = start_long.toString();
    request.files.add(
      await http.MultipartFile.fromPath(
        'imageendvisit',
        pickedImage.path,

      ),

    );
      request.fields.forEach((key, value) {
        print(key);
        print(value);
   print("File");
   print(pickedImage.path);
      });
  var response = await http.Response.fromStream(await request.send());
    if (response.statusCode == 200) {

      print('Image uploaded successfully!');
    } else {
      print("xxxxxxxxxxxxxxxxxxxxxxxxx");
      print('Image upload failed. Status code: ${response.statusCode}');
    }

    if (response.statusCode == 200) {
      return startVisitModel = startVisitFromJson(response.body);
    } else {
      return showErrorConnection(context: context, error: "حدث خطأ");
    }
  }
}
