import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';





AwesomeDialog drewAwesomeDialog({required BuildContext context,required DialogType dialogType,var describe})=>AwesomeDialog(
    dismissOnBackKeyPress: false,

    context: context,
    dialogType: dialogType,
    animType: AnimType.rightSlide,
    desc: describe,
    autoHide: Duration(seconds: 3));

