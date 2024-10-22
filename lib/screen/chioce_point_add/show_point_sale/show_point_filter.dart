import 'package:delegate/provider/addnewpoint_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowPointSale extends StatefulWidget {
  var pointSale;

  ShowPointSale({
    required this.pointSale,
    super.key,
  });

  @override
  State<ShowPointSale> createState() => _ShowPointSaleState();
}

class _ShowPointSaleState extends State<ShowPointSale> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text(
            "خط السير",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        body: SingleChildScrollView(
          child: ChangeNotifierProvider(
            create: (BuildContext context) => GetAddPointProvider(
                context: context, clientereaId: widget.pointSale),
            builder: (context, prov) {
              return SingleChildScrollView(
                  child: context.watch<GetAddPointProvider>().loading
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            child: Column(
                              children: [
                                FittedBox(
                                  child: DataTable(
                                    headingRowHeight: 80,

                                      columns: [
                                        DataColumn(
                                          headingRowAlignment: MainAxisAlignment.center,
                                          label: const Text("اسم المحل",
                                              style: TextStyle(
                                                  fontSize: 45,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                              textAlign: TextAlign.center),
                                        ),
                                        DataColumn(
                                          headingRowAlignment: MainAxisAlignment.center,
                                          label: const Text(" رقم الاتصال",
                                              style: TextStyle(
                                                  fontSize: 45,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                              textAlign: TextAlign.center),
                                        ),
                                        DataColumn(
                                          headingRowAlignment: MainAxisAlignment.center,
                                          label: const Text("فئة المحل ",
                                              style: TextStyle(
                                                  fontSize: 45,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                              textAlign: TextAlign.center),
                                        ),
                                        DataColumn(
                                          headingRowAlignment: MainAxisAlignment.center,
                                          label: const Text("التسجيل ",
                                              style: TextStyle(
                                                  fontSize: 45,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                              textAlign: TextAlign.center),
                                        ),
                                        DataColumn(
                                          headingRowAlignment: MainAxisAlignment.center,
                                          label: const Text("الموقع ",
                                              style: TextStyle(
                                                  fontSize: 45,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                              textAlign: TextAlign.center),
                                        ),
                                      ],

                                      dataRowColor: MaterialStateProperty.all(
                                          Colors.grey.withOpacity(0.2)),
                                      dataRowMaxHeight: 280,
                                      border: TableBorder.all(
                                        color: Colors.grey.shade300,
                                        width: 4,
                                        borderRadius: BorderRadius.circular(35),
                                      ),
                                      rows: List.generate(
                                          context
                                              .watch<GetAddPointProvider>()
                                              .getRegisterNewPoint!
                                              .length, (index) {
                                        return DataRow(cells: [
                                          DataCell(

                                            Text(
                                              context
                                                  .watch<GetAddPointProvider>()
                                                  .getRegisterNewPoint![index]
                                                  .shopname
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 40,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          DataCell(
                                            context
                                                        .watch<
                                                            GetAddPointProvider>()
                                                        .getRegisterNewPoint![
                                                            index]
                                                        .contactnumber ==
                                                    null
                                                ? Text("")
                                                : Text(
                                                    context
                                                        .watch<
                                                            GetAddPointProvider>()
                                                        .getRegisterNewPoint![
                                                            index]
                                                        .contactnumber
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 40,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                          ),
                                          DataCell(
                                            context
                                                        .watch<
                                                            GetAddPointProvider>()
                                                        .getRegisterNewPoint![
                                                            index]
                                                        .shopcat ==
                                                    null
                                                ? Text("")
                                                : Text(
                                                    context
                                                        .watch<
                                                            GetAddPointProvider>()
                                                        .getRegisterNewPoint![
                                                            index]
                                                        .shopcat
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 40,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                          ),
                                          DataCell(
                               context.watch<GetAddPointProvider>().getRegisterNewPoint![index].recordreg == "0"
                                   ? InkWell(
                                 onTap: () {
                                   context.read<GetAddPointProvider>().addpointFromRepo(
                                     regpointssaleid: context.read<GetAddPointProvider>().getRegisterNewPoint![index].id,
                                   );
                                 },
                                 child: Container(


                                   child: Center(
                                     child: Text(
                                       "سجل نقطة بيع",
                                       style: TextStyle(fontSize: 40, color: Colors.white),
                                     ),
                                   ),
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(15),
                                     color: Colors.green,
                                   ),
                                   height: 65,

                                   width: MediaQuery.of(context).size.width * 0.750,
                                 ),
                               )
                                   : Container(
                                 width: MediaQuery.of(context).size.width * 0.750,
                                 child: Center(
                                   child: Text(
                                     "تم التسجيل",
                                     style: TextStyle(fontSize: 30, color: Colors.white),
                                   ),
                                 ),
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(15),
                                   color: Colors.red,
                                 ),

                                 height: 65,                               ),
                                          ),
                                          DataCell(
                                           InkWell(
                                             onTap: () {
                                               final provider = context.read<GetAddPointProvider>();
                                               final point = provider.getRegisterNewPoint![index];

                                               if (point.lat == null || point.long == null) {
                                                 // Show Snackbar if latitude or longitude is null
                                                 ScaffoldMessenger.of(context).showSnackBar(
                                                   SnackBar(
                                                     content: Text('Latitude or longitude is not available.'),
                                                     duration: Duration(seconds: 2),
                                                   ),
                                                 );
                                               } else {
                                                 launchGoogleMaps(
                                                   latitude: point.lat,
                                                   longitude: point.long,
                                                 );
                                               }
                                             },
                                              child: Container(


                                                child: Center(
                                                  child: Text(
                                                    "الموقع",
                                                    style: TextStyle(fontSize: 40, color: Colors.white),
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(15),
                                                  color: Colors.green,
                                                ),
                                                height: 65,

                                                width: MediaQuery.of(context).size.width * 0.750,
                                              ),
                                            )

                                          )
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
}//

void launchGoogleMaps({latitude,  longitude}) async {
  var urlX = "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";
  if (await canLaunchUrl(Uri.parse(urlX))) {
    await launchUrl(Uri.parse(urlX));
  } else {
    throw 'Could not launch $urlX';
  }
}