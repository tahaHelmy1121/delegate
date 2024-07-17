import 'package:delegate/screen/Customer%20Report/customer_report.dart';
import 'package:delegate/screen/profile/profile.dart';
import 'package:flutter/material.dart';

import '../screen/Visit history/Visit history_view.dart';

class DrewNavigationBar extends StatefulWidget {
  const DrewNavigationBar({super.key});

  @override
  State<DrewNavigationBar> createState() => _DrewNavigationBarState();
}

class _DrewNavigationBarState extends State<DrewNavigationBar> {
  int currentIndex = 0;
static  List body = [
  VisitHistoryView(),
  CustomerReport(),
  ProfileView(),
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
         NavigationDestination(icon:Icon(Icons.person), label:"الملف الشخصى")

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
