import 'package:delegate/core/helper/nodata.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../../core/theme/fonts.dart';
import '../../provider/visits_provider.dart';
import '../Attendance/Attendance_view.dart';
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

  void initState() {
    super.initState();
    getCurrentLocation().then((value) async {
      print('${value.latitude}********${value.longitude}');
      lat = value.latitude;
      lng = value.longitude;
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      print('111111${placemarks}111111');
      Placemark place = placemarks[0];
      address = '${place.street} ,  ${place.country}';
      print(address.toString());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>
                          Attendance(
                            lat: lat,
                            long: lng,
                            address: address,
                          )));
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
                    rows: List.generate(
                        context
                            .watch<VisitsProvider>()
                            .visits!
                            .length, (index) {
                      return DataRow(cells: [
                        DataCell(
                          InkWell(
                            onTap: () {},
                            child: Container(
                                alignment: Alignment.center,
                                width:
                                MediaQuery
                                    .of(context)
                                    .size
                                    .width *
                                    0.2,
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
                                                        .visits![index]
                                                        .id,
                                                    clientId: context
                                                        .read<
                                                        VisitsProvider>()
                                                        .visits![index]
                                                        .clientid,
                                                    startlong: lng,
                                                    startlat: lat,
                                                  )));
                                    },
                                    child: context
                                        .watch<VisitsProvider>()
                                        .visits![index].newvisit == "0" ? Text(
                                        "ابدا الزيارة") : context
                                        .watch<VisitsProvider>()
                                        .visits![index].newvisit == "1" ? InkWell(
                                      onTap: (){
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    finishVisit(
                                    
                                                    )));
                                      },
                                          child: Text(
                                          "تم بدأ الزياره"),
                                        ): Text("تم نهاية الزيارة"),)
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
                                    .watch<VisitsProvider>()
                                    .visits![index]
                                    .image ==
                                    null
                                    ? Container()
                                    : Image.network(context
                                    .watch<VisitsProvider>()
                                    .visits![index]
                                    .image
                                    .toString())),
                          ),
                        ),
                        DataCell(
                          InkWell(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.center,
                              width:
                              MediaQuery
                                  .of(context)
                                  .size
                                  .width *
                                  0.2,
                              child: Text(context
                                  .watch<VisitsProvider>()
                                  .visits![index]
                                  .governmentname
                                  .toString()),
                            ),
                          ),
                        ),
                        DataCell(
                          InkWell(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.center,
                              width:
                              MediaQuery
                                  .of(context)
                                  .size
                                  .width *
                                  0.2,
                              child: Text(context
                                  .watch<VisitsProvider>()
                                  .visits![index]
                                  .clientname),
                            ),
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
