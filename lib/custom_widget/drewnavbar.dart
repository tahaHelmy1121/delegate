import 'package:delegate/screen/Customer%20Report/customer_report.dart';
import 'package:delegate/screen/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../screen/Attendance/Attendance_view.dart';
import '../screen/Customer Report/categories.dart';
import '../screen/Visit history/Visit history_view.dart';

class DrewNavigationBar extends StatefulWidget {

  const DrewNavigationBar({super.key});

  @override
  State<DrewNavigationBar> createState() => _DrewNavigationBarState();
}
var address;
var lat;
var lng;

@override

class _DrewNavigationBarState extends State<DrewNavigationBar> {
  void initState() {
    getCurrentLocation().then((value) async {
      print('${value.latitude}********${value.longitude}');
      lat = value.latitude;
      lng = value.longitude;

      setState(() {});
    });
    super.initState();
  }

  int currentIndex = 0;
static  List body = [
  VisitHistoryView(),
  CustomerReport(),
Categories(),
  Attendance(
    long:lng ,
    lat: lat,
    address:address ,
  ),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
       margin: EdgeInsets.only(bottom: 5),
        child: NavigationBar(
      height: 70,
          surfaceTintColor: Colors.grey,
          shadowColor: Colors.grey,
          backgroundColor: Colors.grey.shade100,
             destinations: [
         NavigationDestination(icon:Icon(Icons.history), label:"سجل الزيارات"),
         NavigationDestination(icon:Icon(Icons.report), label:"تقرير العميل") ,
         NavigationDestination(icon:Icon(Icons.category_sharp), label:"المخزن"),
               NavigationDestination(icon:Icon(Icons.add_chart), label:"سجل حضورك")
             ],
          selectedIndex: currentIndex,
          onDestinationSelected: (int index){
         setState(() {
           currentIndex = index;
         });
          },
        ),
      ),
      body: Center(
        child: body.elementAt(currentIndex),
      ),
    );
  }
}
Future<Position> getCurrentLocation() async {
  await Geolocator.requestPermission()
      .then((value) {})
      .onError((error, stackTrace) {
    print('error is $error');
  });
  return await Geolocator.getCurrentPosition();
}
