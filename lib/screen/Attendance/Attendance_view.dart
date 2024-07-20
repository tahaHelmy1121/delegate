

import 'package:flutter/material.dart';

import '../finish_visit/finish_visit_view.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => _AttendanceState();
}
String? address;
late double lat;
late double lng;

class _AttendanceState extends State<Attendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "سجل الحضور",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5)),
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(

                      child: Image.asset(
                        "assets/images/attendance-icon-13.jpg",
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.3,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(14),
                  child: Column(
                    children: [
                      Stack(
                        children: [

                        ],
                      ),
                      SizedBox(height: 40,),
                      InkWell(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder:(_)=>finishVisit()));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Center(
                              child: Center(
                                  child: Text(
                                    "سجل حضورك",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold),
                                  ))),
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      )
                    ],
                  ),
                  margin: EdgeInsets.only(right: 20, top:MediaQuery.of(context).size.height*.250),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.6,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
