import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../../../provider/addnewpoint_provider.dart';

class AddNewPointView extends StatefulWidget {
  const AddNewPointView({super.key});

  @override
  State<AddNewPointView> createState() => _AddNewPointViewState();
}

class _AddNewPointViewState extends State<AddNewPointView> {
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
      body: ChangeNotifierProvider(
        create: (BuildContext context) => GetAddPointProvider(context: context),
        builder: (context, prov) {
          return context.watch<GetAddPointProvider>().loading
              ? SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.2)),
                              ),
                              child: Image.asset(
                                "assets/images/vvv.png",
                                width: MediaQuery.of(context).size.width * .5,
                                height: MediaQuery.of(context).size.height * .2,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                "خط السير",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: DropdownButtonFormField(
                                alignment: Alignment.center,
                                isExpanded: true,
                                padding: const EdgeInsets.all(10),
                                value: context
                                    .watch<GetAddPointProvider>()
                                    .ereaSelected,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  border: InputBorder.none,
                                ),
                                items: context
                                    .watch<GetAddPointProvider>()
                                    .clienterea!
                                    .map((value) {
                                  return DropdownMenuItem(
                                    value: value.id,
                                    child: Text(
                                      value.text.toString(),
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                      maxLines: 1,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (v) async {
                                  context
                                      .read<GetAddPointProvider>()
                                      .ereaSelected = v;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                "فئة المحل",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                  context.watch<GetAddPointProvider>().shoploading?      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: DropdownButtonFormField(
                                alignment: Alignment.center,
                                isExpanded: true,
                                padding: const EdgeInsets.all(10),
                                value: context
                                    .watch<GetAddPointProvider>()
                                    .shopSelected,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  border: InputBorder.none,
                                ),
                                items: context
                                    .watch<GetAddPointProvider>()
                                    .shopCategories!
                                    .map((value) {
                                  return DropdownMenuItem(
                                    value: value.id,
                                    child: Text(
                                      value.shopcat.toString(),
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                      maxLines: 1,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (v) async {
                                  context
                                      .read<GetAddPointProvider>()
                                      .shopSelected = v;
                                },
                              ),
                            ),
                          ],
                        ):Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.650,
                                  child: drewMobileInput(
                                      height: 60, context: context)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.650,
                                  child: drewNameShopInput(
                                      height: 60, context: context)),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                getCurrentLocation().then((value) async {
                                  lat = value.latitude;
                                  lng = value.longitude;
                                }).then((value) => context
                                    .read<GetAddPointProvider>()
                                    .addPointFromRepo(
                                        lat: lat, lng: lng, ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: Text(
                                  "تسجيل نقطة بيع جديدة",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                                margin: EdgeInsets.all(25),
                                width: MediaQuery.of(context).size.width * .4,
                                height: 45,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "اضافة نقطة بيع",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

Widget drewMobileInput(
    {required double height, required BuildContext context, var mobile}) {
  return TextFormField(
     controller: context.watch<GetAddPointProvider>().phoneController,
    keyboardType: TextInputType.number,
    autofocus: false,
    decoration: InputDecoration(
      errorStyle: TextStyle(
          fontSize: 12, color: Colors.red, fontWeight: FontWeight.bold),
      hintText: "ادخل رقم الهاتف",
      hintStyle: TextStyle(
        color: Colors.black,
      ),
      filled: true,
      border: InputBorder.none,
      suffixIcon: Icon(Icons.phone, color: Colors.grey),
    ),
  );
}

Widget drewNameShopInput(
    {required double height, required BuildContext context, var mobile}) {
  return TextFormField(
     controller: context.watch<GetAddPointProvider>().shopNameController,
    keyboardType: TextInputType.name,
    autofocus: false,
    decoration: InputDecoration(
      errorStyle: TextStyle(
          fontSize: 12, color: Colors.red, fontWeight: FontWeight.bold),
      hintText: "اسم المحل",
      hintStyle: TextStyle(
        color: Colors.black,
      ),
      filled: true,
      border: InputBorder.none,
      suffixIcon: Icon(Icons.shop_2_outlined, color: Colors.grey),
    ),
  );
}

Future<Position> getCurrentLocation() async {
  await Geolocator.requestPermission()
      .then((value) {})
      .onError((error, stackTrace) {
    print('error is $error');
  });
  return await Geolocator.getCurrentPosition();
}
