import 'package:flutter/material.dart';

navigatorToScreen(
    {required BuildContext context,
    required bool removeStack,
    required Widget widget}) {
  if (removeStack != true) {
    Navigator.push(context, PageRouteBuilder(pageBuilder: (context, anim, _) {
      return FadeTransition(
        opacity: anim,
        child: widget,
      );
    }));
  } else {
    Navigator.pushAndRemoveUntil(context, PageRouteBuilder(
      pageBuilder: (context, animation,_) {
        return FadeTransition(opacity: animation, child: widget);
      },
    ), (route) => false);
  }
}
