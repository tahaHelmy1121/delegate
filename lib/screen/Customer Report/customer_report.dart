import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/client_provider.dart';

class CustomerReport extends StatefulWidget {
  CustomerReport({
    super.key,
  });

  @override
  State<CustomerReport> createState() => _CustomerReportState();
}

class _CustomerReportState extends State<CustomerReport> {
  @override
  Widget build(BuildContext context) {
    final Random _random = Random();

    Color _getRandomColor() {
      return Color.fromARGB(
        255,
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
      );
    }

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text(
            "تقرير العملاء",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        body: SingleChildScrollView(
          child: ChangeNotifierProvider(
            create: (BuildContext context) => ClientProvider(context: context),
            builder: (context, prov) {
              return SingleChildScrollView(
                  child: context.watch<ClientProvider>().reportLoad
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            child: Column(
                              children: [
                                FittedBox(
                                  child: DataTable(
                                      columns: [
                                        DataColumn(
                                          label: Padding(
                                            padding: EdgeInsets.only(left: 15),
                                            child: const Text(" العميل",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                                textAlign: TextAlign.center),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Padding(
                                            padding: EdgeInsets.only(left: 15),
                                            child: const Text(" مديونية العميل",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                                textAlign: TextAlign.center),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Padding(
                                            padding: EdgeInsets.only(left: 15),
                                            child: const Text("حد الدين",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                                textAlign: TextAlign.center),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Container(
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 15),
                                              child: const Text("الدين المتبقى",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                  textAlign: TextAlign.center),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Padding(
                                            padding: EdgeInsets.only(left: 15),
                                            child: const Text(
                                                "تاريخ اخر فاتورة",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                                textAlign: TextAlign.center),
                                          ),
                                        ),
                                      ],
                                      columnSpacing:15,
                                      headingRowColor: MaterialStateProperty.all(Colors.black.withOpacity(0.2)),
                                      dataRowColor: MaterialStateProperty.all(
                                          Colors.black),
                                      dataRowHeight: 85,
                                      border: TableBorder.all(
                                        color: Colors.grey.shade300,
                                        width: 1,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      rows: List.generate(
                                          context
                                              .watch<ClientProvider>()
                                              .customerReport
                                              .length, (index) {
                                        final randomColor = _getRandomColor();
                                        return DataRow(
                                            color: MaterialStateProperty.all(
                                                index % 2 == 0
                                                    ? Colors.white
                                                    : Colors.grey),
                                            cells: [
                                              DataCell(Container(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    context
                                                        .watch<
                                                            ClientProvider>()
                                                        .customerReport[index]
                                                        .clientname!
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              )),
                                              DataCell(
                                                Container(
                                                  alignment:
                                                      Alignment.center,
                                                  width:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.4,
                                                  child: Text(
                                                    context
                                                        .watch<
                                                            ClientProvider>()
                                                        .customerReport[
                                                            index]
                                                        .clientdebt
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              DataCell(
                                                Container(
                                                  alignment:
                                                      Alignment.center,
                                                  width:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.4,
                                                  child: Text(
                                                    context
                                                        .watch<
                                                            ClientProvider>()
                                                        .customerReport[
                                                            index]
                                                        .debtlimit
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              DataCell(
                                                Container(
                                                  alignment:
                                                      Alignment.center,
                                                  width:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.3,
                                                  child: context
                                                              .watch<
                                                                  ClientProvider>()
                                                              .customerReport![
                                                                  index]
                                                              .residual ==
                                                          null
                                                      ? Text("")
                                                      : Text(
                                                          context
                                                              .watch<
                                                                  ClientProvider>()
                                                              .customerReport![
                                                                  index]
                                                              .residual
                                                              .toString(),
                                                          style: TextStyle(
                                                            fontSize: 22,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                          ),
                                                        ),
                                                ),
                                              ),
                                              DataCell(
                                        Container(
                                        alignment:
                                        Alignment.center,
                                        width:
                                        MediaQuery.of(context)
                                            .size
                                            .width *
                                        0.5,
                                        child: context
                                            .watch<
                                        ClientProvider>()
                                            .customerReport[
                                        index]
                                            .lastsellbilldate ==
                                        null
                                        ? Text("")
                                            : Text(
                                        context
                                            .watch<
                                        ClientProvider>()
                                            .customerReport[
                                        index]
                                            .lastsellbilldate
                                            .toString(),
                                        style: TextStyle(
                                        fontSize: 22,
                                        fontWeight:
                                        FontWeight
                                            .bold,
                                        ),
                                        ),
                                        ),
                                                ),

                                            ]);
                                      })),
                                )
                              ],
                            ),
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(
                          color: Colors.black,
                        )));
            },
          ),
        ));
  }
}

class StickyColors {
  static final List<Color> colors = [
    const Color(0xffB85252),
    const Color(0xffB4C6A6),
    const Color(0xffF4ABC4),
    const Color(0xff346751),
    const Color(0xffFFC947),
    const Color(0xff3282B8),
  ];
}
