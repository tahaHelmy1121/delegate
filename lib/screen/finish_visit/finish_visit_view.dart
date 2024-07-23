import 'package:flutter/material.dart';

import '../../core/theme/fonts.dart';

class finishVisit extends StatefulWidget {
  var startlat;
  var startlong;
  var clientId;
  var visit_id;
  var image;

  finishVisit(
      {super.key,
      this.image,
      this.startlat,
      this.startlong,
      this.clientId,
      this.visit_id});

  @override
  State<finishVisit> createState() => _finishVisitState();
}

class _finishVisitState extends State<finishVisit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "انهاء  الزيارة",
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
                    Column(
                      children: [
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                           widget.image,
                              fit: BoxFit.contain,
                              width: MediaQuery.of(context).size.width * 0.4,
                              height:
                                  MediaQuery.of(context).size.height * 0.250,
                            ),
                          ),
                        ),
                        Text(
                          "groceryبقالة",
                          style: TextStyles.font24BlackBold
                              .copyWith(color: Colors.black, letterSpacing: 2),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(14),
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .300),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Column(
                        children: [
                          Container(
                            child: DropdownMenu(
                                hintText: "اختر حالة الزيارة",
                                width: MediaQuery.of(context).size.width * 0.8,
                                inputDecorationTheme: InputDecorationTheme(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(35),
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade300,
                                        )),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(40))),
                                dropdownMenuEntries: [
                                  DropdownMenuEntry(value: "gt4", label: "gt4")
                                ]),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "ادخل الملاحظة";
                              }
                              return null;
                            },
                            controller: TextEditingController(),
                            maxLines: 5,
                            decoration: InputDecoration(
                              labelText: "ملاحظة",
                              labelStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.grey.shade200)),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.grey.shade200)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.black.withOpacity(0.3))),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Center(
                                  child: Center(
                                      child: Text(
                                "حفظ",
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
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
