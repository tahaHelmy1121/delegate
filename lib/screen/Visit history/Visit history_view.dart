import 'package:delegate/core/helper/nodata.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../../provider/visits_provider.dart';
import '../chioce_point_add/choice_point.dart';
import '../finish_visit/finish_visit_view.dart';
import '../start_visit/start_visit.dart';

class VisitHistoryView extends StatefulWidget {
  const VisitHistoryView({super.key});

  @override
  State<VisitHistoryView> createState() => _VisitHistoryViewState();
}

class _VisitHistoryViewState extends State<VisitHistoryView> {
  var address;
  var lat;
  var lng;

  @override
  void initState() {
    getCurrentLocation().then((value) async {
      print('${value.latitude}********${value.longitude}');
      lat = value.latitude;
      lng = value.longitude;

      setState(() {});
    });
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell


          (
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ChoicePointView()));
            }, child: Icon(Icons.account_box_rounded)),
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "سجل الزيارات",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: ChangeNotifierProvider(
          create: (BuildContext context) => VisitsProvider(context: context),
          builder: (context, prov) {
            return context
                .watch<VisitsProvider>()
                .loadData
                ? SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: FittedBox(
                child: context
                    .watch<VisitsProvider>()
                    .visits!
                    .isEmpty
                    ? noDataFromApi(context: context)
                    : DataTable(
                    columns: [
                      DataColumn(
                        label: Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: const Text("العميل",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      DataColumn(
                          label: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: const Text("المنطقة",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                textAlign: TextAlign.center),
                          )),
                      DataColumn(
                          label: Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: const Text("صورة",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                textAlign: TextAlign.center),
                          )),
                      DataColumn(
                        label: Text(
                          textAlign: TextAlign.center,
                          "الحالة",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ],
                    columnSpacing: 55,
                    headingRowColor: MaterialStateProperty.all(
                        Colors.black.withOpacity(0.2)),
                    dataRowColor:
                    MaterialStateProperty.all(Colors.black),
                    dataRowHeight: 80,
                    border: TableBorder.all(
                      color: Colors.grey.shade300,
                      width: 1,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    rows: List.generate(
                        context
                            .watch<VisitsProvider>()
                            .visits!
                            .length, (index) {
                      return DataRow(
                          color: MaterialStateProperty.all(
                              index % 2 == 0
                                  ? Colors.white
                                  : Colors.grey),
                          cells: [
                            DataCell(
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width *
                                      0.4,
                                  child: Text(
                                    context
                                        .watch<VisitsProvider>()
                                        .visits![index]
                                        .clientname,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                            DataCell(
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width *
                                      0.2,
                                  child: Text(
                                    context
                                        .watch<VisitsProvider>()
                                        .visits![index]
                                        .clientareaname
                                        .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                            DataCell(
                              InkWell(
                                onTap: () {},
                                child: Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width *
                                        0.2,
                                    child: context
                                        .watch<
                                        VisitsProvider>()
                                        .visits![index]
                                        .image ==
                                        null
                                        ? Container()
                                        : Image.network(
                                      context
                                          .watch<
                                          VisitsProvider>()
                                          .visits![index]
                                          .image
                                          .toString(),
                                    )),
                              ),
                            ),
                            DataCell(
                              InkWell(
                                onTap: () {},
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        color: context
                                            .watch<
                                            VisitsProvider>()
                                            .visits![index]
                                            .newvisit ==
                                            "1"
                                            ? Colors.yellow
                                            : context
                                            .watch<
                                            VisitsProvider>()
                                            .visits![
                                        index]
                                            .newvisit ==
                                            "2"
                                            ? Colors
                                            .green.shade500
                                            : Colors.white),
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width *
                                        0.3,
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .height *
                                        0.0450,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    StartVisit(
                                                      visit_id: context
                                                          .read<
                                                          VisitsProvider>()
                                                          .visits![
                                                      index]
                                                          .id,
                                                      clientId: context
                                                          .read<
                                                          VisitsProvider>()
                                                          .visits![
                                                      index]
                                                          .clientid,
                                                    )));
                                      },
                                      child: context
                                          .watch<
                                          VisitsProvider>()
                                          .visits![index]
                                          .newvisit ==
                                          "0"
                                          ? Center(
                                        child: Text(
                                          "ابدا الزيارة",
                                          style: TextStyle(
                                              fontWeight:
                                              FontWeight
                                                  .bold,
                                              fontSize: 18),
                                        ),
                                      )
                                          : context
                                          .watch<
                                          VisitsProvider>()
                                          .visits![index]
                                          .newvisit ==
                                          "1"
                                          ? InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      finishVisit(
                                                        clientEreaName:
                                                        context
                                                            .read<
                                                            VisitsProvider>()
                                                            .visits![index]
                                                            .clientareaname,
                                                        image:
                                                        context
                                                            .read<
                                                            VisitsProvider>()
                                                            .visits![index]
                                                            .image,
                                                        visit_id:
                                                        context
                                                            .read<
                                                            VisitsProvider>()
                                                            .visits![index].id,
                                                        clientId:
                                                        context
                                                            .read<
                                                            VisitsProvider>()
                                                            .visits![index]
                                                            .clientid,
                                                      )));
                                        },
                                        child: Center(
                                          child: Text(
                                            "تم بدأ الزياره",
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight
                                                    .bold,
                                                fontSize:
                                                18),
                                          ),
                                        ),
                                      )
                                          : InkWell(
                                          onTap: () {},
                                          child: Center(
                                            child: Text(
                                              "تم نهاية الزيارة",
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight
                                                      .bold,
                                                  fontSize:
                                                  18),
                                            ),
                                          )),
                                    )),
                              ),
                            ),
                          ]);
                    })),
              ),
            )
                : Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ));
          },
        ),
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
