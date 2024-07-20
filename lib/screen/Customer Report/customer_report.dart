import 'package:flutter/material.dart';

import '../../core/theme/fonts.dart';
import '../../data_test.dart';
import '../start_visit/start_visit.dart';

class CustomerReport extends StatefulWidget {
  const CustomerReport({super.key});

  @override
  State<CustomerReport> createState() => _CustomerReportState();
}

class _CustomerReportState extends State<CustomerReport> {
  List<DataTest> status = [
    DataTest(status: "بدء الزيارة"),
    DataTest(status: " انهاءالزيارة"),
    DataTest(status: "تمت الزيارة"),
    DataTest(status: "بدا الزيارة"),
    DataTest(status: "نهاية الزيارة"),
    DataTest(status: " الزيارة"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "تقرير العميل",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.2,
          child: FittedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "العميل/ شريف عنتر :60000جنية",
                        style: TextStyles.font24BlackBold.copyWith(fontSize: 14),
                      )
                    ],
                  ),
                ),
                DataTable(
                    columns: [
                      DataColumn(
                        label: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: const Text("اجمالى مديونية العميل",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      DataColumn(
                        label: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: const Text("قيمة العملية",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      DataColumn(
                        label: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: const Text("نوع العملية",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      DataColumn(
                        label: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: const Text("تاريخ العملية",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                              textAlign: TextAlign.center),
                        ),
                      ),
                    ],
                    columnSpacing: 20,
                    dataRowColor: MaterialStateProperty.all(
                        Colors.grey.shade50.withOpacity(0.9)),
                    dataRowHeight: 80,
                    border: TableBorder.all(
                      color: Colors.black38,
                      width: 1,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    rows: List.generate(1, (index) {
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
                                  child: Text("5000")),
                            ),
                          ),
                        ),
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
                                  child: Text("5600جنية")),
                            ),
                          ),
                        ),
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
                                  child: Text("فاتورة بيع")),
                            ),
                          ),
                        ),
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
                                  child: Text("7/16/2024")),
                            ),
                          ),
                        ),
                      ]);
                    })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
