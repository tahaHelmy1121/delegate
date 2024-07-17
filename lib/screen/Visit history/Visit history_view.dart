import 'package:delegate/generated/assets.dart';
import 'package:flutter/material.dart';

import '../../data_test.dart';
import '../Attendance/Attendance_view.dart';
import '../start_visit/start_visit.dart';

class VisitHistoryView extends StatefulWidget {
  const VisitHistoryView({super.key});

  @override
  State<VisitHistoryView> createState() => _VisitHistoryViewState();
}

class _VisitHistoryViewState extends State<VisitHistoryView> {
  List<DataTest> status = [
    DataTest(status: "بدء الزيارة"),
    DataTest(status: " انهاءالزيارة"),
    DataTest(status: "تمت الزيارة"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder:(_)=>Attendance()));
          },
            child: Icon(
          Icons.add_chart,
          color: Colors.white,
        )),
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "سجل الزيارات",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.3,
          child: FittedBox(
            child: DataTable(
                columns: [
                  DataColumn(
                    label: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.verified_outlined),
                        )),
                  ),
                  DataColumn(
                      label: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: const Text("صورة",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                        textAlign: TextAlign.center),
                  )),
                  DataColumn(
                      label: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: const Text("المنطقة",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                        textAlign: TextAlign.center),
                  )),
                  DataColumn(
                    label: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: const Text("العميل",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                          textAlign: TextAlign.center),
                    ),
                  ),
                ],
                columnSpacing: 80,
                dataRowColor: MaterialStateProperty.all(
                    Colors.grey.shade50.withOpacity(0.9)),
                dataRowHeight: 80,
                border: TableBorder.all(
                  color: Colors.black38,
                  width: 1,
                  borderRadius: BorderRadius.circular(30),
                ),
                rows: List.generate(3, (index) {
                  return DataRow(cells: [
                    DataCell(
                      InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => StartVisit()));
                              },
                              child: Text(status[index].status.toString())),
                        ),
                      ),
                    ),
                    DataCell(
                      InkWell(
                        onTap: () {},
                        child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child:
                                Image.asset(Assets.imagesFBrB7lHXsAM36lv)),
                      ),
                    ),
                    DataCell(
                      InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Text("المنصورة"),
                        ),
                      ),
                    ),
                    DataCell(
                      InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Text("gt4"),
                        ),
                      ),
                    ),
                  ]);
                })),
          ),
        ),
      ),
    );
  }
}
