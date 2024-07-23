import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:delegate/provider/start_visit_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class StartVisit extends StatefulWidget {
  var startlat;
  var startlong;
  var clientId;
  var visit_id;

  StartVisit(
      {super.key, this.clientId, this.startlat, this.startlong, this.visit_id});

  @override
  State<StartVisit> createState() => _StartVisitState();
}

class _StartVisitState extends State<StartVisit> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "بدا الزيارة",
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
                        "assets/images/recieved.png",
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.3,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(14),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                child: InkWell(
                                  onTap: () {
                               context.read<StartVisitProvider>().uploadSingleImage();
                                  },
                                  child:context.watch<StartVisitProvider>().diplayImage==null?Image.asset("assets/images/R (1).png"): Image.file(
    context.watch<StartVisitProvider>().diplayImage!,
                                    width: MediaQuery.of(context).size.width * 0.3,
                                    height: 100,
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Image.asset("assets/images/Edit.png"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            onTap: () {
                              context.read<StartVisitProvider>().getSatrtVisit(
                                  context: context,
                                  clientId: widget.clientId,
                                  startLat: widget.startlat,
                                  startLong: widget.startlong,
                                  visit_id: widget.visit_id);
                            },
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
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .255),
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
          ],
        ),
      ),
    );
  }
}
