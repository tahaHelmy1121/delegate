
import 'dart:convert';

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

    required  pickedImage,
  }) async {

    StartVisitModel? startVisitModel;
    Map<String,dynamic> body = {
      'user_id': userId,
      "visit_id": visit_id,
      'clientid': clientid,
      'imageendvisit': pickedImage,
      'start_lat': start_lat,
      'start_long': start_long,

    };
    var response = await http.post(Uri.parse(startVisit),body: jsonEncode(body));
    if (response.statusCode == 200) {

      return startVisitModel = startVisitFromJson(response.body);
    } else {

      print('Image upload failed. Status code: ${response.statusCode}');
    }

  }
}
