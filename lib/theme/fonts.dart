import 'package:flutter/material.dart';

import 'colors/colors.dart';

class TextStyles {
  static TextStyle font24BlackBold = TextStyle(
    fontSize: 24,
    fontWeight:  FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle font32BlueBold = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: ColorsManager.mainBlue,
  );

  static TextStyle font13BlueSemiBold = TextStyle(
    fontSize: 13,
    fontWeight:  FontWeight.bold,
    color: ColorsManager.mainBlue,
  );
}