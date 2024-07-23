import 'package:flutter/material.dart';

noDataFromApi({required BuildContext context}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/no-data-old.png",
          fit: BoxFit.contain,
          height: MediaQuery.of(context).size.height * .10,
          width: MediaQuery.of(context).size.width * .60,
        ),
        SizedBox(
          height: 5,
        ),
        Text("لايوجد زيارات", style: TextStyle(fontSize: 14))
      ],
    ),
  );
}
